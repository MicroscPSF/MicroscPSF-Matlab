function [stack,info] = aux_stackread(filename)
%AUX_STACKREAD Read a stack of images (.tif) as a 3D matrix
%   [stack,info] = AUX_STACKREAD(filename) reads the stack named 'filename'
%   and returns a 3D double matrix 'stack' and the stack info 'info'.
%
%   Input:
%   - filename: string containing the name of the stack.
% 	
%   Output:
%   - stack: the extracted double 3D matrix.
%   - info : informations about the stack.
%
%   Example:
%       [stack,info] = aux_stackread('3dimg.tif');
%
%   See also AUX_STACKWRITE

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

info = imfinfo(filename);
nz   = size(info,1);
nx   = info(1).Height;
ny   = info(1).Width;
type = info(1).ColorType;
if(strcmp(type,'truecolor'))
    C = 3;
else
    C = 1;
end
stack = zeros(nx,ny,C*nz);
for z=1:nz
    stack(:,:,(z-1)*C+1:z*C) = double(imread(filename,z));
end