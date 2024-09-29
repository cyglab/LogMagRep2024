eeglab;

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
fill ([155 155 205 205],[1 62 62 1],'k','facealpha',0,'LineWidth',2);
fill ([275 275 325 325],[1 62 62 1],'k','facealpha',0,'LineWidth',2);
plot([0, 0],[1,62],'--k','LineWidth',2);

set(gca, 'ylim', [1, 62]);
set(gca, 'xlim', [-200, 698]);
set(gca, 'YDir', 'reverse');
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

