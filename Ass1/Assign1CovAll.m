%Author: P. Harsha Vardhan (11010281)
%This file has Covariance Calculations of all parts of Question 1(a)
clc;
clear all;
close all;
%%
%Question 1(a).(i):Mean and Covariance Calculation
%--------------------------Mean and Covariance of 'e' Train Characters----------------------------------%
dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
%-------------------------'e' Mean Finding----------------------------
img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1\',imageFiles(1).name));
imMean_E=imresize(img,0.25);
 for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1\',imageFiles(i).name));
    img=imresize(img,0.25);
    imMean_E=imadd(double(imMean_E),double(img));
 end
 imMean_E=imMean_E/200; 
 imshow(imMean_E);
 imMean_E=imMean_E(:); 
 %-----------------------'e' Covariance Finding--------------------------
 imCovariance_E=zeros(1024,1024);
  for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_E=imsubtract(double(img),double(imMean_E));
    imCovariance_E=imCovariance_E+(imgXU_E)*(imgXU_E');    
  end
imCovariance_E=imCovariance_E/200;
imCovariance_E=imCovariance_E+0.37.*eye(1024,1024);      %lambda=0.37
detCovariance_E=det(imCovariance_E)
figure, imshow(imCovariance_E)

%--------------------------Mean and Covariance of 'c' Train Characters----------------------------------%
dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\2';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
%-------------------------'c' Mean Finding----------------------------
img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\2\',imageFiles(1).name));
imMean_C=imresize(img,0.25);
 for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\2\',imageFiles(i).name));
    img=imresize(img,0.25);
    imMean_C=imadd(double(imMean_C),double(img));
 end
 imMean_C=imMean_C/200; 
 figure, imshow(imMean_C);
 imMean_C=imMean_C(:); 
 %-----------------------'c' Covariance Finding--------------------------
 imCovariance_C=zeros(1024,1024);
  for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\2\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_C=imsubtract(double(img),double(imMean_C));
    imCovariance_C=imCovariance_C+(imgXU_C)*(imgXU_C');    
  end
imCovariance_C=imCovariance_C/200;
imCovariance_C=imCovariance_C+0.37*eye(1024,1024);    %lambda=0.37
detCovariance_C=det(imCovariance_C)
figure, imshow(imCovariance_C)

%--------------------------Mean and Covariance of 'i' Train Characters----------------------------------%
dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\3';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
%-------------------------'i' Mean Finding----------------------------
img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\3\',imageFiles(1).name));
imMean_I=imresize(img,0.25);
 for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\3\',imageFiles(i).name));
    img=imresize(img,0.25);
    imMean_I=imadd(double(imMean_I),double(img));
 end
 imMean_I=imMean_I/200; 
 figure, imshow(imMean_I);
 imMean_I=imMean_I(:); 
 %-----------------------'i' Covariance Finding--------------------------
 imCovariance_I=zeros(1024,1024);
  for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\3\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_I=imsubtract(double(img),double(imMean_I));
    imCovariance_I=imCovariance_I+(imgXU_I)*(imgXU_I');    
  end
imCovariance_I=imCovariance_I/200;
imCovariance_I=imCovariance_I+0.5*eye(1024,1024); %lambda=0.5
detCovariance_I=det(imCovariance_I)
figure, imshow(imCovariance_I)


 %%
 %Question 1(a).(ii) :Covariance Calculation
 %--------------------Pooled Covariance without zeroing non-diagonal elements

imMean_Pool=(imMean_E+imMean_C+imMean_I)/3;

imCovariance_Pool=zeros(1024,1024);
  for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_Pool=imsubtract(double(img),double(imMean_Pool));
    imCovariance_Pool=imCovariance_Pool+(imgXU_Pool)*(imgXU_Pool');    
  end
  
    for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\2\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_Pool=imsubtract(double(img),double(imMean_Pool));
    imCovariance_Pool=imCovariance_Pool+(imgXU_Pool)*(imgXU_Pool');    
    end

    for i=1:numel(imageFiles)
    img=imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\3\',imageFiles(i).name));
    img=imresize(img,0.25);
    img=img(:);
    imgXU_Pool=imsubtract(double(img),double(imMean_Pool));
    imCovariance_Pool=imCovariance_Pool+(imgXU_Pool)*(imgXU_Pool');    
    end
    
    imCovariance_Pool=imCovariance_Pool/600;
    imCovariance_Pool=imCovariance_Pool+0.25*eye(1024,1024);
    detCovariance_Pool=det(imCovariance_Pool)
    figure, imshow(imCovariance_Pool)
    
%%
%Question 1(a).(iii):Covariance Calculation
%-----------Individual Covariances with Non Diagonal Elements to be Zero----------
 
 imCovariance_E_NDZ=(eye(1024,1024)).*imCovariance_E;
 imCovariance_C_NDZ=(eye(1024,1024)).*imCovariance_C;
 imCovariance_I_NDZ=(eye(1024,1024)).*imCovariance_I;

imCovariance_E_NDZ=imCovariance_E_NDZ-0.21*eye(1024,1024); %lambda=0.21
imCovariance_C_NDZ=imCovariance_C_NDZ-0.225*eye(1024,1024); %lambda=0.225
imCovariance_I_NDZ=imCovariance_I_NDZ-0.19*eye(1024,1024); %lambda=0.19
detCovariance_E_NDZ=det(imCovariance_E_NDZ)
detCovariance_C_NDZ=det(imCovariance_C_NDZ)
detCovariance_I_NDZ=det(imCovariance_I_NDZ)
figure, imshow(imCovariance_E_NDZ);
figure, imshow(imCovariance_C_NDZ);
figure, imshow(imCovariance_I_NDZ);

 %%
 %Question 1(a).(iv) :Covariance Calculation
 %------------Pooled covariance after zeroing non-zero diagonal elements

 imCovariance_Pool_NDZ=(eye(1024,1024)).*imCovariance_Pool;
 imCovariance_Pool_NDZ=imCovariance_Pool_NDZ-0.14*eye(1024,1024);
 detCovariance_Pool_NDZ=det(imCovariance_Pool_NDZ)
 figure, imshow(imCovariance_Pool_NDZ)
 
 %%
 %Question 1(a).(v):Covariance Calculation
 %-------------------Spherical Covariance--------------%
 %----------here, Covarince is assumed to be Identity Matrix-------%
 figure, imshow(eye(1024,1024));