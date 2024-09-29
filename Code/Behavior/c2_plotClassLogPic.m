function e_plotPic(  );


clear;

data0=csvread('KappaData.csv')
sizdat=size(data0);

for isub=1:12;
    
    % find isub data
    indx = find(data0(:,1) == isub);
    data=data0(indx,:);
    clear indx;
    
    indx = find(data(:,2) == 800);
    dataTemp=data(indx,:);
    data08=dataClean(dataTemp);
    clear indx;
    clear dataTemp;
    
    indx = find(data(:,2) == 1200);
    dataTemp=data(indx,:);
    data12=dataClean(dataTemp);
    clear indx;
    clear dataTemp; 
   

    datasub=[data08;data12]; 
    
    durs=[800 1200];
    lengs=[0 1 2 4 8 16 25];
    
    for i=1:2;
        for j=1:7;
            indx1=find(datasub(:,2)==durs(i));
            indx2=find(datasub(:,3)==lengs(j));
            ids=intersect(indx1,indx2);
            ms(i,j,isub)=mean(datasub(ids,4),1)/1000;
        end;
    end;
    
end;


load('bootClass.mat');

mpara=squeeze(mean(bootClass.para,2));

bias=mpara(3:4,:);

for i=1:7;
    for j=1:12;
        te(:,i,j)=ms(:,i,j);
        te(:,i,j)=ms(:,i,j)-bias(:,j);
    end;
end;
mte=squeeze(mean(te,3));
setp=squeeze(std(te,0,3))./sqrt(12);
x=[0 1 2 4 8 16 25];

subplot(2,3,[1 4]);
errorbar(x,mte(1,:),setp(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

hold on;

errorbar(x,mte(2,:),setp(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

hold on;

cls=mean(bootClass.te,3);
cls_m=mean(cls,4);
cls_se=std(cls,0,4)/sqrt(12);

subplot(2,3,[1 4]);
plt.m=cls_m(:,1,1,1);
plt.se=cls_se(:,1,1,1);
plt.color=[0 135 108]/255;
plt.xrange=[-5 30];
plt.yrange=[0.75 1];
plt.x=x;
d_plotpic(plt);

hold on
plt.m=cls_m(:,2,1,1);
plt.se=cls_se(:,2,1,1);
plt.color=[239 86 117]/255;
plt.xrange=[-5 30];
plt.yrange=[0.75 1.35];
plt.x=x;
d_plotpic(plt);

breakyaxis([0.95 1.15]);


%=============================
load('bootLog.mat');

mpara=squeeze(mean(bootLog.para,2));

bias=mpara(3:4,:);

for i=1:7;
    for j=1:12;
        te(:,i,j)=ms(:,i,j);
        te(:,i,j)=ms(:,i,j)-bias(:,j);
    end;
end;
mte=squeeze(mean(te,3));
setp=squeeze(std(te,0,3))./sqrt(12);
x=[0 1 2 4 8 16 25];

subplot(2,3,[2 5]);
errorbar(x,mte(1,:),setp(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

hold on;

errorbar(x,mte(2,:),setp(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')

hold on;

log=mean(bootLog.te,3);
log_m=mean(log,4);
log_se=std(log,0,4)/sqrt(12);

subplot(2,3,[2 5]);
plt.m=log_m(:,1,1,1);
plt.se=log_se(:,1,1,1);
plt.color=[0 135 108]/255;
plt.xrange=[-5 30];
plt.yrange=[0.75 0.95];
plt.x=x;
d_plotpic(plt);

hold on

plt.m=log_m(:,2,1,1);
plt.se=log_se(:,2,1,1);
plt.color=[239 86 117]/255;
plt.xrange=[-5 30];
plt.yrange=[0.75 1.35];
plt.x=x;
d_plotpic(plt);

breakyaxis([0.95 1.15]);







function [data1]=dataClean(data);

m=mean(data(:,4));
sd=std(data(:,4),0,1);

indx1=find(data(:,4)>m-3*sd);
indx2=find(data(:,4)<m+3*sd);
indx= intersect(indx1,indx2);
data1=data(indx,:);


function d_plotpic(plt);
m=plt.m;
se=plt.se;
color=plt.color;
xrange=plt.xrange;
yrange=plt.yrange;
x=plt.x

y1=m-se;
y2=m+se;


[xx,yy]=fill2line(x,y1,y2);
h=fill(xx,yy,color,'EdgeColor',color,'FaceAlpha',0.3,'EdgeAlpha',0.3);
set(h,'edgecolor','white');
set(gca, 'ylim',yrange);      %[0.7, 1.0000001]
set(gca, 'xlim',xrange);            %[0, 24]

hold on;

plot(x,m,'-',...
                'LineWidth',3,...
                'Color',color)
            hold on;
hold on;

function d_plotpic2(plt);
m=plt.m;
se=plt.se;
color=plt.color;
xrange=plt.xrange;
yrange=plt.yrange;
x=plt.x

y1=m-se;
y2=m+se;


[xx,yy]=fill2line(x,y1,y2);
h=fill(xx,yy,color,'EdgeColor',color,'FaceAlpha',0.3,'EdgeAlpha',0.3);
set(h,'edgecolor','white');
set(gca, 'ylim',yrange);      %[0.7, 1.0000001]
set(gca, 'xlim',xrange);            %[0, 24]

hold on;

plot(x,m,'-',...
                'LineWidth',2,...
                'Color',color)
            hold on;
hold on;

            
function [xx,yy]=fill2line(x,y1,y2)


sizX=size(x);
xx(1:sizX(2))=x;
xx(sizX(2)+1:sizX(2)*2)=x(1,sizX(2):-1:1);

yy(1:sizX(2))=y1';
yy(sizX(2)+1:sizX(2)*2)=y2(sizX(2):-1:1,1);



