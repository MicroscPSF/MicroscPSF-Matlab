function PSF = aux_GTgenerator(params)
%AUX_GTGENERATOR Generate the ground truth for 3D PSF model described by Gibson and Lanni (JOSA 1992), using Simpson rule.
%
%   Parameters include:
%   (1) image properties
%           'size'  -  the size of the 3D PSF, e.g. params.size = [256 256 128];
%   (2) precision control
%           'numInterval'   - the number of interval, larger is better
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
%           microscopy. JOSA A, 9(1), pp.154?166.
%
%   See also MicroPSF, AUX_SHOWPSF

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

if ~isfield(params,'size')
    error('Please set the size of PSF model');
end

size = params.size;
params.nx = size(1);
params.ny = size(2);
params.nz = size(3);

%% default parameters
if ~isfield(params,'numInterval')
    params.numInterval = 10000000;
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

%% computing the integral
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

for zi = 0:params.nz-1
    params.ti = Ti(zi+1);
    % the profile of one direction, taking use of the symmetric property
    h = elePSF(params,R*params.resLateral);
    slice = h(index+1) + (h(index + 2) - h(index+1)).* disR;
    PSF(:,:,zi+1) = slice;
    disp(['Slice: ' num2str(zi+1) '/' num2str(params.nz)]);
end

PSF = PSF./max(PSF(:));
end

function Integral = elePSF(params,r)
% Using Simpson rule to compute the integral

a = 0;
b = min(1, params.ns/params.NA);

numInterval = params.numInterval;

del = (b-a)/numInterval;

valueX0 = integrand(params,a, r);
valueXn = integrand(params,b, r);

sumEven = 0;
% even term
for i = 1: numInterval/2-1
    rho = a + (2*i)*del;
    sumEven = sumEven + integrand(params,rho,r);
end

sumOdd = 0;
% odd term
for i = 1: numInterval/2
    rho = a + (2*i-1)*del;
    sumOdd = sumOdd + integrand(params,rho,r);
end

Sum = valueX0 + 2*sumEven + 4*sumOdd + valueXn;
Integral = (abs(Sum.^2))*del*del;

end

function val = integrand(params,rho, r)

k0 = 2*pi/(params.lambda);
BesselValue = besselj(0, k0*params.NA*r*rho);
OPDs = params.ns*params.pZ*sqrt(1-(params.NA*rho/params.ns)^2);
OPDi = params.ni*(params.ti - params.ti0)*sqrt(1-(params.NA*rho/params.ni)^2);
OPD = OPDs + OPDi;
W = k0*OPD;
val = BesselValue*cos(W)*rho + 1i*BesselValue*sin(W)*rho;

end

