%% Demo for the MicroPSF, a super-fast and accurate approximation of the Gibson-Lanni model
% If the parameters are not assigned, default setting will be loaded, see
% MicroPSF for details.

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Dec, 2016

addpath('Utilities/');

clear; clc;
params.size = [256 256 128];

tic;
PSF = MicroscPSF(params);
t = toc;

% Accuracy evaluation, PSNR with the ground truth
load(['Data/GT_' strrep(num2str(params.size), '  ', '_')]);
PSNR = aux_PSNR(PSF,GT);
RSE = aux_RSE(PSF,GT);

disp(['PSNR: ' num2str(PSNR) 'dB, RSE: ' num2str(RSE) ', running time = ' num2str(t) 's']);



