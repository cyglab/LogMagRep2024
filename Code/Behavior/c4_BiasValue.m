load('bootClass.mat');

mpara=squeeze(mean(bootClass.para,2));

bias(:,1:2)=mpara(3:4,:)';



load('bootLog.mat');

mpara=squeeze(mean(bootLog.para,2));

bias(:,3:4)=mpara(3:4,:)';
