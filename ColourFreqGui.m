function varargout = ColourFreqGui(varargin)
% COLOURFREQGUI MATLAB code for ColourFreqGui.fig
%      COLOURFREQGUI, by itself, creates a new COLOURFREQGUI or raises the existing
%      singleton*.
%
%      H = COLOURFREQGUI returns the handle to a new COLOURFREQGUI or the handle to
%      the existing singleton*.
%
%      COLOURFREQGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLOURFREQGUI.M with the given input arguments.
%
%      COLOURFREQGUI('Property','Value',...) creates a new COLOURFREQGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ColourFreqGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ColourFreqGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ColourFreqGui

% Last Modified by GUIDE v2.5 14-Oct-2017 20:23:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ColourFreqGui_OpeningFcn, ...
    'gui_OutputFcn',  @ColourFreqGui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before ColourFreqGui is made visible.
function ColourFreqGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ColourFreqGui (see VARARGIN)

% Choose default command line output for ColourFreqGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%%
G = [12.250, 24.5, 48.999, 97.999, 195.998, 391.995, 783.991, 1567.982, 3135.963, 6271.927, 0, 0, 0];

G = G.';

Ab = [12.978, 25.957, 51.913, 103.826, 207.652, 415.305, 830.609, 1661.219, 3322.438, 6644.875, 0, 0, 0];
Ab = Ab.';

A = [6.875,13.75, 27.50, 55, 110, 220, 440, 880, 1760, 3520, 7040, 0, 0];
A = A.';

Ash = [14.568, 29.135, 58.27, 116.541, 233.082, 466.164, 932.328, 1864.655, 3729.310, 7458.620, 0, 0, 0];
Ash = Ash.';

B =  [15.434, 30.868, 61,735, 123.471, 246.942, 493.883, 987.767, 1975.533, 3951.066, 7902.133, 0, 0];
B = B.';

C = [4.088, 8.176, 16.352, 32.703, 65.406, 130.813, 261.626, 523.251, 1046.502, 2093.005, 4186.009, 8372.018, 0];
C = C.';

Csh = [8.662, 17.324, 34.648, 69.296, 138.591, 277.183, 554.365, 1108.731, 2217.461, 4434.922, 8869.844, 0, 0];
Csh = Csh.';

D = [9.177, 18.354, 36.708, 73.416, 146.832, 293.665, 587.330, 1174.659, 2349.318, 4698.636, 9397.273, 0, 0];
D = D.';

Eb = [9.723, 19.445, 38.891, 77.782, 155.563, 311.127, 622.254, 1244.508, 2489.016, 1244.508, 2489.016, 4978.032, 9956.063];
Eb = Eb.';

E = [10.301, 20.602, 41.203, 82.407, 164.814, 329.628, 659.255, 1318.51, 2637.02, 5274.041, 0, 0, 0];
E = E.';

F = [10.913, 21.27, 43.654, 87.307, 174.614, 349.228, 698.456, 1396.913, 2793.826, 5587.642, 0, 0, 0];
F = F.';

Fsh = [11.562, 23.125, 46.249, 92.499, 184.997, 369.994, 739.989, 1479.978, 2959.955, 5919.911, 0, 0, 0];
Fsh = Fsh.';

Scale = [G,Ab,A,Ash,B,C,Csh,D,Eb,E,F,Fsh];

setappdata(0,'Scale',Scale);
%%


%%








% UIWAIT makes ColourFreqGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ColourFreqGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in ColourSelect.
function ColourSelect_Callback(hObject, eventdata, handles)
% hObject    handle to ColourSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

char = cellstr(get(hObject,'String'));
colour = char{get(hObject,'Value')};

setappdata(0,'colour',colour);
Fs = 44100;
setappdata(0,'Fs',Fs);

t = (0:1/Fs:5)';

