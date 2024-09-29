function predictLme4( )
clear;

t=[0.8 1.2];
sizT=size(t);

x=[0 1 2 4 8 16 25];
sizX=size(x);

logT=log(1+t);  % ln(1+t)
logX=log(1+x);  % ln(1+x)


clERP = csvread('lmmP2P3.csv',1,0);
predClsP2=csvread('ClassPredicP2.csv',1,0);
predLogP2=csvread('LogPredicP2.csv',1,0);

predClsP3=csvread('ClassPredicP3.csv',1,0);
predLogP3=csvread('LogPredicP3.csv',1,0);


for isub=1:12;    
for i=1:sizT(2);
    for j=1:sizX(2);
        indx1 = find(clERP(:,2) == t(i));
        indx2 = find(clERP(:,3) == x(j)); 
        indx12 = intersect(indx1,indx2);
        
        indx0 = find(clERP(:,1) == isub);
        indx = intersect(indx0,indx12);
        
        mErpP2(i,j,isub) = mean(clERP(indx,6));
        mErpP3(i,j,isub) = mean(clERP(indx,7));
        
        mpreClsP2(i,j,isub) = mean(predClsP2(indx,1));
        mpreLogP2(i,j,isub) = mean(predLogP2(indx,1));
        
        mpreClsP3(i,j,isub) = mean(predClsP3(indx,1));
        mpreLogP3(i,j,isub) = mean(predLogP3(indx,1));        
        
        clear indx1 indx2 indx;
    end;
end;
end;

mmErpP2 = squeeze(mean(mErpP2,3));
seErpP2 = squeeze(std(mErpP2,0,3))/sqrt(isub);
mmErpP3 = squeeze(mean(mErpP3,3));
seErpP3 = squeeze(std(mErpP3,0,3))/sqrt(isub);

mmpreClsP2 = squeeze(mean(mpreClsP2,3));
sepreClsP2 = squeeze(std(mpreClsP2,0,3))/sqrt(isub);
mmpreLogP2 = squeeze(mean(mpreLogP2,3));
sepreLogP2 = squeeze(std(mpreLogP2,0,3))/sqrt(isub);

mmpreClsP3 = squeeze(mean(mpreClsP3,3));
sepreClsP3 = squeeze(std(mpreClsP3,0,3))/sqrt(isub);
mmpreLogP3 = squeeze(mean(mpreLogP3,3));
sepreLogP3 = squeeze(std(mpreLogP3,0,3))/sqrt(isub);


subplot(2,4,1); % P2 0.8 cls
errorbar(x,mmErpP2(1,:),seErpP2(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');

hold on

plt.m=mmpreClsP2(1,:)';
plt.se=sepreClsP2(1,:)';
plt.color= [0 135 108]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);


subplot(2,4,2); %P2 1.2 cls
errorbar(x,mmErpP2(2,:),seErpP2(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

hold on

plt.m=mmpreClsP2(2,:)';
plt.se=sepreClsP2(2,:)';
plt.color=[222 66 91]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);


subplot(2,4,5); %P2 0.8 log
errorbar(x,mmErpP2(1,:),seErpP2(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');

hold on

plt.m=mmpreLogP2(1,:)';
plt.se=sepreLogP2(1,:)';
plt.color=[0 135 108]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);


subplot(2,4,6); %P2 1.2 log
errorbar(x,mmErpP2(2,:),seErpP2(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

hold on

plt.m=mmpreLogP2(2,:)';
plt.se=sepreLogP2(2,:)';
plt.color=[222 66 91]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);



subplot(2,4,3);%P3 0.8 cls
errorbar(x,mmErpP3(1,:),seErpP3(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');
hold on

plt.m=mmpreClsP3(1,:)';
plt.se=sepreClsP3(1,:)';
plt.color=[0 135 108]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);

subplot(2,4,4);% P3 1.2  cls
errorbar(x,mmErpP3(2,:),seErpP3(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

hold on

plt.m=mmpreClsP3(2,:)';
plt.se=sepreClsP3(2,:)';
plt.color=[222 66 91]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);

subplot(2,4,7); % P3 0.8  log
errorbar(x,mmErpP3(1,:),seErpP3(1,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');

hold on

plt.m=mmpreLogP3(1,:)';
plt.se=sepreLogP3(1,:)';
plt.color=[0 135 108]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);


subplot(2,4,8); % P3 1.2  log
errorbar(x,mmErpP3(2,:),seErpP3(2,:),'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');

hold on

plt.m=mmpreLogP3(2,:)';
plt.se=sepreLogP3(2,:)';
plt.color=[222 66 91]/255;
plt.xrange=[-2 27];
plt.yrange=[0.35 20];  
plt.x=x;
d_plotpic(plt);

set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')
set(gca, 'ylim',[0 8]);    
set(gca, 'xlim',[-5 30]);










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


            
function [xx,yy]=fill2line(x,y1,y2)


sizX=size(x);
xx(1:sizX(2))=x;
xx(sizX(2)+1:sizX(2)*2)=x(1,sizX(2):-1:1);

yy(1:sizX(2))=y1';
yy(sizX(2)+1:sizX(2)*2)=y2(sizX(2):-1:1,1);
