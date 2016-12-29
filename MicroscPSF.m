function PSF = MicroscPSF(params)
%MICROPSF Compute the 3D PSF model described by Gibson and Lanni (JOSA 1992).
%   PSF = MICROPSF(params) return a 3D PSF given parameters
%
%   Parameters include:
%   (1) image properties
%           'size'  -  the size of the 3D PSF, e.g. params.size = [256 256 128];
%   (2) precision control
%           'numBasis'      - the number of approximation basis, default 'size(1)/2'
%           'numSamp'       - the number of sampling to determine the basis coefficients
%           'fastcom'       - fast approximation of Bessel functions, default 0
%           'overSampling'  - the oversampling ratio, default 2
%   (3) microscope parameters
%           'NA'            - numerical aperture of the microscope
%           'lambda'        - Emission wavelength in vacuum
%           'M'             - magnification factor
%           'ns'            - specimen refractive index
%           'ng0'           - coverslip refractive index, design value
%           'ng'            - coverslip refractive index, experimental
%           'ni0'           - immersion refractive index, design
%           'ni'            - immersion refractive index, experimental
%           'ti0'           - working distance of the objective, design
%           'tg0'           - coverslip thickness, design value
%           'tg'            - coverslip thickness, experimental value
%           'resLateral'    - lateral pixel size
%           'resAxial'      - axial pixel size
%           'pZ'            - position of particle
%
%   Reference:
%       [1] Gibson, S.F. & Lanni, F., 1992.
%           Experimental test of an analytical model of aberration in an
%           oil-immersion objective lens used in three-dimensional light
%           microscopy. JOSA A, 9(1), pp.154-166.
%       [2] Li, J., Luisier, F. and Blu, T. Fast and accurate 3D PSF
%           computation in fluorescence microscopy. JOSA A. Submitted.
%
%   See also AUX_BESSEL, AUX_SHOWPSF

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Dec, 2016

warning off;
if ~isfield(params,'size')
    error('Please set the size of PSF model');
end

size = params.size;
params.nx = size(1);
params.ny = size(2);
params.nz = size(3);

%% default parameters
if ~isfield(params,'numBasis')
    params.numBasis = floor(params.nx/2);
end
if ~isfield(params,'numSamp')
    params.numSamp = 500;
end
if ~isfield(params,'fastcom')
    params.fastcom = 0;
end
if ~isfield(params,'overSampling')
    params.overSampling = 2;
end
if ~isfield(params,'NA')
    params.NA = 1.4;
end
if ~isfield(params,'lambda')
    params.lambda = 610e-9;
end
if ~isfield(params,'M')
    params.M = 100;
end
if ~isfield(params,'ns')
    params.ns = 1.33;
end
if ~isfield(params,'ng0')
    params.ng0 = 1.5;
end
if ~isfield(params,'ng')
    params.ng = 1.5;
end
if ~isfield(params,'ni0')
    params.ni0 = 1.5;
end
if ~isfield(params,'ni')
    params.ni = 1.5;
end
if ~isfield(params,'ti0')
    params.ti0 = 150e-6;
end
if ~isfield(params,'tg0')
    params.tg0 = 170e-6;
end
if ~isfield(params,'tg')
    params.tg = 170e-6;
end
if ~isfield(params,'resLateral')
    params.resLateral = 100e-9;
end
if ~isfield(params,'resAxial')
    params.resAxial = 250e-9;
end
if ~isfield(params,'pZ')
    params.pZ = 2000e-9;
end

x0 = (params.nx-1)/2;
y0 = (params.ny-1)/2;
xp = x0; yp=y0;
maxRadius = round(sqrt((params.nx - x0).^2 + (params.ny - y0).^2)) + 1;
R = [0:params.overSampling*maxRadius-1]./params.overSampling;
[X,Y] = meshgrid(0:params.nx-1,0:params.ny-1);
rPixel = sqrt((X-xp).^2 + (Y-yp).^2);
index = floor(rPixel*params.overSampling);
disR = (rPixel - R(index+1))*params.overSampling;

Ti = params.ti0 + params.resAxial*([0:params.nz-1] - ((params.nz - 1.0) / 2.0));

a = 0;
b = min(1, params.ns/params.NA);
L = params.numSamp;

Rho = linspace(a,b,L)';

%% 1. approximate function exp(iW) as Bessel series
fastcom = params.fastcom;
NN = params.numBasis;
k0 = 2*pi/params.lambda;

r = R*params.resLateral;

A = k0*params.NA*r;
A2 = A.^2;

Ab = A.*b;

%%%%%%%
% min wavelength
k00 = 2*pi/(300e-9);
factor1 = k0./k00;
% max numerical aperture
NA0 = 1.4;
factor2 = params.NA./NA0;
%%%%%%%
an = (3*[1:NN]-2)*2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
an = an.*(factor1)*(factor2);

anRho = bsxfun(@times,an,Rho);
J = funBessel0(fastcom, anRho);

J0A = funBessel0(fastcom, Ab);
J1A = A.*funBessel1(fastcom, Ab);

anJ0A = bsxfun(@times,J0A,an');
anb = an.*b;
an2 = an.^2;
B1anb = funBessel1(fastcom, anb);
B0anb = funBessel0(fastcom, anb);

Ele = bsxfun(@times,anJ0A,B1anb') - bsxfun(@times,J1A,B0anb');
domin = bsxfun(@minus, an2', A2);
Ele = Ele.*b./domin;

C1 = params.ns*params.pZ;
C2 = params.ni*(Ti - params.ti0);
C3 = params.ng*(params.tg - params.tg0);

OPDs = C1*sqrt(1-(params.NA*Rho/params.ns).^2);
OPDi = bsxfun(@times, C2,sqrt(1-(params.NA*Rho/params.ni).^2));
OPDg = C3*sqrt(1-(params.NA*Rho/params.ng).^2);

OPD = bsxfun(@plus, OPDi, OPDs+OPDg);

W = k0*OPD;
Ffun = cos(W) + 1i*sin(W);
Ci = J\Ffun;

%% 2. get PSF in each slice
ciEle = Ele'*Ci;

PSF0 = abs(ciEle).^2;

index1 = index+1;
index2 = index+2;
disR1 = 1-disR;

%% 3. apply axial asymmetry
for zi = 1:params.nz
    h = PSF0(:,zi);
    slice = h(index2).*disR +  h(index1).*disR1;
    PSF(:,:,zi) = slice;
end

PSF = PSF./max(PSF(:));

end

function J = funBessel0(fastcom, X)
if(fastcom)
    J = aux_Bessel(0,X);
    J = reshape(J, size(X));
else
    J = besselj(0, X);
end
end

function J = funBessel1(fastcom, X)
if(fastcom)
    J = aux_Bessel(1,X);
    J = reshape(J, size(X));
else
    J = besselj(1, X);
end
end

