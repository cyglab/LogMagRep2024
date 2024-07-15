function bootClass(  );

clear;

data0=csvread('KappaData.csv')
sizdat=size(data0);

for isub=1:12;
    
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
   

    datasub=[data08;data12]; 

k.data=datasub; 

clear datasub;

boot=bootstrapfit(isub, k);    

te0(:,:,:,isub)=boot.te;
se0(:,:,:,isub)=boot.se;
para0(:,:,isub)=boot.para;
E0(:,:,isub)=boot.E;

end;

bootLog.te=squeeze(te0);
bootLog.se=squeeze(se0);
bootLog.para=squeeze(para0);
bootLog.E=squeeze(E0);

savepath='./';
save(strcat(savepath,'bootLog.mat'),'bootLog');
clear bootLog;


function [data1]=dataClean(data);

m=mean(data(:,4));
sd=std(data(:,4),0,1);

indx1=find(data(:,4)>m-3*sd);
indx2=find(data(:,4)<m+3*sd);
indx= intersect(indx1,indx2);
data1=data(indx,:);



function [boot]=bootstrapfit(isub, k);

sizData=size(k.data);
sdata=k.data;
iboot=1;

while iboot<=100; 
    
    
[bootstat,bootsam] = bootstrp(1,@mean,[1:sizData(1)]);

for ntri=1:sizData(1);
data1(ntri,:)=sdata(bootsam(ntri,1),:);
end;

clear k.data;

k.bootdata=data1;

k.sub=isub;      




[a1 te se]=fitModel(k);
E0=fitFun(a1,k);

    
    boot.para(:,iboot)=a1;
    boot.te(:,:,iboot)=te';
    boot.se(:,:,iboot)=se';
    boot.E(:,iboot)=E0;
    
iboot=iboot+1;

end;



function [a1 te se]=fitModel(k);


% begin to fit data
options=optimset('fminsearch');
options.TolX=0.001;
options.Display='final';


r0=rand(1,4)*0.09;
c0=[0.9 0.3 0 0]; 
c1=c0+r0

[a1,sfval,sexit,soutput]=fminsearch(@fitFun,c1,options,k);



ts=[0.8 1.2];
l=[0 1 2 4 8 16 25];

v0=0.09;
t0=1;

ws=a1(1);
bias(1)=a1(3);
bias(2)=a1(4);


for i=1:2;
    for j=1:7;
        te(i,j)=t0.*(((1+ts(i)./t0).^ws).*(1+l(j)./(v0.*t0)).^(1-ws)-1);
        se(i,j)= ws.*log(1+ts(i)./t0)+(1-ws).*log(1+l(j)./(v0.*t0));
    end;
end;






function E=fitFun(a1,k)

v0=0.09;
t0=1;

ws=a1(1);
wp=a1(2);
bias(1)=a1(3);
bias(2)=a1(4);


ts0=[800 1200];


E=0;
for its=1:2;
    indx = find(k.bootdata(:,2) == ts0(its));
    dataTemp=k.bootdata(indx,:);
    
    ts=dataTemp(:,2)/1000;
    l=dataTemp(:,3);
    tp=dataTemp(:,4)/1000;
    te=t0.*(((1+ts./t0).^ws).*(1+l./(v0.*t0)).^(1-ws)-1);
    mtp=te+bias(its);
    sigma=te.*wp;
    logPro=-log(normpdf(tp,mtp,sigma));
    E=E+sum(logPro); 
    
    clear indx;
    clear dataTemp;
    clear ts;
    clear l;
    clear tp;
    clear te;
    clear mtp;
    clear sigma;
    clear logPro;
    
end;





    