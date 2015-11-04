%EE 657; PRML Course ; Assignment 5
%This file has code for task 1 of Assignment 5
clc;
clear all;
close all;
%%
load('Pattern1.mat');
load('Pattern2.mat');
load('Pattern3.mat');
load('Test1.mat');
load('Test2.mat');
load('Test3.mat');
for i=1:200
    train_pattern_1{:,i} = train_pattern_1{:,i}';
    train_pattern_2{:,i} = train_pattern_2{:,i}';
    train_pattern_3{:,i} = train_pattern_3{:,i}';
end
for i=1:100
    test_pattern_1{:,i} = test_pattern_1{:,i}';
    test_pattern_2{:,i} = test_pattern_2{:,i}';
    test_pattern_3{:,i} = test_pattern_3{:,i}';
end
Pattern1=cell2mat(train_pattern_1)';
Pattern2=cell2mat(train_pattern_2)';
Pattern3=cell2mat(train_pattern_3)';
Test1=cell2mat(test_pattern_1)';
Test2=cell2mat(test_pattern_2)';
Test3=cell2mat(test_pattern_3)';

%%--------------------------------part A-----------------------
Y=[ones(200,1) Pattern1; -ones(200,1) -Pattern2];
a=zeros(121,1);
for i=1:1000000
   b=Y*a;
   m=find(b<=0);
   if(length(m)==0)
       display(['Number of iterations'])
       i
    break;
end
a=a+sum(Y(m,:))';    
end
Y_test=[ones(100,1) Test1; -ones(100,1) -Test2];
m_test=Y_test*a;
accuracy=length(find(m_test>=0))/2
display('[Performance of classifier Test1 and Test2 is ]')
accuracy

%%--------------------------------part B-----------------------
Y=[ones(200,1) Pattern1; -ones(200,1) -Pattern3];
a=zeros(121,1);
for i=1:1000000
   b=Y*a;
   m=find(b<=0);
   if(length(m)==0)
       display(['Number of iterations'])
       i
    break;
end
a=a+sum(Y(m,:))';    
end
Y_test=[ones(100,1) Test1; -ones(100,1) -Test3];
m_test=Y_test*a;
accuracy=length(find(m_test>=0))/2;
display('[Performance of classifier Test1 and Test3 is ]')
accuracy