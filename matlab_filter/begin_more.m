clear all
name='1-4MUT';
sheet_num_s=2;
sheet_num_e=2;
for sheet=sheet_num_s:sheet_num_e
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
end