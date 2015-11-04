clear all;
clc;
load Pattern1.mat
training=zeros(120,600);
for i=1:200
    training(:,i)=train_pattern_1{i};
end

load Pattern2.mat
for i=1:200
    training(:,200+i)=train_pattern_2{i};
end

load Pattern3.mat
for i=1:200
    training(:,400+i)=train_pattern_3{i};
end

mean_vector=mean(training,2);
for i=1:600
    training(:,i)=training(:,i)-mean_vector;
end

variance=zeros(120,1);
for i=1:600
    variance=variance+(1/600)*(training(:,i).^2);
end


variance=1./sqrt(variance);
for i=1:600
    training(:,i)=variance.*training(:,i);
end

training=[ones(1,600);training];
weightslayer2=10*rand(21,3);
weightslayer1=10*rand(121,20);
iter=200;
cost=zeros(iter,1);
for i=1:iter
activations=(training')*weightslayer1;
inputs=[ones(600,1) 1./(1+exp(-activations))];
outputs=inputs*weightslayer2;
sums=zeros(600,1);
for j=1:600
    outputs(j,:)=exp(outputs(j,:));
    sums(j)=sum(outputs(j,:));    
end


dell3=zeros(600,3);
cost(i)=0;
for j=1:600
    if(j<=200)
        correct=[1 0 0];
    end
    if((j>200)&&(j<=400))
        correct=[0 1 0];
    end
    if(j>400)
        correct=[0 0 1];
    end
    dell3(j,:)=((outputs(j,:)/sums(j))-correct);
    dell3(j,1)=dell3(j,1)*(sums(j)-outputs(j,1))*outputs(j,1)/((sums(j))^2);
    dell3(j,2)=dell3(j,2)*(sums(j)-outputs(j,2))*outputs(j,2)/((sums(j))^2);
    dell3(j,3)=dell3(j,3)*(sums(j)-outputs(j,3))*outputs(j,3)/((sums(j))^2);
    cost(i)=cost(i)+(0.5)*norm((outputs(j,:)/sums(j))-correct);
end

dell2=zeros(600,20);

for j=1:600
    for k=1:20
        dell2(j,k)=inputs(j,k+1)*(1-inputs(j,k+1));
        dell2(j,k)=dell2(j,k)*(weightslayer2(k+1,:)*(dell3(j,:)'));
    end
end

grad1=zeros(size(weightslayer1));
%layer1upgrades
for j=1:121
    for k=1:20
        grad1(j,k)=training(j,:)*dell2(:,k);
    end
end
grad2=zeros(size(weightslayer2));
for j=1:21
    for k=1:3
        grad2(j,k)=(inputs(:,j)')*dell3(:,k);
    end
end

for j=1:20
    weightslayer1(:,j)=weightslayer1(:,j)/norm(weightslayer1(:,j));
    grad1(:,j)=grad1(:,j)/norm(grad1(:,j));
end

for j=1:3
    weightslayer2(:,j)=weightslayer2(:,j)/norm(weightslayer2(:,j));
    grad2(:,j)=grad2(:,j)/norm(grad2(:,j));
end

weightslayer1=weightslayer1-(1/(i^1.2))*grad1;
weightslayer2=weightslayer2-(1/(i^1.2))*grad2;
end

plot(cost);

% load Test1.mat
% load Test2.mat
% load Test3.mat
% test=zeros(120,300);
% for i=1:100
%     test(:,i)=test_pattern_1{i};
%     test(:,100+i)=test_pattern_2{i};
%     test(:,200+i)=test_pattern_3{i};
% end
% 
% 
% for i=1:300
%     test(:,i)=test(:,i)-mean_vector;
% end
% 
% 
% for i=1:300
%     test(:,i)=variance.*test(:,i);
% end
% 
% test=[ones(1,300);test];
% activations=(test')*weightslayer1;
% inputs=[ones(300,1) 1./(1+exp(-activations))];
% outputs=inputs*weightslayer2;
% for j=1:300
%     outputs(j,:)=exp(outputs(j,:));
%     temp=sum(outputs(j,:));
%     outputs(j,:)=outputs(j,:)/temp;
% end
% result=zeros(300,1);
% for j=1:300
% result(j)=max(outputs(j,:));
% result(j)=find(outputs(j,:)==result(j));
% end
% 
% nnz(result(1:100)==1)
% nnz(result(101:200)==2)
% nnz(result(201:300)==3)
