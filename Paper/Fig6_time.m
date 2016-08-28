%% Fig.6 Time comparison under the same PSNR with other techniques
% 
%  References:
%  [1] psfModel: F. Aguet, ?Super-resolution fluorescence microscopy based on physical models,? Ph.D. thesis, Ecole Polytechnique Fédérale de Lausanne (2009).
%  [2] PSFGenerator: H. Kirshner, F. Aguet, D. Sage, and M. Unser, ?3-D PSF fitting for fluorescence microscopy: implementation and localization application,? J. Microsc. 249, 13?25 (2013).

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016

clear; clc;

addpath('../Utilities/');
addpath('../../PSF Approximation/');

%% psfModel
%{
params.size = [63 63 31];
% params.size = [127 127 63];
% params.size = [255 255 127];
% params.size = [511 511 255];
% params.size = [1023 1023 511];

params.numBasis = 3;
% params.numBasis = 5;
% params.numBasis = 5;
% params.numBasis = 5;
% params.numBasis = 20;

params.numSamp = 1000;

tic;
PSF = MicroPSF(params);
t = toc

load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);
aux_PSNR(PSF,GT)

load(['../Data/psfModel_' strrep(num2str(params.size), '  ', '_') '.mat']);
aux_PSNR(spsf, GT)

return;
%}

%% PSF Generator
%{
params.size = [63 63 31];
% params.size = [127 127 63];
% params.size = [255 255 127];
% params.size = [511 511 255];
% params.size = [1023 1023 511];

params.numBasis = 30;
% params.numBasis = 39;
% params.numBasis = 69;
% params.numBasis = 133;
% params.numBasis = 133;

params.numSamp = 1000;
tic;
PSF = MicroPSF(params);
t = toc

load(['../Data/GT_' strrep(num2str(params.size), '  ', '_')]);
aux_PSNR(PSF,GT)


PG_best = aux_stackread(['../Data/Generator_' strrep(num2str(params.size), '  ', '_') '_best.tif']);

aux_PSNR(PG_best, GT)

return;
%}


%% plot 
% A1 - psfModel, B1 - Proposed
% A2 - PSFGenerator-best, B2 = Proposed

A1 = [0.0508 0.1834 0.5286 3.8341];
B1 = [0.101 0.5017 3.318 25.985];

A2 = [0.3203 0.7730 2.3993 11.4185];
B2 = [2.45149 13.72 87.27 662.40];

%% PSFGenerator
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
semilogy(B1,'o-','MarkerSize',10,'LineWidth',2); hold on; 
semilogy(A1,'x-','MarkerSize',10,'LineWidth',2)
xlabel('Image size');
ylabel('Time (sec)');
xlim(axes1,[0.9 4.1]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'XTick',[1 2 3 4],...
    'XTickLabel',...
    {'63\times 63\times 31','127\times 127 \times 63','255 \times 255 \times 127','511 \times 511 \times 255'},...
    'YGrid','on','YMinorTick','on','YScale','log');
legend('psfModel','Proposed');

%% psfModel
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
semilogy(B2,'o-','MarkerSize',10,'LineWidth',2); hold on; 
semilogy(A2,'x-','MarkerSize',10,'LineWidth',2)
xlabel('Image size');
ylabel('Time (sec)');
xlim(axes1,[0.9 4.1]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'XTick',[1 2 3 4],...
    'XTickLabel',...
    {'63\times 63\times 31','127\times 127 \times 63','255 \times 255 \times 127','511 \times 511 \times 255'},...
    'YGrid','on','YMinorTick','on','YScale','log');
legend('PSFGenerator','Proposed');



