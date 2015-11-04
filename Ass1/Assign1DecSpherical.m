%Author: P. Harsha Vardhan (11010281)
%This file has Decision Statistics of Question 1(a)&(b).(v)
%%
%Question 1(a).(V): Decision Calculation
%-------------------Decision Statistics with spherical covariance-----------------
display('Question 1(a).(v): Decision Statistics with Spherical Covariance Matrix');
SC_E_Counter_e=0;
SC_E_Counter_c=0;
SC_E_Counter_i=0;
SC_E_Array=zeros(1,100);

SC_C_Counter_e=0;
SC_C_Counter_c=0;
SC_C_Counter_i=0;
SC_C_Array=zeros(1,100);

SC_I_Counter_e=0;
SC_I_Counter_c=0;
SC_I_Counter_i=0;
SC_I_Array=zeros(1,100);


dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        SC_E_Counter_e=SC_E_Counter_e+1;
        SC_E_Array(i)=1;
    end
    if max(A)==G_C
        SC_E_Counter_c=SC_E_Counter_c+1;
        SC_E_Array(i)=2;
        display(['Que 1(b).(v) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as C']);
    end
    if max(A)==G_I
        SC_E_Counter_i=SC_E_Counter_i+1;
        SC_E_Array(i)=3;
        display(['Que 1(b).(v) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\2\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        SC_C_Counter_e=SC_C_Counter_e+1;
        SC_C_Array(i)=1;
        display(['Que 1(b).(v) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as E']);
    end
    if max(A)==G_C
        SC_C_Counter_c=SC_C_Counter_c+1;
        SC_C_Array(i)=2;
    end
    if max(A)==G_I
        SC_C_Counter_i=SC_C_Counter_i+1;
        SC_C_Array(i)=3;
        display(['Que 1(b).(v) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\3\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(eye(1024,1024))\(double(imgTest)-double(imMean_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        SC_I_Counter_e=SC_I_Counter_e+1;
        SC_I_Array(i)=1;
        display(['Que 1(b).(v) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as E']);
    end
    if max(A)==G_C
        SC_I_Counter_c=SC_I_Counter_c+1;
        SC_I_Array(i)=2;
        display(['Que 1(b).(v) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as C']);
    end
    if max(A)==G_I
        SC_I_Counter_i=SC_I_Counter_i+1;
        SC_I_Array(i)=3;
    end
end
display(' ');
display(['Que 1(a).(v) E Test Characters: ' num2str(SC_E_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(v) E Test Characters: ' num2str(SC_E_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(v) E Test Characters: ' num2str(SC_E_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(v) C Test Characters: ' num2str(SC_C_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(v) C Test Characters: ' num2str(SC_C_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(v) C Test Characters: ' num2str(SC_C_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(v) I Test Characters: ' num2str(SC_I_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(v) I Test Characters: ' num2str(SC_I_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(v) I Test Characters: ' num2str(SC_I_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(v) Accuracy of E test characters: ' num2str(SC_E_Counter_e) '%']);
display(['Que 1(a).(v) Accuracy of C test characters: ' num2str(SC_C_Counter_c) '%']);
display(['Que 1(a).(v) Accuracy of I test characters: ' num2str(SC_I_Counter_i) '%']);
display(['Que 1(a).(v) Average accuracy of all test characters: ' num2str((SC_E_Counter_e+SC_C_Counter_c+SC_I_Counter_i)/3) '%']);
display(' ');