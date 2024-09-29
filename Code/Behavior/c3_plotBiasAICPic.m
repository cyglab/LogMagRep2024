function e_plotPic(  );


clear;


load('bootClass.mat');

mpara=squeeze(mean(bootClass.para,2));

bias=mpara(3:4,:);

subplot(2,3,3);
mbias=mean(bias,2);
sebias=std(bias,0,2)/sqrt(12);

hold on
errorbar([1 2],mbias,sebias,'-o','linewidth',2,'Color',[0 63 92]/255, 'MarkerSize',4,...
   'MarkerEdgeColor',[0 63 92]/255,'MarkerFaceColor','k');
hold on

set(gca, 'ylim',[0 0.6]);
set(gca, 'xlim',[0 3]);            %[0, 24]
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
%============

load('bootLog.mat');

mpara=squeeze(mean(bootLog.para,2));

bias=mpara(3:4,:);

subplot(2,3,3);
mbias=mean(bias,2);
sebias=std(bias,0,2)/sqrt(12);

hold on
errorbar([1 2],mbias,sebias,'-^','linewidth',2,'Color',[255 118 74]/255, 'MarkerSize',4,...
   'MarkerEdgeColor',[255 118 74]/255,'MarkerFaceColor','w');
set(gca, 'xlim',[0 3]);
set(gca, 'ylim',[0 0.6]);
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

subplot(2,3,6)
load('bootClass.mat');
E1=squeeze(mean(bootClass.E,1));

load('bootLog.mat');
E2=squeeze(mean(bootLog.E,1));

AIC1=2*E1+2*4;
AIC2=2*E2+2*4;

difAIC=AIC1-AIC2;


AIC(:,1)=AIC1';
AIC(:,2)=AIC2';

bar(difAIC,'k');
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
xlim([0 13])





