clc;
clear all;
close all;
load('pattern1.mat','train_pattern_1');
load('pattern2.mat','train_pattern_2');
for i=1:200
    if(i==1)
        x1=train_pattern_1{1}';
         x2=train_pattern_2{1}';
    else
        x1=[x1 train_pattern_1{i}'];
        x2=[x2 train_pattern_2{i}'];
    end
end
x1=x1';
x2=x2';
one=[ones(200,1);-ones(200,1)];
Y=[one [x1;-x2]];

a=zeros(121,1);
for i=1:1000000
pro=Y*a;

nn=find(pro<=0);
if(length(nn)==0)
    i
    break;
end
a=a+sum(Y(nn,:))';
end
load('Test1.mat','test_pattern_1');
load('Test2.mat','test_pattern_2');
for i=1:100
    if(i==1)
        x1=test_pattern_1{1}';
         x2=test_pattern_2{1}';
    else
        x1=[x1 test_pattern_1{i}'];
        x2=[x2 test_pattern_2{i}'];
    end
end
x1=x1';
x2=x2';
one=[ones(100,1);-ones(100,1)];
Y=[one [x1;-x2]];
pro=Y*a;
accuracy=length(find(pro>=0))/2

load('pattern1.mat','train_pattern_1');
load('pattern3.mat','train_pattern_3');
for i=1:200
    if(i==1)
        x1=train_pattern_1{1}';
         x2=train_pattern_3{1}';
    else
        x1=[x1 train_pattern_1{i}'];
        x2=[x2 train_pattern_3{i}'];
    end
end
x1=x1';
x2=x2';
one=[ones(200,1);-ones(200,1)];
Y=[one [x1;-x2]];

a=zeros(121,1);
for i=1:1000000
pro=Y*a;

nn=find(pro<=0);
if(length(nn)==0)
    i
    break;
end
a=a+sum(Y(nn,:))';
end

load('Test1.mat','test_pattern_1');
load('Test3.mat','test_pattern_3');
for i=1:100
    if(i==1)
        x1=test_pattern_1{1}';
         x2=test_pattern_3{1}';
    else
        x1=[x1 test_pattern_1{i}'];
        x2=[x2 test_pattern_3{i}'];
    end
end
x1=x1';
x2=x2';
one=[ones(100,1);-ones(100,1)];
Y=[one [x1;-x2]];
pro=Y*a;
accuracy=length(find(pro>=0))/2