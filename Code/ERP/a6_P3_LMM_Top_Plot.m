eeglab;

subplot(1,4,[1 2]);

load('times.mat')

load('lme_linear.mat')
lmeERPlin=lmeERP;
clear lmeERP;

load('lme_log.mat')
lmeERPlog=lmeERP;
clear lmeERP;

dAIC=lmeERPlin.AIC-lmeERPlog.AIC;

elec=1:62;

[x y] = meshgrid(times, elec);

pcolor(x,y,dAIC);  
colormap jet,shading interp
caxis([-50 50])

hold on;
fill ([155 155 205 205],[1 62 62 1],'k','facealpha',0.05);
fill ([275 275 325 325],[1 62 62 1],'k','facealpha',0.05);
plot([0, 0],[1,62],'--k','LineWidth',1);

set(gca, 'ylim', [1, 62]);
set(gca, 'xlim', [-200, 698]);
set(gca, 'YDir', 'reverse');


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
caxis([-50 50])

subplot(1,4,4);
indx1=find(times>=275);
indx2=find(times<=325);
indx=intersect(indx1,indx2);

mAIC=mean(dAIC(:,indx),2);
topoplot(mAIC,chanlocs,'style','both', 'electrodes','on');
caxis([-50 50])
