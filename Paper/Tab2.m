%% Table 2. Comparison of PSNR and computational time with other techniques
%
%  References:
%  [1] psfModel: F. Aguet, ?Super-resolution fluorescence microscopy based on physical models,? Ph.D. thesis, Ecole Polytechnique Fédérale de Lausanne (2009).
%  [2] PSFGenerator: H. Kirshner, F. Aguet, D. Sage, and M. Unser, ?3-D PSF fitting for fluorescence microscopy: implementation and localization application,? J. Microsc. 249, 13?25 (2013).
%

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016
addpath('../Utilities/');
addpath('../../PSF Approximation');

clear; clc;

params.size = [63 63 31];
% params.size = [127 127 63];
% params.size = [255 255 127];

params.numBasis = 150;
params.numSamp = 1000;

tic;
PSF = MicroPSF(params);
time = toc;

%% Proposed
load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);
PSNR_Proposed = aux_PSNR(PSF,GT);

%% psfModel
load(['../Data/psfModel_' strrep(num2str(params.size), '  ', '_')]);
PSNR_psfModel = aux_PSNR(spsf, GT);

%% PSFGenerator
PG_good = aux_stackread(['../Data/Generator_' strrep(num2str(params.size), '  ', '_') '_good.tif']);
PSNR_good = aux_PSNR(PG_good, GT);

PG_better = aux_stackread(['../Data/Generator_' strrep(num2str(params.size), '  ', '_') '_better.tif']);
PSNR_better = aux_PSNR(PG_better, GT);

PG_best = aux_stackread(['../Data/Generator_' strrep(num2str(params.size), '  ', '_') '_best.tif']);
PSNR_best = aux_PSNR(PG_best, GT);

disp(['Image size: ' num2str(params.size) '']);
disp(['psfModel: ' num2str(PSNR_psfModel) 'dB']);
disp(['PSFGenerator-good: ' num2str(PSNR_good) 'dB']);
disp(['PSFGenerator-better: ' num2str(PSNR_better) 'dB']);
disp(['PSFGenerator-best: ' num2str(PSNR_best) 'dB']);
disp(['Proposed: ' num2str(PSNR_Proposed) 'dB, running time: ' num2str(time) 's']);


