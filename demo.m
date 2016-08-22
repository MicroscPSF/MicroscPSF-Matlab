params.size = [255 255 127];

params.fastcom = 1;
tic;
PSF = MicroPSF(params);
toc

load('../Ground Truth/GT_255_255_127');
aux_PSNR(PSF,GT)


