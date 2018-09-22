
function recording = firststep()
close all;
clc;
recorder =  audiorecorder(32000,16,1);
disp('Please record your voice');
drawnow();
pause(1);
recordblocking(recorder, 5);
play(recorder);
data= getaudiodata(recorder);
plot(data)
name = input('what is your name: ', 's')
filename1 = strcat(name, '.wav');
filename= strcat('C:\Users\Dell-pc\Desktop\ROBOTICS\Speech-Recognition-master\project nimbus\data\train\', filename1);
disp(filename)
audiowrite(filename,data,32000)
recording=name;
end