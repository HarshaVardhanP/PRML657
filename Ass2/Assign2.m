%Author: P. Harsha Vardhan (11010281)
%EE 657; PRML Course ; Assignment 2
%This file has code for both tasks 1 & 2 of Assignment 2
clc;
clear all;
close all;
%%
%TASK 1
%--------------------------TASK 1 : Part (i) ----------------------------------%
%--------------------Displaying top 5 Eigen Faces -----------------------------%
folderNames=cell(40,1);
for k=1:40
folderNames{k}=['s' num2str(k)];
end
imGalleryCell=cell(40,5);
imMean=double(zeros(112,92));
for k=1:40
dirName=strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass2\Gallery\',folderNames{k});
imageFiles=dir(fullfile(dirName,'*.pgm'));
numel(imageFiles);
for i=1:numel(imageFiles)
img=imread(strcat(dirName,'\',imageFiles(i).name));
imGalleryCell{k,i}=double(img);
imMean=imMean+imGalleryCell{k,i};
end
end
imMean=imMean/200;
totalCell=cell(1,200);
for k=1:40
    for i=1:numel(imageFiles)
        totalCell{(5*k)+i-5}=imGalleryCell{k,i};
    end
end
 for i=1:200
    totalCell{i}=totalCell{i}(:);
 end
 %taking out of mean
 for i=1:200
    totalCell{i}=totalCell{i}-imMean(:);
 end
X=cell2mat(totalCell);
Cov=(X'*X)/200;
lambda=eig(Cov);
[V,D]=eig(Cov);
for i=1:5
    EigVecFive(:,i)=V(:,201-i);
end
for i=1:5
    EigenFaces(:,i)=X*EigVecFive(:,i);
end
for i=1:5
    subplot(2,3,i), imagesc(reshape(EigenFaces(:,i),112,92)); %%plotting the Top 5 EigenFaces 
    colormap(gray);
end
%--------------------------TASK 1 : Part (ii) ----------------------------------%
%----------------------------------------------%
eigSum=lambda(200);
eigVar=zeros(200,1);
eigVar(1)=lambda(200);
for i=2:200
    eigSum=eigSum+lambda(201-i);
    eigVar(i)= eigVar(i-1)+lambda(201-i);
end
 eigVar=eigVar/eigSum;
 figure, plot(eigVar);
 figure, plot(lambda);
for i=1:200
    if eigVar(i)>0.85
        display([ num2str(i) ,' number of dimensions are required for projecting the face vectors so that at least 85% of the total variance of the original data is accounted for in the reduced space.']);
        break
    end
end
 for i=1:200
    if eigVar(i)>0.95
        display([ num2str(i) ,' number of dimensions are required for projecting the face vectors so that at least 85% of the total variance of the original data is accounted for in the reduced space.']);
        break
    end
 end

 for i=1:200
    EigUnitVec(:,i)=X*V(:,i)/norm(X*V(:,i)); 
 end

%--------------------------TASK 1 : Part (iii) & (iv) & (v) ----------------------------------%
%---------Reconstruction of two given images and their mean sqare errors-----------------------%
Xtest=cell(2,1);
Xtest{1}=double(imread('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass2\face_input_1.pgm'));
Xtest{2}=double(imread('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass2\face_input_2.pgm'));
MeanSqErr=cell(2,1); MeanSqErr{1}=zeros(200,1);MeanSqErr{2}=zeros(200,1);
for y=1:2
    k=1;Xrec=zeros(10304,1);
for i=200:-1:1
    Xrec = Xrec + (((Xtest{y}(:)-imMean(:))')*EigUnitVec(:,i))*EigUnitVec(:,i);
    if i == (201-1) || i == (201-4) || i == (201-15) || i==(201-150) || i==(201-200)
        subplot(2,3,k), imagesc(reshape(Xrec+imMean(:),112,92));
        colormap(gray);
        k=k+1;
        a=norm(Xrec+imMean(:)-Xtest{y}(:));
        display( ['Mean Squared Error when ' num2str(201-i) ' eigen vectors are used is ' num2str((a^2)/10304)]);
    end
       MeanSqErr{y}(201-i)=((norm(Xrec+imMean(:)-Xtest{y}(:))^2)/10304);
end
  figure, plot(MeanSqErr{y});
end


%%
% -------------------------TASK 2 : CLASSIFICATION--------------------------------%
% --------------------25 Dimensional Reduced Subspace-----------------------------%
folderNames=cell(40,1);
for k=1:40
folderNames{k}=['s' num2str(k)];
end
imProbeCell=cell(40,5);
for k=1:40
dirName=strcat('D:\matlab2011a1\matlab2011a\bin\PRML657\Ass2\Probe\',folderNames{k});
imageFiles=dir(fullfile(dirName,'*.pgm'));
numel(imageFiles);
for i=1:numel(imageFiles)
img=imread(strcat(dirName,'\',imageFiles(i).name));
imProbeCell{k,i}=double(img);
end
end
%projecting gallery images to 25 dimensional space 
imGalleryProjCell=cell(40,5);
for k=1:40
   for z=1:5
       Xproj=zeros(25,1);
       Xtest=imGalleryCell{k,z};
       for i=200:-1:(200-24)
            Xproj(201-i) = (((Xtest(:)-imMean(:))')*EigUnitVec(:,i));
       end
       imGalleryProjCell{k,z}=Xproj;
   end
end
imProbeProjCell=cell(40,5);
for k=1:40
   for z=1:5
       Xproj=zeros(25,1);
       Xtest=imProbeCell{k,z};
       for i=200:-1:186
            Xproj(201-i) =(((Xtest(:)-imMean(:))')*EigUnitVec(:,i));
       end
       imProbeProjCell{k,z}=Xproj;
   end
end

MeanSqEr=zeros(200,1);
NN=zeros(40,5);
for i=1:40
    for j=1:5
        for k=1:40
            for z=1:5
                a=norm(imProbeProjCell{i,j}-imGalleryProjCell{k,z});
                MeanSqEr((5*k)+z-5)=((a^2)/10304);
            end
        end
        [C I]=min(MeanSqEr);
        NN(i,j)=I;
    end
end
result=0;
for i=1:40
    for j=1:5
        if NN(i,j)<=i*5 && NN(i,j)>(i-1)*5
            result=result+1;
        end
    end
end

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % -------------------------TASK 2 : Part(ii)-------------------------------%
% % ---------------------recognition Accuracies-------------------------------%
Result=zeros(200,1);
for l=1:200
    imProbeProjCell=cell(40,5); 
    imGalleryProjCell=cell(40,5);
for k=1:40
   for z=1:5
       Xproj=zeros(l,1);
       Xtest=imGalleryCell{k,z};
       for i=200:-1:(201-l)
            Xproj(201-i) = (((Xtest(:)-imMean(:))')*EigUnitVec(:,i));
       end
       imGalleryProjCell{k,z}=Xproj;
   end
end
for k=1:40
   for z=1:5
       Xproj=zeros(l,1);
       Xtest=imProbeCell{k,z};
       for i=200:-1:(201-l)
            Xproj(201-i) = (((Xtest(:)-imMean(:))')*EigUnitVec(:,i));
       end
       imProbeProjCell{k,z}=Xproj;
   end
end
MeanSqEr=zeros(200,1);
NN=zeros(40,5);
for i=1:40
    for j=1:5
        for k=1:40
            for z=1:5
                a=norm(imProbeProjCell{i,j}-imGalleryProjCell{k,z});
                MeanSqEr((5*k)+z-5)=((a^2)/10304);
            end
        end
        [C I]=min(MeanSqEr);
        NN(i,j)=I;
    end
end
result=0;
for i=1:40
    for j=1:5
        if NN(i,j)<=i*5 && NN(i,j)>(i-1)*5
            result=result+1;
        end
    end
end   
Result(l)=result;
display(['accuracy for ' num2str(l) ' dimensional space is ' num2str(Result(l)/200)]);
end
display(['accuracy for 25 dimensional space is ' num2str(Result(25)/200)]);






