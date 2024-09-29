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

n=0

% linear
n=n+1
for i=1:62;
    for j=1:225;
        temp=double(squeeze(erp(i,j,:)));
        tbl = table(lmmlabel(:,1),lmmlabel(:,2),lmmlabel(:,3),temp,'VariableNames',{'sub','dur','dis','erp'});
        lme = fitlme(tbl,'erp~dur+dis+(1|sub)+(dur-1|sub)+(dis-1|sub)');
        lmeERP.b_dur(i,j)=lme.Coefficients{2,2};
        lmeERP.se_dur(i,j)=lme.Coefficients{2,3};
        lmeERP.t_dur(i,j)=lme.Coefficients{2,4};
        lmeERP.df_dur(i,j)=lme.Coefficients{2,5};
        lmeERP.p_dur(i,j)=lme.Coefficients{2,6};
         lmeERP.b_dis(i,j)=lme.Coefficients{3,2};
        lmeERP.se_dis(i,j)=lme.Coefficients{3,3};
        lmeERP.t_dis(i,j)=lme.Coefficients{3,4};
        lmeERP.df_dis(i,j)=lme.Coefficients{3,5};
        lmeERP.p_dis(i,j)=lme.Coefficients{3,6};
        lmeERP.AIC(i,j)=lme.ModelCriterion{1,1};
        lmeERP.BIC(i,j)=lme.ModelCriterion{1,2};
    end;
end;

savepath='./';
save(strcat(savepath,'lme_linear.mat'),'lmeERP');
clear lmeERP;


% log
n=n+1
for i=1:62;
    for j=1:225;
        temp=double(squeeze(erp(i,j,:)));
        tbl = table(lmmlabel(:,1),log(1+lmmlabel(:,2)),log(1+lmmlabel(:,3)),temp,'VariableNames',{'sub','dur','dis','erp'});
        lme = fitlme(tbl,'erp~dur+dis+(1|sub)+(dur-1|sub)+(dis-1|sub)');
        lmeERP.b_dur(i,j)=lme.Coefficients{2,2};
        lmeERP.se_dur(i,j)=lme.Coefficients{2,3};
        lmeERP.t_dur(i,j)=lme.Coefficients{2,4};
        lmeERP.df_dur(i,j)=lme.Coefficients{2,5};
        lmeERP.p_dur(i,j)=lme.Coefficients{2,6};
         lmeERP.b_dis(i,j)=lme.Coefficients{3,2};
        lmeERP.se_dis(i,j)=lme.Coefficients{3,3};
        lmeERP.t_dis(i,j)=lme.Coefficients{3,4};
        lmeERP.df_dis(i,j)=lme.Coefficients{3,5};
        lmeERP.p_dis(i,j)=lme.Coefficients{3,6};
        lmeERP.AIC(i,j)=lme.ModelCriterion{1,1};
        lmeERP.BIC(i,j)=lme.ModelCriterion{1,2};
    end;
end;

savepath='./';
save(strcat(savepath,'lme_log.mat'),'lmeERP');
clear lmeERP;






