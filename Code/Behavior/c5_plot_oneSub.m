function oneSub( );
clear;

data0=csvread('KappaData.csv')
sizdat=size(data0);

n=5;


for isub=n:n;
    
    % find ith subject data
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
    
    l=[0 1 2 4 8 16 25];
    ts=[0.8 1.2];
    for il=1:7;
        indx = find(data08(:,3) == l(il));
        dataTemp = data08(indx,:);
        sizd = size(dataTemp);
        m08(il) = mean(dataTemp(:,4),1);
        se08(il) = std(dataTemp(:,4),0,1)/sqrt(sizd(1));
        clear indx;
        clear dataTemp; 
        clear sizd;
    end;

    for il=1:7;
        indx = find(data12(:,3) == l(il));
        dataTemp = data12(indx,:);
        sizd = size(dataTemp);
        m12(il) = mean(dataTemp(:,4),1);
        se12(il) = std(dataTemp(:,4),0,1)/sqrt(sizd(1));
        clear indx;
        clear dataTemp; 
        clear sizd;
    end;
 b1_CacuValues
    
a1=ClassMindv(n,:);

v0=0.25;
w=a1(1);
wp=a1(2);
bias(1)=a1(3);
bias(2)=a1(4);

ll=l;
sizll=size(ll);
for i=1:2;
    for j=1:sizll(2);
        mtp(i,j)=w*ts(i)+(1-w)*ll(j)/v0+bias(i); 
    end;
end;

 subplot(1,4,1)
 siz08=size(data08);
 plot(data08(:,3),data08(:,4)/1000,'.','Color',[0.7 0.7 0.7]);
 hold on;
 errorbar(l,m08/1000,se08/1000,'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');

 hold on
 plot(ll,mtp(1,:),'Color',[0 135 108]/255,'LineWidth',3);
 hold on
 line([-2,27],[mtp(1,1) mtp(1,1)],'linestyle','--');
  hold on
 line([-2,27],[mtp(1,sizll(2)) mtp(1,sizll(2))],'linestyle','--');
 hold on
 line([-2,27],[0.8 0.8],'linestyle','--');
 
     set(gca, 'ylim', [0.7, 1.800001]);
    set(gca, 'xlim', [-2, 27]); 
  set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')  

 
 subplot(1,4,2)
plot(data12(:,3),data12(:,4)/1000,'.','Color',[0.7 0.7 0.7]);
 hold on;

 errorbar(l,m12/1000,se12/1000,'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');
 
 %plot(l,m12/1000,'mo',...
 %               'LineWidth',2,...
 %               'Color','k',...
 %               'MarkerEdgeColor','k',...
 %               'MarkerFaceColor','w',...
 %               'MarkerSize',5); 
 
  hold on
 plot(ll,mtp(2,:),'color',[222 66 91]/255,'LineWidth',3);
   hold on
 line([-2,27],[mtp(2,sizll(2)) mtp(2,sizll(2))],'linestyle','--');
  hold on
 line([-2,27],[mtp(2,1) mtp(2,1)],'linestyle','--');
 hold on
 line([-2,27],[1.2 1.2],'linestyle','--');
 
     set(gca, 'ylim', [1.1, 2.200001]);
    set(gca, 'xlim', [-2, 27]); 
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')


a1=LogMindv(n,:);
v0=0.09;
t0=1;
ws=a1(1);
wp=a1(2);
bias(1)=a1(3);
bias(2)=a1(4);

ll=l;
sizll=size(ll);
for i=1:2;
    for j=1:sizll(2);
        mtp(i,j)=t0.*(((1+ts(i)./t0).^ws).*(1+ll(j)./(v0.*t0)).^(1-ws)-1)+bias(i); 
    end;
end;

subplot(1,4,3)
 siz08=size(data08);
 plot(data08(:,3),data08(:,4)/1000,'.','Color',[0.7 0.7 0.7]);
 hold on;
 errorbar(l,m08/1000,se08/1000,'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','k');

 hold on
 plot(ll,mtp(1,:),'Color',[0 135 108]/255,'LineWidth',3);
 hold on
 line([-2,27],[mtp(1,1) mtp(1,1)],'linestyle','--');
  hold on
 line([-2,27],[mtp(1,sizll(2)) mtp(1,sizll(2))],'linestyle','--');
 hold on
 line([-2,27],[0.8 0.8],'linestyle','--');
 
     set(gca, 'ylim', [0.7, 1.800001]);
    set(gca, 'xlim', [-2, 27]); 
  set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')  

 
 subplot(1,4,4)
plot(data12(:,3),data12(:,4)/1000,'.','Color',[0.7 0.7 0.7]);
 hold on;

 errorbar(l,m12/1000,se12/1000,'o','linewidth',2,'Color','k', 'MarkerSize',5,...
   'MarkerEdgeColor','k','MarkerFaceColor','w');
 
 %plot(l,m12/1000,'mo',...
 %               'LineWidth',2,...
 %               'Color','k',...
 %               'MarkerEdgeColor','k',...
 %               'MarkerFaceColor','w',...
 %               'MarkerSize',5); 
 
  hold on
 plot(ll,mtp(2,:),'color',[222 66 91]/255,'LineWidth',3);
   hold on
 line([-2,27],[mtp(2,sizll(2)) mtp(2,sizll(2))],'linestyle','--');
  hold on
 line([-2,27],[mtp(2,1) mtp(2,1)],'linestyle','--');
 hold on
 line([-2,27],[1.2 1.2],'linestyle','--');
 
     set(gca, 'ylim', [1.1, 2.200001]);
    set(gca, 'xlim', [-2, 27]); 
set(gca,'FontSize',12);
set(gca,'Fontname', 'Arial')


end;

function [data1]=dataClean(data);

m=mean(data(:,4));
sd=std(data(:,4),0,1);

indx1=find(data(:,4)>m-3*sd);
indx2=find(data(:,4)<m+3*sd);
indx= intersect(indx1,indx2);
data1=data(indx,:);
