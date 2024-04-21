eeglab;

subplot(1,4,[1 2]);

load('times.mat')
x=times;

load('lme_linear.mat')
AIC_linear=lmeERP.AIC;
clear lmeERP;

load('lme_log.mat')
AIC_log=lmeERP.AIC;
clear lmeERP;
deltaAIC=AIC_linear-AIC_log;


plot(x,deltaAIC([10],:),'LineWidth',2,'Color',[0 63 92]/255);
hold on;

plot(x,deltaAIC([28],:),'LineWidth',2,'Color',[188 80 144]/255);
hold on;

plot(x,deltaAIC([46],:),'LineWidth',2,'Color',[255 166 0]/255);
hold on;

fill ([155 155 205 205],[-15 45 45 -15],'k','facealpha',0.05);
fill ([275 275 325 325],[-15 45 45 -15],'k','facealpha',0.05);

plot([-200, 800],[0,0],'--k','LineWidth',1);
plot([0, 0],[-40,50],'--k','LineWidth',1);
set(gca, 'xlim', [-200, 600]);
set(gca, 'ylim', [-30, 50]);
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')



subplot(1,4,3);

load('times.mat');
load('chanlocs.mat');


load('lme_linear.mat')
AIC_linear=lmeERP.AIC;
clear lmeERP;

load('lme_log.mat')
AIC_log=lmeERP.AIC;
clear lmeERP;
dAIC=AIC_linear-AIC_log;


indx1=find(times>=155);
indx2=find(times<=205);
indx=intersect(indx1,indx2);

mAIC=mean(dAIC(:,indx),2);
topoplot(mAIC,chanlocs,'style','both', 'electrodes','on');


subplot(1,4,4);
indx1=find(times>=275);
indx2=find(times<=325);
indx=intersect(indx1,indx2);

mAIC=mean(dAIC(:,indx),2);
topoplot(mAIC,chanlocs,'style','both', 'electrodes','on');

