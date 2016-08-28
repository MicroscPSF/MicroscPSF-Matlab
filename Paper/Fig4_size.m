%% Fig.4 Plots of PNSRs for different image sizes

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016

addpath('../Utilities/');
addpath('../../PSF Approximation');

clear;
clc;

Num = [20:20:300];

%% 32*32*16
params.size = [32 32 16];
load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);

k = 1;
params.numSamp = 1000;

for ni = Num
    params.numBasis = ni;
    
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR0(k) = psnr;
    k = k+1;
end

hold on;
plot(Num,PSNR0,'o-');

%% 64*64*32
params.size = [64 64 32];
load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);

k = 1;
for ni = Num
    params.numBasis = ni;
   
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR1(k) = psnr;
    k = k+1;
end

hold on;
plot(Num,PSNR1,'*-');

%% 128*128*64
params.size = [128 128 64];
load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);

k = 1;
for ni = Num
    params.numBasis = ni;
   
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR2(k) = psnr;
    k = k+1;
end

hold on;
plot(Num,PSNR2,'x-');

%% 256*256*128
params.size = [256 256 128];
load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);

k = 1;
for ni = Num
    params.numBasis = ni;
   
    PSF = MicroPSF(params);
    psnr = aux_PSNR(PSF,GT);
    
    PSNR3(k) = psnr;
    k = k+1;
end

hold on;
plot(Num,PSNR3,'o-');

legend('32\times 32\times 16','64\times 64\times 32','128\times 128\times 64','256\times 256\times 128');
