clear all;
close all;

data = [9.29,10.65;6.02,9.62;2.68,9.59;1.15,8.80;0.61,9.79;0.47,8.71];%11的数据
% data=[10.82,15.55;6.5,11.46;3.49,11.05;1.76,10.56;1.11,11.09;0.82,8.66];%12的数据
index=[0,2,4,6,8,10];
b = bar(data);

ch = get(b,'children');
set(gca,'YLim',[0 12]);%11是[0 12]，12是[0 18]
set(gca,'XTickLabel',index);


xlabel('time(unit:h)');
ylabel('fluorescence intensity(unit:/OD)');
for i = 1:length(index)
    text(i-0.14,data(i,1),num2str(data(i,1),'%4.2f'),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
    text(i+0.14,data(i,2),num2str(data(i,2),'%4.2f'),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
end

% hold on;
% values = spcrv([index;data(:,1)'],3); 
% plot(values(1,:)-0.14,values(2,:),'color','b','linestyle','--');

legend('experimental','control');