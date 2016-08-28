%% Fig.3 Plots of PSNRs for different basis functions.

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016

addpath('../Utilities/');
addpath('../../PSF Approximation');

clear;
clc;
params.size = [128 128 64];

load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);

params.numSamp = 1000;
Num = [25:25:500];
k = 1;

%% J0
for ni = Num
    params.basis = 0;
    
    params.numBasis = ni;
    
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR1(k) = psnr;
    k = k+1;
end
plot(Num,PSNR1,'o-');

hold on;

%% J1
k = 1;
for ni = Num
    params.basis = 1;
   params.numBasis = ni;
    
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR2(k) = psnr;
    k = k+1;
end
plot(Num,PSNR2,'*-');

%% Dini series
k = 1;
for ni = Num
    params.basis = 2;
    params.numBasis = ni;
    
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR3(k) = psnr;
    k = k+1;
end
plot(Num,PSNR3,'x-');

%% 3m-2
k = 1;
for ni = Num
    params.numBasis = ni;
   
    params.basis = 3;
    
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR4(k) = psnr;
    k = k+1;
end
plot(Num,PSNR4,'o-');

legend('J0 zeros','J1 zeros','Dini series','3m-2');
