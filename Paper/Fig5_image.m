%% Fig.5 Visual comparison of one axial section obtained by different approaches
%  need to run Tab2.m first
%  image size: [255 255 127]
%
%  References:
%  [1] psfModel: F. Aguet, ?Super-resolution fluorescence microscopy based on physical models,? Ph.D. thesis, Ecole Polytechnique Fédérale de Lausanne (2009).
%  [2] PSFGenerator: H. Kirshner, F. Aguet, D. Sage, and M. Unser, ?3-D PSF fitting for fluorescence microscopy: implementation and localization application,? J. Microsc. 249, 13?25 (2013).
%

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Aug, 2016

gt = permute(GT,[3 2 1]);
psf1 = permute(spsf,[3 2 1]);
psf2 = permute(PG_good,[3 2 1]);
psf3 = permute(PG_better,[3 2 1]);
psf4 = permute(PG_best,[3 2 1]);
psf5 = permute(PSF,[3 2 1]);

%% show one axial section
slice = 100;
imshow([gt(:,:,slice) psf1(:,:,slice) psf2(:,:,slice); psf3(:,:,slice)...
    psf4(:,:,slice) psf5(:,:,slice)],[]); colormap('hot')

figure;
imshow([gt(:,:,slice)-gt(:,:,slice) psf1(:,:,slice)-gt(:,:,slice) ...
    psf2(:,:,slice)-gt(:,:,slice); psf3(:,:,slice)-gt(:,:,slice)...
    psf4(:,:,slice)-gt(:,:,slice) psf5(:,:,slice)-gt(:,:,slice)],[]); 