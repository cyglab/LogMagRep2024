clear;

eeglab;

load('ERP/times.mat');
load('ERP/chanlocs.mat');

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

indx1=find(times>=155);
indx2=find(times<=205);
indx=intersect(indx1,indx2);

pt08(:,1)=mean(mt08l0(:,indx),2);
pt08(:,2)=mean(mt08l1(:,indx),2);
pt08(:,3)=mean(mt08l2(:,indx),2);
pt08(:,4)=mean(mt08l4(:,indx),2);
pt08(:,5)=mean(mt08l8(:,indx),2);
pt08(:,6)=mean(mt08l16(:,indx),2);
pt08(:,7)=mean(mt08l25(:,indx),2);



pt12(:,1)=mean(mt12l0(:,indx),2);
pt12(:,2)=mean(mt12l1(:,indx),2);
pt12(:,3)=mean(mt12l2(:,indx),2);
pt12(:,4)=mean(mt12l4(:,indx),2);
pt12(:,5)=mean(mt12l8(:,indx),2);
pt12(:,6)=mean(mt12l16(:,indx),2);
pt12(:,7)=mean(mt12l25(:,indx),2);

for i=1:7;
    subplot(4,7,i);
    topoplot(pt08(:,i),chanlocs,'style','both', 'electrodes','on');
    caxis([-7 7])
end;

for i=1:7;
    subplot(4,7,14+i);
    topoplot(pt12(:,i),chanlocs,'style','both', 'electrodes','on');
    caxis([-7 7])
end;

x=times;

indx1=find(times>=275);
indx2=find(times<=325);
indx=intersect(indx1,indx2);

pt08(:,1)=mean(mt08l0(:,indx),2);
pt08(:,2)=mean(mt08l1(:,indx),2);
pt08(:,3)=mean(mt08l2(:,indx),2);
pt08(:,4)=mean(mt08l4(:,indx),2);
pt08(:,5)=mean(mt08l8(:,indx),2);
pt08(:,6)=mean(mt08l16(:,indx),2);
pt08(:,7)=mean(mt08l25(:,indx),2);



pt12(:,1)=mean(mt12l0(:,indx),2);
pt12(:,2)=mean(mt12l1(:,indx),2);
pt12(:,3)=mean(mt12l2(:,indx),2);
pt12(:,4)=mean(mt12l4(:,indx),2);
pt12(:,5)=mean(mt12l8(:,indx),2);
pt12(:,6)=mean(mt12l16(:,indx),2);
pt12(:,7)=mean(mt12l25(:,indx),2);

for i=1:7;
    subplot(4,7,7+i);
    topoplot(pt08(:,i),chanlocs,'style','both', 'electrodes','on');
    caxis([-7 7])
end;

for i=1:7;
    subplot(4,7,21+i);
    topoplot(pt12(:,i),chanlocs,'style','both', 'electrodes','on');
    caxis([-7 7])
end;