switch colour
    
    case '---'
        set(handles.ColourValue,'String','Choose Colour')
        
    case 'Red'
        
        set(handles.ColourValue,'String','Red')
        Red = ((43+48)/2)*10^12;
        
        RedAud = Red/(2^36);
        
        
        set(handles.Freq,'String',RedAud)
        
        Wo = 2*pi*RedAud;
        
        RdWav = sin(Wo*t);
        
        setappdata(0,'RdWav',RdWav)
        
        
        axes(handles.axes1);
        plot(t(1:1000),RdWav(1:1000));
        xlabel('Time(s)');
        ylabel('Amplitude');
        
        X1 = fft(RdWav);
        
        
        
        
        Scale = getappdata(0,'Scale');
        
        [close,column] = min(abs(Scale-RedAud));
        
        
        
        [Hz interval] = min(close);  %Hz gives Hz difference
        
        Column = column(interval)
        PitchFreq = Scale(Column,interval)
        
        set(handles.difpitch,'String',Hz)
        
        Scalenote = {'G','Ab','A#','A','B','C','C#','D','Eb','E','F','F#'};
        
        
        Note = string(Scalenote(interval)); %Note gives note as a string
        
        set(handles.Closepitch,'String',Note)
        set(handles.notepitch,'String',PitchFreq);
        
        
        
        
    case 'Green'
        set(handles.ColourValue,'String','Green')
        
        Green = 56*10^12; %560 THz
        
        GreenAud = Green/(2^36);
        
        
        set(handles.Freq,'String',GreenAud)
        
        Wo = 2*pi*GreenAud;
        
        GrnWav = sin(Wo*t);
        setappdata(0,'GrnWav',GrnWav)
        
        axes(handles.axes1);
        plot(t(1:1000),GrnWav(1:1000));
        xlabel('Time(s)');
        ylabel('Amplitude');
        
        X1 = fft(GrnWav);
        
        
        Scale = getappdata(0,'Scale');
        
        [close, column] = min(abs(Scale-GreenAud));
        
        [Hz interval] = min(close);  %Hz gives Hz difference
        
        Column = column(interval)
        PitchFreq = Scale(Column,interval)
        set(handles.difpitch,'String',Hz)
        
        Scalenote = {'G','Ab','A#','A','B','C','C#','D','Eb','E','F','F#'};
        
        
        Note = string(Scalenote(interval)); %Note gives note as a string
        
        set(handles.Closepitch,'String',Note)
        set(handles.notepitch,'String',PitchFreq);
        
        
        
    case 'Blue'
        
        set(handles.ColourValue,'String','Blue')
        
        Blue = ((61+67)/2)*10^12;
        
        BlueAud = Blue/(2^36);
        
        set(handles.Freq,'String',BlueAud)
        
        Wo = 2*pi*BlueAud;
        
        BluWav = sin(Wo*t);
        setappdata(0,'BluWav',BluWav)
        axes(handles.axes1);
        plot(t(1:1000),BluWav(1:1000));
        xlabel('Time(s)');
        ylabel('Amplitude');
        
        X1 = fft(BluWav);
        
        
        
        
        Scale = getappdata(0,'Scale');
        
        [close, column] = min(abs(Scale-BlueAud));
        
        [Hz interval] = min(close);  %Hz gives Hz difference
        
        Column = column(interval);
        PitchFreq = Scale(Column,interval);
        set(handles.difpitch,'String',Hz);
        
        Scalenote = {'G','Ab','A#','A','B','C','C#','D','Eb','E','F','F#'};
        
        
        Note = string(Scalenote(interval)); %Note gives note as a string
        
        set(handles.Closepitch,'String',Note);
        
        set(handles.notepitch,'String',PitchFreq);
        
        
end



switch colour
    
    
    case '---'
        
    otherwise
        
        NFFT = length(X1);
        f = linspace (0,Fs,NFFT);
        axes(handles.axes2);
        plot(f(1:NFFT/2),abs(X1(1:NFFT/2)))
        xlabel('Freq(Hz)')
        ylabel('Amplitude');
        
        
        
        
end



% Hints: contents = cellstr(get(hObject,'String')) returns ColourSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ColourSelect


% --- Executes during object creation, after setting all properties.
function ColourSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ColourSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SaveFile.
function SaveFile_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
colour = getappdata(0,'colour');
Fs = getappdata(0,'Fs');



switch colour
    
    case '---'
        'u messed up'
    case 'Red'
        RdWav = getappdata(0,'RdWav');
        
        
        audiowrite('Red.wav',RdWav,Fs);
        
    case 'Green'
        GrnWav = getappdata(0,'GrnWav');
        
        audiowrite('Green.wav',GrnWav,Fs);
        
    case 'Blue'
        
        BluWav = getappdata(0,'BluWav');
        
        
        audiowrite('Blue.wav',BluWav,Fs);
        
end



% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

colour = getappdata(0,'colour');
Fs = getappdata(0,'Fs');



switch colour
    
    case '---'
        'u messed up'
    case 'Red'
        RdWav = getappdata(0,'RdWav');
        
        'u did Red'
        
        sound(RdWav,Fs);
        
    case 'Green'
        GrnWav = getappdata(0,'GrnWav');
        'u did green'
        
        sound(GrnWav,Fs);
        
    case 'Blue'
        
        BluWav = getappdata(0,'BluWav');
        
        'u did blue'
        
        sound(BluWav,Fs);
        
end
