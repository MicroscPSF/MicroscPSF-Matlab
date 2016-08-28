function aux_stackwrite(stack, filename)
%AUX_STACKWRITE Write a 3D matrix as a stack of images (.tif)
%   AUX_STACKWRITE(stack, filename) write the 3D matrix stack as filename
%
%   Input:
%   - stack: 3D matrix
%   - filename: string containing the name of the stack.
%
%   Example:
%       aux_stackwrite(stack, '3doutput.tif');
%
%   See also AUX_STACKREAD

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

[~,~,nz] = size(stack);
for z=1:nz
    imwrite(stack(:,:,z), filename, 'WriteMode', 'append');
end
