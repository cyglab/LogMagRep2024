clear;

% 设置当前文件夹路径
currentFolder = '/home/youguo/我的坚果云/Working/MyPaper/时空信息对数神经表征_HCN/DataAnalysis/Analysis20240314/ERP'; % 替换为您的文件夹路径
addpath(currentFolder);
 
% 更改当前目录到指定的文件夹
cd(currentFolder);

eeglab;
EEG = pop_loadset('sampleData.set', currentFolder);

load('t08l0.mat');
load('t08l1.mat');
load('t08l2.mat');
load('t08l4.mat');
load('t08l8.mat');
load('t08l16.mat');
load('t08l25.mat');
load('t12l0.mat');
load('t12l1.mat');
load('t12l2.mat');
load('t12l4.mat');
load('t12l8.mat');
load('t12l16.mat');
load('t12l25.mat');
load('times.mat');
load('chanlocs.mat');

mt08l0=mean(t08l0(:,26:150,:),3);
mt08l1=mean(t08l1(:,26:150,:),3);
mt08l2=mean(t08l2(:,26:150,:),3);
mt08l4=mean(t08l4(:,26:150,:),3);
mt08l8=mean(t08l8(:,26:150,:),3);
mt08l16=mean(t08l16(:,26:150,:),3);
mt08l25=mean(t08l25(:,26:150,:),3);
mt12l0=mean(t12l0(:,26:150,:),3);
mt12l1=mean(t12l1(:,26:150,:),3);
mt12l2=mean(t12l2(:,26:150,:),3);
mt12l4=mean(t12l4(:,26:150,:),3);
mt12l8=mean(t12l8(:,26:150,:),3);
mt12l16=mean(t12l16(:,26:150,:),3);
mt12l25=mean(t12l25(:,26:150,:),3);

mdata=[mt08l0 mt08l1 mt08l2 mt08l4  mt08l8 mt08l16 mt08l25 mt12l0 mt12l1 mt12l2 mt12l4 mt12l8 mt12l16 mt12l25]; 






[coeff,score,latent] = pca(mdata');


npc=1;

y=score(:,npc);


for i=1:14;
y1(:,i)=y((125*(i-1)+1):125*i,1)
end;

ybase1=mean(y1(1:25,:),1);

x=times(26:150);
sizx=size(x);
for i=1:sizx(2);
    y2(i,:)=y1(i,:)-ybase1;
end;



subplot(1,3,1)


plot(x,y2(:,1),'LineWidth',2,'Color',[0 63 92]/255);
hold on;
plot(x,y2(:,2),'LineWidth',2,'Color',[55 76 128]/255);
hold on;
plot(x,y2(:,3),'LineWidth',2,'Color',[122 81 149]/255);
hold on;
plot(x,y2(:,4),'LineWidth',2,'Color',[188 80 144]/255);
hold on;
plot(x,y2(:,5),'LineWidth',2,'Color',[239 86 117]/255);
hold on;
plot(x,y2(:,6),'LineWidth',2,'Color',[255 118 74]/255);
hold on;
plot(x,y2(:,7),'LineWidth',2,'Color',[255 166 0]/255);
hold on;

set(gca, 'xlim', [-100, 400]);
set(gca, 'ylim', [-20, 40]);
set(gca,'ydir','reverse')
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
plot([-200, 800],[0,0],'--k','LineWidth',1);
plot([0, 0],[-20,50],'--k','LineWidth',1);

fill ([155 155 205 205],[-5 30 30 -5],'k','facealpha',0.1);
fill ([275 275 325 325],[-5 30 30 -5],'k','facealpha',0.1);



subplot(1,3,2)

plot(x,y2(:,8),'LineWidth',2,'Color',[0 63 92]/255);
hold on;
plot(x,y2(:,9),'LineWidth',2,'Color',[55 76 128]/255);
hold on;
plot(x,y2(:,10),'LineWidth',2,'Color',[122 81 149]/255);
hold on;
plot(x,y2(:,11),'LineWidth',2,'Color',[188 80 144]/255);
hold on;
plot(x,y2(:,12),'LineWidth',2,'Color',[239 86 117]/255);
hold on;
plot(x,y2(:,13),'LineWidth',2,'Color',[255 118 74]/255);
hold on;
plot(x,y2(:,14),'LineWidth',2,'Color',[255 166 0]/255);
hold on;

set(gca, 'xlim', [-100, 400]);
set(gca, 'ylim', [-20, 40]);
set(gca,'ydir','reverse')
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
plot([-200, 800],[0,0],'--k','LineWidth',1);
plot([0, 0],[-20,50],'--k','LineWidth',1);

fill ([155 155 205 205],[-5 30 30 -5],'k','facealpha',0.1);
fill ([275 275 325 325],[-5 30 30 -5],'k','facealpha',0.1);


subplot(1,3,3)
topoplot(coeff(:,npc),chanlocs,'style','both', 'electrodes','on');
caxis([-0.31 0.31])

erp = coeff(:,npc);

retePCA=latent(npc)/sum(latent)