%% Demo for the MicroPSF, a fast and accurate approximation of the Gibson-Lanni model
% If the parameters are not assigned, default setting will be loaded, see
% MicroscPSF for details.
%
%   Reference:
%       [1] Gibson, S.F. & Lanni, F., 1992.
%           Experimental test of an analytical model of aberration in an
%           oil-immersion objective lens used in three-dimensional light
%           microscopy. JOSA A, 9(1), pp.154-166.
%       [2] Li, J., Xue, F. and Blu, T. Fast and accurate 3D PSF
%           computation for fluorescence microscopy. JOSA A. Accepted.
%
%   Copyright © Jizhou Li, Feng Xue and Thierry Blu, 2017
%   Update date: 4 May, 2017

addpath('Utilities/');

clear; clc;
params.size = [256 256 128];
% params.fastcom = 1; % even faster, may need recompile

params.numBasis = 100;
params.numSamp = 1000;

tic;
PSF = MicroscPSF(params);
t = toc;

% Accuracy evaluation, PSNR and RSE with the ground truth
load(['Data/GT_' strrep(num2str(params.size), '  ', '_')]);
PSNR = aux_PSNR(PSF,GT);
RSE = aux_RSE(PSF,GT);

disp(['PSNR: ' num2str(PSNR) 'dB, RSE: ' num2str(RSE) ', running time = ' num2str(t) 's']);



