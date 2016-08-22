Fast Approximation of 3D PSF Model in Fluorescence Microscopy
=============

This set of codes is a fast approximation of 3D PSF model in fluorescernce microscopy, based on Gibson-Lanni model.

0. **Groundtruth Generator** For comparison, it is necessarty to generate a grouth truth for the PSF model. We use the Simpson rule to compute the integral. 
0. **Fast approximation** Current approximation can be 80 times faster than the state-of-the-art tool [PSF Generator](http://bigwww.epfl.ch/algorithms/psfgenerator/). 
    Note the `PSF Generator` uses Java language with mult-threading while the proposed uses pure Matlab without any compiled routine.

Groudtruth Generator
-------

```
params.size = [64 64 32];
GT = aux_GTgenerator(params);
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);
```

Usage of the Proposed Method
-----------

```
params.size = [256 256 128];
params.fastcom = 1;
tic;
PSF = MicroPSF(params);
toc
```
