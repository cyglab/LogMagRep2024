clear;

load('./t08l0.mat');
load('./t08l1.mat');
load('./t08l2.mat');
load('./t08l4.mat');
load('./t08l8.mat');
load('./t08l16.mat');
load('./t08l25.mat');
load('./t12l0.mat');
load('./t12l1.mat');
load('./t12l2.mat');
load('./t12l4.mat');
load('./t12l8.mat');
load('./t12l16.mat');
load('./t12l25.mat');
load('./times.mat');



bt08l0 = permute(t08l0,[3 1 2]);
bt08l1 = permute(t08l1,[3 1 2]);
bt08l2 = permute(t08l2,[3 1 2]);
bt08l4 = permute(t08l4,[3 1 2]);
bt08l8 = permute(t08l8,[3 1 2]);
bt08l16 = permute(t08l16,[3 1 2]);
bt08l25 = permute(t08l25,[3 1 2]);
bt12l0 = permute(t12l0,[3 1 2]);
bt12l1 = permute(t12l1,[3 1 2]);
bt12l2 = permute(t12l2,[3 1 2]);
bt12l4 = permute(t12l4,[3 1 2]);
bt12l8 = permute(t12l8,[3 1 2]);
bt12l16 = permute(t12l16,[3 1 2]);
bt12l25 = permute(t12l25,[3 1 2]);

erp0=[bt08l0;bt08l1;bt08l2;bt08l4;bt08l8;bt08l16;bt08l25;bt12l0;bt12l1;bt12l2;bt12l4;bt12l8;bt12l16;bt12l25];
erp=permute(erp0,[2 3 1]);

sub=[1:12];
dur=[0.8 1.2];
dis=[0 1 2 4 8 16 25];
for i=1:168;
    lmmlabel(i,1)=mod(i,12);
end;
for i=1:168;
    if lmmlabel(i,1)==0;
    lmmlabel(i,1)=12;
    end;
end;
    
for i=1:168;
    if i<=84;
    lmmlabel(i,2)=0.8;
    else lmmlabel(i,2)=1.2;
    end;
end;

for i=1:84;
    
    lmmlabel(i,3)=dis(ceil(i/12));

end;
for i=85:168;
    
    lmmlabel(i,3)=dis(ceil((i-84)/12));

end;

lmmlabel(:,4)=log(1+lmmlabel(:,2));
lmmlabel(:,5)=log(1+lmmlabel(:,3));


indx1=find(times>=155);
indx2=find(times<=205);
indx=intersect(indx1,indx2);

P2=mean(erp(:,indx,:),2);
P2Pz=squeeze(mean(P2([45 46 47],:,:),1));
clear indx1 indx2 indx;

indx1=find(times>=275);
indx2=find(times<=325);
indx=intersect(indx1,indx2);

P3=mean(erp(:,indx,:),2);
P3Pz=squeeze(mean(P3([45 46 47],:,:),1));
lmmP2P3=[lmmlabel P2Pz P3Pz];

lmmdata=[[1:7];lmmP2P3];


csvwrite('lmmP2P3.csv',lmmdata);
