function code = train(traindir)

k = 16;                        
filenames=ls(traindir);
filenames=filenames(3:end,:)
n=size(filenames,1);

for i=1:n                  
    file = sprintf('%ss%d.wav', traindir, i);
    file=filenames(i,:);
    disp(file);
    
    [s, fs] = audioread([traindir filenames(i,:)]);
     
    v = mfcc(s, fs);            % Compute MFCC's
   
    code{i} = vqCodeBook(v, k);     
end