%% % Generate ground truth for comparison
% It is based on the Simpson rule.
% You can set params.numInterval for the accuracy, default 1000000.

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016

clear; clc;

addpath('Utilities/');

params.size = [63 63 31];
% params.size = [127 127 63];
% params.size = [255 255 127];
% params.size = [511 511 255];

tic;
GT = aux_GTgenerator(params);
t = toc

save(['Data/GT_' strrep(num2str(params.size), '  ', '_')]);




