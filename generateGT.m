
clear; clc;

addpath('Utilities/');

% Generate ground truth for comparison

params.size = [64 64 32];
tic;
GT = aux_GTgenerator(params);
toc
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);


params.size = [128 128 64];
tic;
GT = aux_GTgenerator(params);
toc
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);


params.size = [255 255 127];
tic;
GT = aux_GTgenerator(params);
toc
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);


params.size = [256 256 128];
tic;
GT = aux_GTgenerator(params);
toc
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);


params.size = [512 512 256];
tic;
GT = aux_GTgenerator(params);
toc
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);



