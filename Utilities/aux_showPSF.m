function aux_showPSF(PSF, options)
%AUX_SHOWPSF Display the point-spread-function (PSF) in 3D or plane view
%   AUX_SHOWPSF(PSF) display the PSF in 3D, the intensity is thresholded to
%   create different layers.
%
%   AUX_SHOWPSF(PSF, OPTIONS) display the PSF in 2D plane.
%   Options include:
%
%   'sliceNum'      The slice to be shown
%
%   'colormap'      Built-in colormap, for example 'jet', 'hot', 'gray' etc
%
%   Example:
%       load mri
%       Image = squeeze(D);
%       aux_showPSF(Image);
%

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

if nargin < 2
    options.type = '3D';
else
    options.type = '2D';
end

[nx,ny,nz] = size(PSF);

switch options.type
    case '3D'
        cut=exp(-1:-1:-5);
        [X,Y,Z]=meshgrid(-(nx/2-1):nx/2,-(ny/2-1):ny/2,-(nz/2-1):nz/2);
        f=figure('NumberTitle','off','Name','3D show');
        a=axes('Parent',f,'DataAspectRatio',[1 1 1]);
        view(35,45);
        for k=1:numel(cut)
            isonormals(X,Y,Z,PSF,patch(isosurface(X,Y,Z,PSF,cut(k)),'EdgeColor','none','FaceAlpha',1/k,'FaceColor',[1 (k-1)/max(1,numel(cut)-0.99) 0],'Parent',a));
        end
        
        axis('tight');
        lighting('gouraud');
        grid('on');
        camlight;
        
    otherwise
        sliceNum = options.sliceNum;
        img = PSF(:,:,sliceNum);
        imshow(img);
        if ~isfield(options,'colormap')
            colorMap = 'gray';
        else
            colorMap = options.colormap;
        end
        colormap(colorMap);
end


end