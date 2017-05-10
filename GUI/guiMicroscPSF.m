function varargout = guiMicroscPSF(varargin)
% guiMicroscPSF MATLAB code for guiMicroscPSF.fig
%      guiMicroscPSF, by itself, creates a new guiMicroscPSF or raises the existing
%      singleton*.
%
%      H = guiMicroscPSF returns the handle to a new guiMicroscPSF or the handle to
%      the existing singleton*.
%
%      guiMicroscPSF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in guiMicroscPSF.M with the given input arguments.
%
%      guiMicroscPSF('Property','Value',...) creates a new guiMicroscPSF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the guiMicroscPSF before guiMicroscPSF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiMicroscPSF_OpeningFcn via varargin.
%
%      *See guiMicroscPSF Options on GUIDE's Tools menu.  Choose "guiMicroscPSF allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiMicroscPSF

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 09 Oct, 2016

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @guiMicroscPSF_OpeningFcn, ...
    'gui_OutputFcn',  @guiMicroscPSF_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
filepath1 = [cd,filesep, '../Utilities'];
filepath2 = [cd,filesep, '../'];
addpath(filepath1,filepath2);

% End initialization code - DO NOT EDIT


% --- Executes just before guiMicroscPSF is made visible.
function guiMicroscPSF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiMicroscPSF (see VARARGIN)

% Choose default command line output for guiMicroscPSF
handles.output = hObject;

% set(handles.popBasis, 'String', {'2.7m-2', 'J0 zeros', 'J1 zeros','Dini series'});
set(handles.lbLog, 'String','Please define parameters and press Run');

set(handles.pushbutton2, 'Enable', 'off');

set(handles.sliderM, 'min', 100);
set(handles.sliderM, 'max', 300);
set(handles.sliderM, 'Value', 100);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiMicroscPSF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiMicroscPSF_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtLambda_Callback(hObject, eventdata, handles)
% hObject    handle to txtLambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLambda as text
%        str2double(get(hObject,'String')) returns contents of txtLambda as a double


% --- Executes during object creation, after setting all properties.
function txtLambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNA_Callback(hObject, eventdata, handles)
% hObject    handle to txtNA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNA as text
%        str2double(get(hObject,'String')) returns contents of txtNA as a double


% --- Executes during object creation, after setting all properties.
function txtNA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtLateral_Callback(hObject, eventdata, handles)
% hObject    handle to txtLateral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLateral as text
%        str2double(get(hObject,'String')) returns contents of txtLateral as a double


% --- Executes during object creation, after setting all properties.
function txtLateral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLateral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNi_Callback(hObject, eventdata, handles)
% hObject    handle to txtNi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNi as text
%        str2double(get(hObject,'String')) returns contents of txtNi as a double


% --- Executes during object creation, after setting all properties.
function txtNi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNs_Callback(hObject, eventdata, handles)
% hObject    handle to txtNs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNs as text
%        str2double(get(hObject,'String')) returns contents of txtNs as a double


% --- Executes during object creation, after setting all properties.
function txtNs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTi_Callback(hObject, eventdata, handles)
% hObject    handle to txtTi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTi as text
%        str2double(get(hObject,'String')) returns contents of txtTi as a double


% --- Executes during object creation, after setting all properties.
function txtTi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtZp_Callback(hObject, eventdata, handles)
% hObject    handle to txtZp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtZp as text
%        str2double(get(hObject,'String')) returns contents of txtZp as a double


% --- Executes during object creation, after setting all properties.
function txtZp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtZp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNg_Callback(hObject, eventdata, handles)
% hObject    handle to txtNg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNg as text
%        str2double(get(hObject,'String')) returns contents of txtNg as a double


% --- Executes during object creation, after setting all properties.
function txtNg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTg_Callback(hObject, eventdata, handles)
% hObject    handle to txtTg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTg as text
%        str2double(get(hObject,'String')) returns contents of txtTg as a double


% --- Executes during object creation, after setting all properties.
function txtTg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtPx_Callback(hObject, eventdata, handles)
% hObject    handle to txtPx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPx as text
%        str2double(get(hObject,'String')) returns contents of txtPx as a double


% --- Executes during object creation, after setting all properties.
function txtPx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtPz_Callback(hObject, eventdata, handles)
% hObject    handle to txtPz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPz as text
%        str2double(get(hObject,'String')) returns contents of txtPz as a double


% --- Executes during object creation, after setting all properties.
function txtPz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtPy_Callback(hObject, eventdata, handles)
% hObject    handle to txtPz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPz as text
%        str2double(get(hObject,'String')) returns contents of txtPz as a double


