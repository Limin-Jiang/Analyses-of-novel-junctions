clear all
sheet=1;
name='yZH073';
%%%
name_input=strcat(name,'.xlsx');
[~,~,reads]=xlsread(name_input,sheet);
%%%% ��ͷ %%%%
reads(1,:)=[];
%%%%%%%%%%%%
flag_num = 6; %%flag_numȾɫ��ĵĸ�����6������7�� 
[resut_end] = filter_data(reads,flag_num);%reads�ǵ���ȫ��reads��cell��
%% ������
name_output=strcat('result_',name,'.xlsx');
xlswrite(name_output,resut_end,sheet)