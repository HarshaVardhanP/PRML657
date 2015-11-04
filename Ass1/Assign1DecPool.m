%Author: P. Harsha Vardhan (11010281)
%This file has Decision Statistics of Question 1(a)&(b).(ii) and 1(a)&(b).iv
%%
%Question 1(a).(ii): Decision Calculation
%-------------------Decision Statistics without zeroing Non diagonal elements of Pooled Covariance-----------------
display('Question 1(a).(ii): Decision Statistics without Zeroing Non-Diagonal Elements of Pooled Covariance Matrix');
Pool_E_Counter_e=0;
Pool_E_Counter_c=0;
Pool_E_Counter_i=0;
Pool_E_Array=zeros(1,100); 

Pool_C_Counter_e=0;
Pool_C_Counter_c=0;
Pool_C_Counter_i=0;
Pool_C_Array=zeros(1,100); 

Pool_I_Counter_e=0;
Pool_I_Counter_c=0;
Pool_I_Counter_i=0;
Pool_I_Array=zeros(1,100); 

dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        Pool_E_Counter_e=Pool_E_Counter_e+1;
        Pool_E_Array(i)=1;
    end
    if max(A)==G_C
        Pool_E_Counter_c=Pool_E_Counter_c+1;
        Pool_E_Array(i)=2;
        display(['Que 1(b).(ii) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as C']);
    end
    if max(A)==G_I
        Pool_E_Counter_i=Pool_E_Counter_i+1;
        Pool_E_Array(i)=3;
        display(['Que 1(b).(ii) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\2\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        Pool_C_Counter_e=Pool_C_Counter_e+1;
        Pool_C_Array(i)=1;
        display(['Que 1(b).(ii) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as E']);
    end
    if max(A)==G_C
        Pool_C_Counter_c=Pool_C_Counter_c+1;
        Pool_C_Array(i)=2;
    end
    if max(A)==G_I
        Pool_C_Counter_i=Pool_C_Counter_i+1;
        Pool_C_Array(i)=3;
        display(['Que 1(b).(ii) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\3\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        Pool_I_Counter_e=Pool_I_Counter_e+1;
        Pool_I_Array(i)=1;
        display(['Que 1(b).(ii) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as E']);
    end
    if max(A)==G_C
        Pool_I_Counter_c=Pool_I_Counter_c+1;
        Pool_I_Array(i)=2;
        display(['Que 1(b).(ii) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as C']);
    end
    if max(A)==G_I
        Pool_I_Counter_i=Pool_I_Counter_i+1;
        Pool_I_Array(i)=3;
    end
end
display(' ');
display(['Que 1(a).(i) E Test Characters: ' num2str(Pool_E_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) E Test Characters: ' num2str(Pool_E_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) E Test Characters: ' num2str(Pool_E_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) C Test Characters: ' num2str(Pool_C_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) C Test Characters: ' num2str(Pool_C_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) C Test Characters: ' num2str(Pool_C_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) I Test Characters: ' num2str(Pool_I_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) I Test Characters: ' num2str(Pool_I_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) I Test Characters: ' num2str(Pool_I_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) Accuracy of E test characters: ' num2str(Pool_E_Counter_e) '%']);
display(['Que 1(a).(i) Accuracy of C test characters: ' num2str(Pool_C_Counter_c) '%']);
display(['Que 1(a).(i) Accuracy of I test characters: ' num2str(Pool_I_Counter_i) '%']);
display(['Que 1(a).(i) Average accuracy of all test characters: ' num2str((Pool_E_Counter_e+Pool_C_Counter_c+Pool_I_Counter_i)/3) '%']);
display(' ');

%%
%Question 1(a).(iv): Decision Calculation
%-------Decision Statistics with Zeroing Non-Diagonal Elements of Pooled Covariance-----------------
%---NDZ stands for Non-Diagonal elements set to Zero--------
display('Question 1(a).(iv): Decision Statistics with Zeroing Non-Diagonal Elements of Pooled Covariance Matrix');
NDZ_Pool_E_Counter_e=0;
NDZ_Pool_E_Counter_c=0;
NDZ_Pool_E_Counter_i=0;
NDZ_Pool_E_Array=zeros(1,100); 

NDZ_Pool_C_Counter_e=0;
NDZ_Pool_C_Counter_c=0;
NDZ_Pool_C_Counter_i=0;
NDZ_Pool_C_Array=zeros(1,100); 

NDZ_Pool_I_Counter_e=0;
NDZ_Pool_I_Counter_c=0;
NDZ_Pool_I_Counter_i=0;
NDZ_Pool_I_Array=zeros(1,100); 

dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_Pool_E_Counter_e=NDZ_Pool_E_Counter_e+1;
        NDZ_Pool_E_Array(i)=1;
    end
    if max(A)==G_C
        NDZ_Pool_E_Counter_c=NDZ_Pool_E_Counter_c+1;
        NDZ_Pool_E_Array(i)=2;
        display(['Que 1(b).(iv) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as C']);
    end
    if max(A)==G_I
        NDZ_Pool_E_Counter_i=NDZ_Pool_E_Counter_i+1;
        NDZ_Pool_E_Array(i)=3;
        display(['Que 1(b).(iii) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\2\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_Pool_C_Counter_e=NDZ_Pool_C_Counter_e+1;
        NDZ_Pool_C_Array(i)=1;
        display(['Que 1(b).(iv) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as E']);
    end
    if max(A)==G_C
        NDZ_Pool_C_Counter_c=NDZ_Pool_C_Counter_c+1;
        NDZ_Pool_C_Array(i)=2;
    end
    if max(A)==G_I
        NDZ_Pool_C_Counter_i=NDZ_Pool_C_Counter_i+1;
        NDZ_Pool_C_Array(i)=3;
        display(['Que 1(b).(iv) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as I']);
    end
end
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\3\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_Pool_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_Pool_NDZ)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_Pool_I_Counter_e=NDZ_Pool_I_Counter_e+1;
        NDZ_Pool_I_Array(i)=1;
        display(['Que 1(b).(iv) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as E']);
    end
    if max(A)==G_C
        NDZ_Pool_I_Counter_c=NDZ_Pool_I_Counter_c+1;
        NDZ_Pool_I_Array(i)=2;
        display(['Que 1(b).(iv) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as C']);
    end
    if max(A)==G_I
        NDZ_Pool_I_Counter_i=NDZ_Pool_I_Counter_i+1;
        NDZ_Pool_I_Array(i)=3;
    end
end
display(' ');
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_Pool_E_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_Pool_E_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_Pool_E_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_Pool_C_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_Pool_C_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_Pool_C_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_Pool_I_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_Pool_I_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_Pool_I_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) Accuracy of E test characters: ' num2str(NDZ_Pool_E_Counter_e) '%']);
display(['Que 1(a).(iii) Accuracy of C test characters: ' num2str(NDZ_Pool_C_Counter_c) '%']);
display(['Que 1(a).(iii) Accuracy of I test characters: ' num2str(NDZ_Pool_I_Counter_i) '%']);
display(['Que 1(a).(iii) Average accuracy of all test characters: ' num2str((NDZ_Pool_E_Counter_e+NDZ_Pool_C_Counter_c+NDZ_Pool_I_Counter_i)/3) '%']);
display(' ');