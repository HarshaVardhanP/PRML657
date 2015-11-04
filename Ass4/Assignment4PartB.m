%Author: P. Harsha Vardhan (11010281)
%EE 657; PRML Course ; Assignment 4
%This file has code for task 2 of Assignment 4
clc;
clear all;
close all;
%%
load('Pattern1.mat');
load('Pattern2.mat');
load('Test1.mat');
load('Test2.mat');
for i=1:200
    train_pattern_1{:,i} = train_pattern_1{:,i}';
    train_pattern_2{:,i} = train_pattern_2{:,i}';
end
for i=1:100
    test_pattern_1{:,i} = test_pattern_1{:,i}';
    test_pattern_2{:,i} = test_pattern_2{:,i}';
end
Pattern1=cell2mat(train_pattern_1)';
Pattern2=cell2mat(train_pattern_2)';
Test1=cell2mat(test_pattern_1)';
Test2=cell2mat(test_pattern_2)';

[IDX1,Cluster1] = kmeans(Pattern1,2);
[IDX2,Cluster2] = kmeans(Pattern2,2);

weight1=[0.5 0.5];
weight2=[0.5 0.5];

Covariance1_1=eye(120);Covariance1_2=eye(120);
Covariance2_1=eye(120);Covariance2_2=eye(120);

for n=1:50

Gamma1_1=weight1(1,1)*mvnpdf(Pattern1,Cluster1(1,:),Covariance1_1);
Gamma1_2=weight1(1,2)*mvnpdf(Pattern1,Cluster1(2,:),Covariance1_2);
Gamma2_1=weight2(1,1)*mvnpdf(Pattern2,Cluster2(1,:),Covariance2_1);
Gamma2_2=weight2(1,2)*mvnpdf(Pattern2,Cluster2(2,:),Covariance2_2);

for i=1:200
    dum1=(Gamma1_1(i,1)+Gamma1_2(i,1));
    dum2=(Gamma2_1(i,1)+Gamma2_2(i,1));    
    Gamma1_1(i,1)=Gamma1_1(i,1)/dum1;
    Gamma1_2(i,1)=Gamma1_2(i,1)/dum1;    
    Gamma2_1(i,1)=Gamma2_1(i,1)/dum2;
    Gamma2_2(i,1)=Gamma2_2(i,1)/dum2;    
end
   
        Gamma1_1_prod=0;
        Gamma1_1_sum=0;
        for i=1:200
            Gamma1_1_prod=Gamma1_1_prod+Gamma1_1(i)*Pattern1(i,:);
            Gamma1_1_sum=Gamma1_1_sum+Gamma1_1(i);    
        end
        Cluster1(1,:)=Gamma1_1_prod/Gamma1_1_sum;
        Gamma1_1_prod=0;
        for i=1:200
            Gamma1_1_prod=Gamma1_1_prod+Gamma1_1(i)*(Pattern1(i,:)-Cluster1(1,:))'*(Pattern1(i,:)-Cluster1(1,:));
        end
        Covariance1_1=(Gamma1_1_prod/Gamma1_1_sum)+(0.001*eye(120));
        weight(1,1)=Gamma1_1_sum/200;
        
        
        
        
        Gamma1_2_prod=0;
        Gamma1_2_sum=0;
        for i=1:200
            Gamma1_2_prod=Gamma1_2_prod+Gamma1_2(i)*Pattern1(i,:);
            Gamma1_2_sum=Gamma1_2_sum+Gamma1_2(i);    
        end
        Cluster1(2,:)=Gamma1_2_prod/Gamma1_2_sum;
        Gamma1_2_prod=0;
        for i=1:200
            Gamma1_2_prod=Gamma1_2_prod+Gamma1_2(i)*(Pattern1(i,:)-Cluster1(2,:))'*(Pattern1(i,:)-Cluster1(2,:));
        end
        Covariance1_2=(Gamma1_2_prod/Gamma1_2_sum)+(0.001*eye(120));
        weight(1,2)=Gamma1_2_sum/200;
        
        
        
        
        Gamma2_1_prod=0;
        Gamma2_1_sum=0;
        for i=1:200
            Gamma2_1_prod=Gamma2_1_prod+Gamma2_1(i)*Pattern2(i,:);
            Gamma2_1_sum=Gamma2_1_sum+Gamma2_1(i);    
        end
        Cluster2(1,:)=Gamma2_1_prod/Gamma2_1_sum;
        Gamma2_1_prod=0;
        for i=1:200
            Gamma2_1_prod=Gamma2_1_prod+Gamma2_1(i)*(Pattern2(i,:)-Cluster2(1,:))'*(Pattern2(i,:)-Cluster2(1,:));
        end
        Covariance2_1=(Gamma2_1_prod/Gamma2_1_sum)+(0.001*eye(120));
        weight(2,1)=Gamma2_1_sum/200;
        
        
        
        Gamma2_2_prod=0;
        Gamma2_2_sum=0;
        for i=1:200
            Gamma2_2_prod=Gamma2_2_prod+Gamma2_2(i)*Pattern2(i,:);
            Gamma2_2_sum=Gamma2_2_sum+Gamma2_2(i);    
        end
        Cluster2(2,:)=Gamma2_2_prod/Gamma2_2_sum;
        Gamma2_2_prod=0;
        for i=1:200
            Gamma2_2_prod=Gamma2_2_prod+Gamma2_2(i)*(Pattern2(i,:)-Cluster2(2,:))'*(Pattern2(i,:)-Cluster2(2,:));
        end
        Covariance2_2=(Gamma2_2_prod/Gamma2_2_sum)+(0.001*eye(120));
        weight(2,2)=Gamma2_2_sum/200;

end


testp1_accuracy = 0;
testp2_accuracy = 0;
for i = 1 : 100
dummy1 = (weight1(1,1)*mvnpdf(Test1(i,:),Cluster1(1,:),Covariance1_1)) + (weight1(1,2)*mvnpdf(Test1(i,:),Cluster1(2,:),Covariance1_2));
dummy2 = (weight2(1,1)*mvnpdf(Test1(i,:),Cluster2(1,:),Covariance2_1)) + (weight2(1,2)*mvnpdf(Test1(i,:),Cluster2(2,:),Covariance2_2));
dummy3 = (weight1(1,1)*mvnpdf(Test2(i,:),Cluster1(1,:),Covariance1_1)) + (weight1(1,2)*mvnpdf(Test2(i,:),Cluster1(2,:),Covariance1_2));
dummy4 = (weight2(1,1)*mvnpdf(Test2(i,:),Cluster2(1,:),Covariance2_1)) + (weight2(1,2)*mvnpdf(Test2(i,:),Cluster2(2,:),Covariance2_2));
if (dummy1 > dummy2)
testp1_accuracy = testp1_accuracy + 1;
end
if (dummy4 > dummy3)
testp2_accuracy = testp2_accuracy + 1;
end
end
display(['Accuracy of Test pattern 1'])
testp1_accuracy
display(['Accuracy of Test pattern 2'])
testp2_accuracy

