function varargout = VAP_Vandana(varargin)

% Code Initialization
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VAP_Vandana_OpeningFcn, ...
                   'gui_OutputFcn',  @VAP_Vandana_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End of Code Initialization


function VAP_Vandana_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output arguments
% hObject    the handle to the object that generated the callback like buttons
% eventdata  this stores special data for some specific callbacks like key presses or scroll actions
% handles    the current contents of the data stored with the figure. This retrieved with guidata(hObject) at the time of the callback.
% varargin   input variable in a function definition statement that enables the function to accept any number of input arguments.

% Choose default command line output
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

buat_axes = axes('unit', 'normalized', 'position', [0 0  1 1]);
backgroundnya = imread('bg.jpg');
imagesc(backgroundnya);
set(buat_axes, 'handlevisibility', 'off', 'visible', 'off')

% Outputs are returned to the command line.
function varargout = VAP_Vandana_OutputFcn(hObject, eventdata, handles)
% varargout  output variable in a function definition statement that enables the function to return any number of output arguments

% Get default command line output from handles structure
varargout{1} = handles.output;

% Histogram Button
function pushbutton7_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);


% Measure Distance Button
function pushbutton9_Callback(hObject, eventdata, handles)
l=imdistline();
msgbox('Measured in Pixels');
dist = getDistance(l);


% Rotate Button
function pushbutton11_Callback(hObject, eventdata, handles)
a=getappdata(0, 'a');
rotate=imrotate(a,45);
axes(handles.axes2);
imshow(rotate);


% Horizontal Flip Button
function pushbutton12_Callback(hObject, eventdata, handles)
I=getappdata(0,'a');
I2=flipdim(I,2);
axes(handles.axes2);
imshow(I2);


% Image Complement Button 
function pushbutton13_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
IM2=imcomplement(a);
axes(handles.axes2);
imshow(IM2);


% Salt and Pepper Noise Button
function pushbutton16_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noise=imnoise(a, 'salt & pepper');
axes(handles.axes2);
imshow(noise);


% Gaussian Noise Button
function pushbutton17_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
noise=imnoise(a, 'gaussian');
axes(handles.axes2);
imshow(noise);


% Vertical Flip Button
function pushbutton18_Callback(hObject, eventdata, handles)
I=getappdata(0,'a');
I3=flipdim(I,1);
axes(handles.axes2);
imshow(I3);


% Horizontal Vertical Button
function pushbutton19_Callback(hObject, eventdata, handles)
I=getappdata(0,'a');
I2=flipdim(I,2);
I3=flipdim(I,1);
I4=flipdim(I3,2);
axes(handles.axes2);
imshow(I4);

% Canny Edge Detection Button
function pushbutton20_Callback(hObject, eventdata, handles)
I=getappdata(0,'a');
I=rgb2gray(I);
BW2=edge(I,'canny');
axes(handles.axes2);
imshow(BW2);


% Sobel Edge Detection Button
function pushbutton21_Callback(hObject, eventdata, handles)
I=getappdata(0,'a');
I=rgb2gray(I);
BW1=edge(I,'sobel');
axes(handles.axes2);
imshow(BW1);


% Import Image Button
function pushbutton1_Callback(hObject, eventdata, handles)
a=uigetfile();
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);
setappdata(0,'filename',a);


% Greyshade Button
function pushbutton2_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename', a_gray);
axes(handles.axes2);
imshow(a_gray);


% Black and White Button
function pushbutton4_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes2);
imshow(a_bw);
setappdata(0,'filename',a_bw);


% Reset Button
function pushbutton5_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
imshow(a);


% Exit Button
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Exiting Image Processing Tool by Vandana');
pause(1);
close();
close();



function edit1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
