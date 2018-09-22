function check= secondstep()
close all;
clc;
recorder =  audiorecorder(32000, 16,1);
%disp('Please record your voice');
drawnow();
pause(1);
recordblocking(recorder, 5);
play(recorder);
data= getaudiodata(recorder);
plot(data)
filename1 = strcat('s1', '.wav');
filename= strcat('C:\Users\Dell-pc\Desktop\ROBOTICS\Speech-Recognition-master\project nimbus\data\test\', filename1);
audiowrite(filename,data,32000)
check=[];
end