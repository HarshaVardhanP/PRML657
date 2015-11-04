clc;
clear all;
close all;
%--------------------------Mean and Covariance of 'e' Train Characters----------------------------------%
dirName='D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1';
imageFiles=dir(fullfile(dirName,'*.jpg'));
numel(imageFiles)
% imcell = cell(1,numel(imageFiles));
% for i = 1:numel(imageFiles)
%  imcell{i} = imread(strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass1\TrainCharacters\1\',imageFiles(i).name));
% end
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

%--------------------------Mean and Covariance of 'l' Train Characters----------------------------------%
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


%--------------------------------Non Diagonal Elements to be Zero----------
 
 imCovariance_E_NDZ=(eye(1024,1024)).*imCovariance_E;
 imCovariance_C_NDZ=(eye(1024,1024)).*imCovariance_C;
 imCovariance_I_NDZ=(eye(1024,1024)).*imCovariance_I;
%  figure, imshow(imCovariance_E_NDZ);
%  figure, imshow(imCovariance_C_NDZ);
%  figure, imshow(imCovariance_I_NDZ);
imCovariance_E_NDZ=imCovariance_E_NDZ-0.21*eye(1024,1024); %lambda=0.21
imCovariance_C_NDZ=imCovariance_C_NDZ-0.225*eye(1024,1024); %lambda=0.225
imCovariance_I_NDZ=imCovariance_I_NDZ-0.19*eye(1024,1024); %lambda=0.19
detCovariance_E_NDZ=det(imCovariance_E_NDZ)
detCovariance_C_NDZ=det(imCovariance_C_NDZ)
detCovariance_I_NDZ=det(imCovariance_I_NDZ)

 
