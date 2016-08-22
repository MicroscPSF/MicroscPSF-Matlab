function PSNR = aux_PSNR(I,I0)
%AUX_PSNR Compute the peak signal-to-noise ratio (PSNR) of two images
%   PSNR = AUX_PSNR(I, I0) calculates the PSNR for the image I, with the image I0
%   as the reference.
%
%   Example:
%       PSNR = aux_PSNR(I, I0);
%
%   See also psnr

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

I=I(:);
I0=I0(:);

PSNR = -20*log10(norm(I-I0)/max(abs(I0))/sqrt(length(I0)));