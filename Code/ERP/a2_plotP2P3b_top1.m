clear;

eeglab;

load('ERP/times.mat');
load('ERP/chanlocs.mat');

load('ERP/t08l0.mat');
load('ERP/t08l4.mat');
load('ERP/t08l25.mat');

load('ERP/t12l0.mat');
load('ERP/t12l4.mat');
load('ERP/t12l25.mat');

mt08l0=mean(t08l0,3);
mt08l4=mean(t08l4,3);
mt08l25=mean(t08l25,3);

mt12l0=mean(t12l0,3);
mt12l4=mean(t12l4,3);
mt12l25=mean(t12l25,3);

x=times;

indx1=find(times>=155);
indx2=find(times<=205);
indx=intersect(indx1,indx2);

pt08(:,1)=mean(mt08l0(:,indx),2);
pt08(:,4)=mean(mt08l4(:,indx),2);
pt08(:,7)=mean(mt08l25(:,indx),2);


pt12(:,1)=mean(mt12l0(:,indx),2);
pt12(:,4)=mean(mt12l4(:,indx),2);
pt12(:,7)=mean(mt12l25(:,indx),2);

subplot(6,2,1);
topoplot(pt08(:,1),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,3);
topoplot(pt08(:,4),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,5);
topoplot(pt08(:,7),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,7);
topoplot(pt12(:,1),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,9);
topoplot(pt12(:,4),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,11);
topoplot(pt12(:,7),chanlocs,'style','both', 'electrodes','on');

indx1=find(times>=275);
indx2=find(times<=325);
indx=intersect(indx1,indx2);

pt08(:,1)=mean(mt08l0(:,indx),2);
pt08(:,7)=mean(mt08l25(:,indx),2);



pt12(:,1)=mean(mt12l0(:,indx),2);
pt12(:,7)=mean(mt12l25(:,indx),2);

subplot(6,2,2);
topoplot(pt08(:,1),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,4);
topoplot(pt08(:,4),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,6);
topoplot(pt08(:,7),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,8);
topoplot(pt12(:,1),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,10);
topoplot(pt12(:,4),chanlocs,'style','both', 'electrodes','on');

subplot(6,2,12);
topoplot(pt12(:,7),chanlocs,'style','both', 'electrodes','on');