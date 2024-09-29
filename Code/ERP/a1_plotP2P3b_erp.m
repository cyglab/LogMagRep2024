clear;


load('ERP/times.mat');


load('ERP/t08l0.mat');
load('ERP/t08l1.mat');
load('ERP/t08l2.mat');
load('ERP/t08l4.mat');
load('ERP/t08l8.mat');
load('ERP/t08l16.mat');
load('ERP/t08l25.mat');

load('ERP/t12l0.mat');
load('ERP/t12l1.mat');
load('ERP/t12l2.mat');
load('ERP/t12l4.mat');
load('ERP/t12l8.mat');
load('ERP/t12l16.mat');
load('ERP/t12l25.mat');

mt08l0=mean(t08l0,3);
mt08l1=mean(t08l1,3);
mt08l2=mean(t08l2,3);
mt08l4=mean(t08l4,3);
mt08l8=mean(t08l8,3);
mt08l16=mean(t08l16,3);
mt08l25=mean(t08l25,3);

mt12l0=mean(t12l0,3);
mt12l1=mean(t12l1,3);
mt12l2=mean(t12l2,3);
mt12l4=mean(t12l4,3);
mt12l8=mean(t12l8,3);
mt12l16=mean(t12l16,3);
mt12l25=mean(t12l25,3);


x=times;

pt08l0=mean(mt08l0([45 46 47],:),1);
pt08l1=mean(mt08l1([45 46 47],:),1);
pt08l2=mean(mt08l2([45 46 47],:),1);
pt08l4=mean(mt08l4([45 46 47],:),1);
pt08l8=mean(mt08l8([45 46 47],:),1);
pt08l16=mean(mt08l16([45 46 47],:),1);
pt08l25=mean(mt08l25([45 46 47],:),1);

subplot(2,2,1)
plot(x,pt08l0,'LineWidth',2,'Color',[0 63 92]/255);
hold on;
plot(x,pt08l1,'LineWidth',2,'Color',[55 76 128]/255);
hold on;
plot(x,pt08l2,'LineWidth',2,'Color',[122 81 149]/255);
hold on;
plot(x,pt08l4,'LineWidth',2,'Color',[188 80 144]/255);
hold on;
plot(x,pt08l8,'LineWidth',2,'Color',[239 86 117]/255);
hold on;
plot(x,pt08l16,'LineWidth',2,'Color',[255 118 74]/255);
hold on;
plot(x,pt08l25,'LineWidth',2,'Color',[255 166 0]/255);
hold on;



set(gca, 'xlim', [-200, 600]);
set(gca, 'ylim', [-3, 8]);
set(gca,'ydir','reverse')
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
plot([-200, 800],[0,0],'--k','LineWidth',1);
plot([0, 0],[-3,8],'--k','LineWidth',1);


fill ([155 155 205 205],[-0.5 6.5 6.5 -0.5],'k','facealpha',0.05);
fill ([275 275 325 325],[-0.5 6.5 6.5 -0.5],'k','facealpha',0.05);


pt12l0=mean(mt12l0([45 46 47],:),1);
pt12l1=mean(mt12l1([45 46 47],:),1);
pt12l2=mean(mt12l2([45 46 47],:),1);
pt12l4=mean(mt12l4([45 46 47],:),1);
pt12l8=mean(mt12l8([45 46 47],:),1);
pt12l16=mean(mt12l16([45 46 47],:),1);
pt12l25=mean(mt12l25([45 46 47],:),1);

subplot(2,2,3)
plot(x,pt12l0,'LineWidth',2,'Color',[0 63 92]/255);
hold on;
plot(x,pt12l1,'LineWidth',2,'Color',[55 76 128]/255);
hold on;
plot(x,pt12l2,'LineWidth',2,'Color',[122 81 149]/255);
hold on;
plot(x,pt12l4,'LineWidth',2,'Color',[188 80 144]/255);
hold on;
plot(x,pt12l8,'LineWidth',2,'Color',[239 86 117]/255);
hold on;
plot(x,pt12l16,'LineWidth',2,'Color',[255 118 74]/255);
hold on;
plot(x,pt12l25,'LineWidth',2,'Color',[255 166 0]/255);
hold on;



set(gca, 'xlim', [-200, 600]);
set(gca, 'ylim', [-3, 8]);
set(gca,'ydir','reverse')
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
plot([-200, 800],[0,0],'--k','LineWidth',1);
plot([0, 0],[-3,8],'--k','LineWidth',1);

fill ([155 155 205 205],[-0.5 6.5 6.5 -0.5],'k','facealpha',0.05);
fill ([275 275 325 325],[-0.5 6.5 6.5 -0.5],'k','facealpha',0.05);

