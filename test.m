function test(testdir, n, code, traindir, recording)

k=16;
global result
for k=1:n                      
    file = sprintf('%ss%d.wav', testdir, k);
    disp(file);
    
    
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % Compute MFCC's
   
    distmin = inf;
    k1 = 0;
    filenames = ls(traindir);
    filenames = filenames(3:end,:)
    for l = 1:length(code)     
        d = distance(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;
            k1 = l;
            result= filenames(l,:)
        end      
    end
    if(k1==0)
        disp("Unknown user")
    
    else
       msg1 = sprintf('Speaker %d matches with   ', k);
       msg2= result;
       msg= strcat(msg1, "  ",  msg2);
       disp(msg)
    end
    end
    msg3=result;
    msg4='Hello  ';
    message= strcat(msg4 , " " , msg3);
    msgbox({'Welcome', message, 'Thank you'} )
end