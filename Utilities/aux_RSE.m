function rse = aux_RSE(psf, gt)
%AUX_RSE Compute the relative squared error (RSE) of two images
%   rse = AUX_RSE(psf, gt) calculates the RSE for the estimated psf, with
%   the ground truth gt
%   as the reference.
%
%   Example:
%       rse = aux_RSE(psf, gt);
%
%   See also aux_PSNR

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 28 Dec, 2016

rse = sum((psf(:)-gt(:)).^2)./sum(gt(:).^2)*100;
end