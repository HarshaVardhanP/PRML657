
%clc ; 
%clear all;
%close all;

list = dir('*.jpg');
for i = 1:length(list)
    img_i{i} = imread(list(i).name);
   % imshow(list(75).name);
end

% mean

display(length(list))

R = 128;
C = 128;
for i = 1 : R
    for j = 1 : C
        mean_i(i,j) = 0;
    end
end


for i = 1 : R
    for j = 1 : C
        for k = 1:200
            mean_i(i,j) = mean_i(i,j)+img_i{k}(i,j);
        end
    end
end

mean_i = (1/200)*(mean_i);




            