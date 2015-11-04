%Author: P. Harsha Vardhan (11010281)
%This file has Decision Statistics of Question 1(a)&(b).(i)and 1(a)&(b).iii
%%
%Question 1(a).(i): Decision Calculation
%-------------------Decision Statistics without Zeroing Non-Diagonal Elements of Individual Covariance Matrices-----------------
display('Question 1(a).(i): Decision Statistics without Zeroing Non-Diagonal Elements of Individual Covariance Matrices');
E_Counter_e=0;
E_Counter_c=0;
E_Counter_i=0;
E_Array=zeros(1,100); 

C_Counter_e=0;
C_Counter_c=0;
C_Counter_i=0;
C_Array=zeros(1,100);

I_Counter_e=0;
I_Counter_c=0;
I_Counter_i=0;
I_Array=zeros(1,100);

dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles);
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        E_Counter_e=E_Counter_e+1;
        E_Array(i)=1;
    end
    if max(A)==G_C
        E_Counter_c=E_Counter_c+1;
        E_Array(i)=2;
        display(['Que 1(b).(i) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as C']);
    end
    if max(A)==G_I
        E_Counter_i=E_Counter_i+1;
        E_Array(i)=3;
        display(['Que 1(b).(i) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\2\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        C_Counter_e=C_Counter_e+1;
        C_Array(i)=1;
        display(['Que 1(b).(i) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as E']);
    end
    if max(A)==G_C
        C_Counter_c=C_Counter_c+1;
        C_Array(i)=2;
    end
    if max(A)==G_I
        C_Counter_i=C_Counter_i+1;
        C_Array(i)=3;
        display(['Que 1(b).(i) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\3\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        I_Counter_e=I_Counter_e+1;
        I_Array(i)=1;
        display(['Que 1(b).(i) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as E']);
    end
    if max(A)==G_C
        I_Counter_c=I_Counter_c+1;
        I_Array(i)=2;
        display(['Que 1(b).(i) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as C']);
    end
    if max(A)==G_I
        I_Counter_i=I_Counter_i+1;
        I_Array(i)=3;
    end
end
display(' ');
display(['Que 1(a).(i) E Test Characters: ' num2str(E_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) E Test Characters: ' num2str(E_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) E Test Characters: ' num2str(E_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) C Test Characters: ' num2str(C_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) C Test Characters: ' num2str(C_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) C Test Characters: ' num2str(C_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) I Test Characters: ' num2str(I_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(i) I Test Characters: ' num2str(I_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(i) I Test Characters: ' num2str(I_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(i) Accuracy of E test characters: ' num2str(E_Counter_e) '%']);
display(['Que 1(a).(i) Accuracy of C test characters: ' num2str(C_Counter_c) '%']);
display(['Que 1(a).(i) Accuracy of I test characters: ' num2str(I_Counter_i) '%']);
display(['Que 1(a).(i) Average accuracy of all test characters: ' num2str((E_Counter_e+C_Counter_c+I_Counter_i)/3) '%']);
display(' ');
%%
%Question 1(a).(iii): Decision Calculation
%-------------------Decision Statistics with Zeroing Non-Diagonal Elements of Individual Covariance Matrices-----------------
display('Question 1(a).(iii): Decision Statistics with Zeroing Non-Diagonal Elements of Individual Covariance Matrices');
NDZ_E_Counter_e=0;
NDZ_E_Counter_c=0;
NDZ_E_Counter_i=0;
NDZ_E_Array=zeros(1,100);

NDZ_C_Counter_e=0;
NDZ_C_Counter_c=0;
NDZ_C_Counter_i=0;
NDZ_C_Array=zeros(1,100);

NDZ_I_Counter_e=0;
NDZ_I_Counter_c=0;
NDZ_I_Counter_i=0;
NDZ_I_Array=zeros(1,100);


dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles);
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\1\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I_NDZ)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_E_Counter_e=NDZ_E_Counter_e+1;
        NDZ_E_Array(i)=1;
    end
    if max(A)==G_C
        NDZ_E_Counter_c=NDZ_E_Counter_c+1;
        NDZ_E_Array(i)=2;
        display(['Que 1(b).(iii) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as C']);
    end
    if max(A)==G_I
        NDZ_E_Counter_i=NDZ_E_Counter_i+1;
        NDZ_E_Array(i)=3;
        display(['Que 1(b).(iii) E Test Characters:Image File Number ' num2str(i+200) ' is E but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\2\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I_NDZ)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_C_Counter_e=NDZ_C_Counter_e+1;
        NDZ_C_Array(i)=1;
        display(['Que 1(b).(iii) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as E']);
    end
    if max(A)==G_C
        NDZ_C_Counter_c=NDZ_C_Counter_c+1;
        NDZ_C_Array(i)=2;
    end
    if max(A)==G_I
        NDZ_C_Counter_i=NDZ_C_Counter_i+1;
        NDZ_C_Array(i)=3;
        display(['Que 1(b).(iii) C Test Characters:Image File Number ' num2str(i+200) ' is C but detected as I']);
    end
end
display(' ');
for i=1:numel(imageFiles)
    imgTest=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TestCharacters\3\',imageFiles(i).name));
    imgTest=imresize(imgTest,0.25);
    imgTest=imgTest(:);
    G_E=-(1/2)*(double(imgTest)-double(imMean_E))'*(double(imCovariance_E_NDZ)\(double(imgTest)-double(imMean_E)))-((1/2)*double(log(detCovariance_E_NDZ)));
    G_C=-(1/2)*(double(imgTest)-double(imMean_C))'*(double(imCovariance_C_NDZ)\(double(imgTest)-double(imMean_C)))-((1/2)*double(log(detCovariance_C_NDZ)));
    G_I=-(1/2)*(double(imgTest)-double(imMean_I))'*(double(imCovariance_I_NDZ)\(double(imgTest)-double(imMean_I)))-((1/2)*double(log(detCovariance_I_NDZ)));
    A=[G_E G_C G_I];
    if max(A)==G_E
        NDZ_I_Counter_e=NDZ_I_Counter_e+1;
        NDZ_I_Array(i)=1;
        display(['Que 1(b).(iii) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as E']);
    end
    if max(A)==G_C
        NDZ_I_Counter_c=NDZ_I_Counter_c+1;
        NDZ_I_Array(i)=2;
        display(['Que 1(b).(iii) I Test Characters:Image File Number ' num2str(i+200) ' is I but detected as C']);
    end
    if max(A)==G_I
        NDZ_I_Counter_i=NDZ_I_Counter_i+1;
        NDZ_I_Array(i)=3;
    end
end
display(' ');
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_E_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_E_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) E Test Characters: ' num2str(NDZ_E_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_C_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_C_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) C Test Characters: ' num2str(NDZ_C_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_I_Counter_e) ' image files are detected as E']);
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_I_Counter_c) ' image files are detected as C']);
display(['Que 1(a).(iii) I Test Characters: ' num2str(NDZ_I_Counter_i) ' image files are detected as I']);
display(' ');
display(['Que 1(a).(iii) Accuracy of E test characters: ' num2str(NDZ_E_Counter_e) '%']);
display(['Que 1(a).(iii) Accuracy of C test characters: ' num2str(NDZ_C_Counter_c) '%']);
display(['Que 1(a).(iii) Accuracy of I test characters: ' num2str(NDZ_I_Counter_i) '%']);
display(['Que 1(a).(iii) Average accuracy of all test characters: ' num2str((NDZ_E_Counter_e+NDZ_C_Counter_c+NDZ_I_Counter_i)/3) '%']);