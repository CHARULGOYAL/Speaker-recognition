function varargout = guisec(varargin)




i=1;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guisec_OpeningFcn, ...
                   'gui_OutputFcn',  @guisec_OutputFcn, ...
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

end


function guisec_OpeningFcn(hObject, eventdata, handles, varargin)



handles.output = hObject;


guidata(hObject, handles);


end



function varargout = guisec_OutputFcn(hObject, ~, handles) 

varargout{1} = handles.output;
end


function pushbutton1_Callback(hObject, eventdata, handles)
global recording;
recording = firststep()

end


function pushbutton2_Callback(hObject, eventdata, handles)
check= secondstep()
global recording;
global code;
code = train('C:\Users\Dell-pc\Desktop\ROBOTICS\Speech-Recognition-master\project nimbus\data\train\')
test('C:\Users\Dell-pc\Desktop\ROBOTICS\Speech-Recognition-master\project nimbus\data\test\',1, code,'C:\Users\Dell-pc\Desktop\ROBOTICS\Speech-Recognition-master\project nimbus\data\train\' , recording) %change this address to your currrent address

end