% --- Executes during object creation, after setting all properties.
function txtPy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtM_Callback(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtM as text
%        str2double(get(hObject,'String')) returns contents of txtM as a double
params.numBasis = str2num(get(handles.txtM,'String'));
params.numSamp = str2num(get(handles.txtK,'String'));

if (params.numBasis<100)&&(params.numSamp<1000)
    msgbox('Better parameters: M>=100, K>=1000.');
end

rseFun = @(M,K)(M/45)^(-6.5)*(K/80)^(-1.5);
RSE = rseFun(params.numBasis,params.numSamp);
set(handles.txtRSE,'String',sprintf('%0.2e',RSE));


% --- Executes during object creation, after setting all properties.
function txtM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtK_Callback(hObject, eventdata, handles)
% hObject    handle to txtK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtK as text
%        str2double(get(hObject,'String')) returns contents of txtK as a double


% --- Executes during object creation, after setting all properties.
function txtK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

params.lambda = str2num(get(handles.txtLambda,'String'))*1e-9;
params.NA = str2num(get(handles.txtNA,'String'));
params.ns = str2num(get(handles.txtNs,'String'));
params.ni = str2num(get(handles.txtNi,'String'));
params.ng = str2num(get(handles.txtNg,'String'));
params.tg = str2num(get(handles.txtTg,'String'))*1e-6;
params.ti = str2num(get(handles.txtTi,'String'))*1e-6;
params.pZ = str2num(get(handles.txtZp,'String'))*1e-9;
params.resLateral = str2num(get(handles.txtLateral,'String'))*1e-9;
params.resAxial = str2num(get(handles.txtAxial,'String'))*1e-9;
params.nx = str2num(get(handles.txtPx,'String'));
params.ny = str2num(get(handles.txtPy,'String'));
params.nz = str2num(get(handles.txtPz,'String'));
params.size = [params.nx params.ny params.nz];

params.numBasis = str2num(get(handles.txtM,'String'));
params.numSamp = str2num(get(handles.txtK,'String'));

str = get( handles.lbLog, 'String' );
str = cat( 1, {'- Running start.....'}, str );
set(handles.lbLog, 'String',str);
set(handles.radiobutton2,'Value',1);
set(handles.radiobutton4,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton1,'Value',0);
set(handles.slider1, 'Enable', 'on');

drawnow;

tic;
PSF = MicroscPSF(params);
t = toc;

set(handles.pushbutton2, 'Enable', 'on');

% PSF = aux_stackread('Data/Generator_127_127__63_best.tif');

addstr = ['End, running time: ' num2str(t) 's'];
str = cat( 1, {addstr}, str );
set(handles.lbLog, 'String',str);

%% display
current = floor(params.nz/2);
handles.currentPSF = PSF;
handles.PSF = PSF;
handles.PSF1 = permute(PSF,[3 2 1]);
handles.PSF2 = permute(PSF,[2 3 1]);

handles.nz = params.nz;
handles.size = params.size;

showPSF(hObject, handles, PSF, current, params.nz);

guidata(hObject, handles);




function showPSF(hObject, handles, PSF, current, nz)

set(handles.slider1, 'Min', 1);
set(handles.slider1, 'Max', nz);
set(handles.slider1, 'Value', current);
set(handles.slider1, 'SliderStep', [1/nz,10/nz]);

set(handles.textSlice, 'String', [num2str(current) '/' num2str(nz)]);

axes(handles.axes1);
imshow(PSF(:,:,current),[]); colormap('hot');
drawnow;
guidata(hObject, handles);


function showPSF3(hObject, handles, PSF, current, nz)

set(handles.slider1, 'Enable', 'off');
axes(handles.axes1);
[nx,ny,nz] = size(PSF);

cut=exp(-1:-1:-5);
[X,Y,Z]=meshgrid(-(nx/2-1):nx/2,-(ny/2-1):ny/2,-(nz/2-1):nz/2);

axes(handles.axes1);
cla reset;
a = handles.axes1;

h = waitbar(0,'Please wait...');

for k=1:numel(cut)
    isonormals(X,Y,Z,PSF,patch(isosurface(X,Y,Z,PSF,cut(k)),'EdgeColor','none','FaceAlpha',1/k,'FaceColor',[1 (k-1)/max(1,numel(cut)-0.99) 0],'Parent',a));
    waitbar(k / numel(cut))
end
close(h);
view(35,45);
axis('tight');
lighting('gouraud');
grid('on');
camlight;

guidata(hObject, handles);



% --- Executes on selection change in lbLog.
function lbLog_Callback(hObject, eventdata, handles)
% hObject    handle to lbLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lbLog contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lbLog


% --- Executes during object creation, after setting all properties.
function lbLog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lbLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
if isfield(handles,'PSF')
PSF = handles.PSF;
nz = handles.nz;
current = floor(nz/2);
handles.currentPSF = PSF;
set(handles.axisLabel, 'String', '');
showPSF3(hObject, handles, PSF, current, nz);
guidata(hObject, handles);
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

if isfield(handles,'PSF')

PSF = handles.PSF;
handles.currentPSF = PSF;
nz = handles.nz;
current = floor(nz/2);
set(handles.slider1, 'Enable', 'on');
set(handles.axisLabel, 'String', 'Z axis');
showPSF(hObject, handles, PSF, current, nz);
guidata(hObject, handles);
end





% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
if isfield(handles,'PSF')
PSF = handles.PSF2;
nz = size(PSF,3);
current = floor(nz/2);
set(handles.slider1, 'Enable', 'on');
handles.currentPSF = PSF;
set(handles.axisLabel, 'String', 'Y axis');
showPSF(hObject, handles, PSF, current, nz);
guidata(hObject, handles);
end

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
if isfield(handles,'PSF')
PSF = handles.PSF1;
nz = size(PSF,3);
current = floor(nz/2);
set(handles.slider1, 'Enable', 'on');
handles.currentPSF = PSF;
set(handles.axisLabel, 'String', 'X axis');
showPSF(hObject, handles, PSF, current, nz);
guidata(hObject, handles);
end

% --- Executes on selection change in popBasis.
function popBasis_Callback(hObject, eventdata, handles)
% hObject    handle to popBasis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popBasis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popBasis


% --- Executes during object creation, after setting all properties.
function popBasis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popBasis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function txtAxial_Callback(hObject, eventdata, handles)
% hObject    handle to txtAxial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtAxial as text
%        str2double(get(hObject,'String')) returns contents of txtAxial as a double


% --- Executes during object creation, after setting all properties.
function txtAxial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtAxial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popColormap.
function popColormap_Callback(hObject, eventdata, handles)
% hObject    handle to popColormap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popColormap contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popColormap


% --- Executes during object creation, after setting all properties.
function popColormap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popColormap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
optSave = get(handles.radiobutton6,'Value');
PSF = handles.PSF;
filename = ['PSF_' strrep(num2str(handles.size), '  ', '_')];
if(optSave)
    uisave({'PSF'},filename);
else
    path = uigetdir(pwd,'Choose folder to save');
    aux_stackwrite(PSF, [path filesep filename '.tif']);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
PSF = handles.currentPSF;
nz = size(PSF,3);

current = floor(get(hObject,'Value'));
set(hObject,'Value',current);
showPSF(hObject, handles, PSF, current, nz);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txtLambda,'String','610');
set(handles.txtNA,'String','1.4');
set(handles.txtNs,'String','1.33');
set(handles.txtNi,'String','1.5');
set(handles.txtNg,'String','1.5');
set(handles.txtTg,'String','170');
set(handles.txtTi,'String','150');
set(handles.txtZp,'String','2000');
set(handles.txtLateral,'String','100');
set(handles.txtAxial,'String','250');
set(handles.txtPx,'String','256');
set(handles.txtPy,'String','256');
set(handles.txtPz,'String','128');
set(handles.txtM,'String','100');
set(handles.txtK,'String','1000');
rseFun = @(M,K)(M/45)^(-6.5)*(K/80)^(-1.5);
RSE = rseFun(100,1000);
set(handles.txtRSE,'String',sprintf('%0.2e',RSE));
set(handles.sliderM,'Value',100);
guidata(hObject, handles);


% --- Executes on slider movement.
function sliderM_Callback(hObject, eventdata, handles)
% hObject    handle to sliderM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

M = get(handles.sliderM,'Value');
rseFun = @(M,K)(M/45)^(-6.5)*(K/80)^(-1.5);
RSE = rseFun(M, 1000);
set(handles.txtRSE,'String',sprintf('%0.2e',RSE));
set(handles.txtM,'String',round(M));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function sliderM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txtRSE_Callback(hObject, eventdata, handles)
% hObject    handle to txtRSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRSE as text
%        str2double(get(hObject,'String')) returns contents of txtRSE as a double
RSE = str2num(get(handles.txtRSE,'String'));

if isempty(RSE)||RSE<9.98e-08||RSE>1.26e-4
    msgbox('Error is not numeric or too small/large.');
    set(handles.txtRSE,'String','1.26e-4');
     set(handles.txtM,'String','100');
else

Mfun = @(x,K)45*exp(1./6.5*(-1.5*log(K/80)-log(x)));
M = round(Mfun(RSE, 1000));
set(handles.txtM,'String',M);
guidata(hObject, handles);

end



% --- Executes during object creation, after setting all properties.
function txtRSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over txtM.
function txtM_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on txtM and none of its controls.
function txtM_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
