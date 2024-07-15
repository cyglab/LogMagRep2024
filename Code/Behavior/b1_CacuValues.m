load('bootClass.mat')
ClassMindv=squeeze(mean(bootClass.para,2))';
ClassSEindv=squeeze(std(bootClass.para,0,2))';
ClassCIindv1=ClassMindv-1.96*ClassSEindv;
ClassCIindv2=ClassMindv+1.96*ClassSEindv;

ClassMall=mean(ClassMindv,1);
[H,P,CIclass1,STATS] = ttest(ClassMindv(:,1));
[H,P,CIclass2,STATS] = ttest(ClassMindv(:,2));
[H,P,CIclass3,STATS] = ttest(ClassMindv(:,3));
[H,P,CIclass4,STATS] = ttest(ClassMindv(:,4));



load('bootLog.mat')
LogMindv=squeeze(mean(bootLog.para,2))';
LogSEindv=squeeze(std(bootLog.para,0,2))';
LogCIindv1=LogMindv-1.96*LogSEindv;
LogCIindv2=LogMindv+1.96*LogSEindv;


LogMall=mean(LogMindv,1);
[H,P,CIlog1,STATS] = ttest(LogMindv(:,1));
[H,P,CIlog2,STATS] = ttest(LogMindv(:,2));
[H,P,CIlog3,STATS] = ttest(LogMindv(:,3));
[H,P,CIlog4,STATS] = ttest(LogMindv(:,4));





