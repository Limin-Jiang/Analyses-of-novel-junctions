clear all
sheet=1;
name='yZH073';
%%%
name_input=strcat(name,'.xlsx');
[~,~,reads]=xlsread(name_input,sheet);
%%%% 表头 %%%%
reads(1,:)=[];
%%%%%%%%%%%%
flag_num = 6; %%flag_num染色体的的个数，6个或者7个 
[resut_end] = filter_data(reads,flag_num);%reads是导入全部reads的cell型
%% 结果输出
name_output=strcat('result_',name,'.xlsx');
xlswrite(name_output,resut_end,sheet)