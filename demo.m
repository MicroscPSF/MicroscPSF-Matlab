%% Demo for the MicroPSF, a fast and accurate approximation of the Gibson-Lanni model
% If the parameters are not assigned, default setting will be loaded, see
% MicroPSF for details.

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 09 Oct, 2016

addpath('Utilities/');

clear; clc;
params.size = [256 256 128];

params.basis = 3;

params.numBasis = 150;

tic;
PSF = MicroPSF(params);
t = toc;

% Accuracy evaluation, PSNR with the ground truth
load(['Data/GT_' strrep(num2str(params.size), '  ', '_')]);
PSNR = aux_PSNR(PSF,GT);

disp(['PSNR: ' num2str(PSNR) 'dB, running time = ' num2str(t) 's']);



