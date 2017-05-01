/*
 * transformation.cpp - The polar-to-Cartesian transformation
 *
 * The 2D component PSF0 is resampled to a Cartesian grid using piecewise-linear interpolation
 *
 * The calling syntax is:
 *
 *		PSF = transformation(overSampling,nx,nz,PSF0);
 * Reference:
 *      [1] Gibson, S.F. & Lanni, F., 1992.
 *          Experimental test of an analytical model of aberration in an
 *          oil-immersion objective lens used in three-dimensional light
 *           microscopy. JOSA A, 9(1), pp.154-166.
 *      [2] Li, J., Xue, F. and Blu, T. Fast and accurate 3D PSF
 *          computation for fluorescence microscopy. JOSA A. Accepted.
 * This is a MEX file for MATLAB.
 */

#include "mex.h"
#include "math.h"

mxArray* transformation(int overSamp, int nx_, int nz_, double* H)
{
    double* pixels_;
    mxArray* output;
    // The center of the image in units of [pixels]
    double x0 = (nx_-1)/2.0;
    double y0 = (nx_-1)/2.0;
    
    int maxRadius = ((int) round(sqrt((nx_-x0)*(nx_-x0)+(nx_-y0)*(nx_-y0))))+1;
    int sizeRadius = maxRadius*overSamp;
    double r[sizeRadius];
    double h[sizeRadius];
    
    //begin transform
    double rPixel = 0.0;
    int index = 0;
    double value = 0.0;
    
    const mwSize dims[3] = {nx_, nx_, nz_};
    output = mxCreateNumericArray(3, dims, mxDOUBLE_CLASS, mxREAL);
    
    pixels_ = mxGetPr(output);
    
    for (int z=0;z<nz_;z++) {
        
        for (int n=0; n<sizeRadius; n++) {
            r[n] = ((double)n)/((double)overSamp);
            h[n] = H[n + z*sizeRadius];         
         }
        
        for (int x=0;x<nx_;x++) {
            for (int y=0;y<nx_;y++) {
                rPixel = sqrt(((double)x-x0)*((double)x-x0)+((double)y-y0)*((double)y-y0));								
                index = (int)floor(rPixel*overSamp);									
                value = h[index] + (h[index+1]-h[index])*(rPixel-r[index])*overSamp;
                pixels_[x+ nx_*y + z * nx_ *nx_] = value;
            }
        }
    }
    
    return output;
    
}

/* The gateway function */
void mexFunction(int nlhs, mxArray *plhs[],
        int nrhs, const mxArray *prhs[])
{
    /* variable declarations here */
    double multiplier;      /* input scalar */
    double *inMatrix;       /* 1xN input matrix */
    mwSize ncols;           /* size of matrix */
    double *outMatrix;      /* output matrix */
    
    /* get the value of the scalar input  */
    int overSamp = mxGetScalar(prhs[0]);
    int nx = mxGetScalar(prhs[1]);
    int nz = mxGetScalar(prhs[2]);
    
    /* create a pointer to the real data in the input matrix  */
    inMatrix = mxGetPr(prhs[3]);

    plhs[0] = transformation(overSamp, nx, nz, inMatrix);
}

