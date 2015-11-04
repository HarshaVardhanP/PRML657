 

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
    imshow(imCovariance_Pool)
    
    %------------Pooled covariance after zeroing non-zero diagonal elements

    imCovariance_Pool_NDZ=(eye(1024,1024)).*imCovariance_Pool;
    imCovariance_Pool_NDZ=imCovariance_Pool_NDZ-0.14*eye(1024,1024);
    detCovariance_Pool_NDZ=det(imCovariance_Pool_NDZ)
    figure, imshow(imCovariance_Pool_NDZ)
  
  