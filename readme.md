Super-Fast and Accurate 3D PSF Computation in Fluorescence Microscopy
=============
J. Li, F. Xue and T. Blu, _J. Opt. Soc. Am. A_, submitted.

This set of codes is a fast approximation of 3D PSF model in fluorescernce microscopy, based on Gibson-Lanni model.

0. **Groundtruth Generator** For comparison, it is necessarty to generate a grouth truth for the PSF model. We use the Simpson rule to compute the integral. 
0. **Fast approximation** Current approximation can be 498 times faster than the state-of-the-art tool [PSF Generator](http://bigwww.epfl.ch/algorithms/psfgenerator/). 
    Note the `PSF Generator` uses Java language with mult-threading while the proposed uses pure Matlab without any compiled routine.

Groud truth Generator
-------

```
params.size = [64 64 32];
GT = aux_GTgenerator(params);
save(['Data/GT_' strrep(num2str(params.size), '  ', '_')], GT);
```

Usage of the Proposed Method
-----------

If the parameters of the microscope are not assigned, default setting will be loaded, see MicroscPSF for details.

```
params.size = [256 256 128];
tic;
PSF = MicroPSF(params);
toc
```
GUI
-----------
![GUI of MicroscPSF](GUI/screenshot.jpg?raw=true "GUI")


Update log
-----------
- (28 Dec, 2016) Refined basis functions. 
- (09 Oct, 2016) Optimized code, the speed has been improved 10 times faster!

