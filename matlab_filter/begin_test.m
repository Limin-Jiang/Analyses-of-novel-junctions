clear all
sheet=1;
name='1';
name_input=strcat(name,'.xlsx');
[~,~,reads]=xlsread(name_input,sheet);
%%%% ��ͷ %%%%
reads(1,:)=[];
%%%%%%%%%%%%
reads=reads(1:10000,:);
tic
%%%
flag_num = 6; %%flag_numȾɫ��ĵĸ�����6������7�� 
[resut_end] = filter_data(reads,flag_num);%reads�ǵ���ȫ��reads��cell��
%% ������
toc
t=toc

% name_output=strcat('result_',name,'.xlsx');
% xlswrite(name_output,resut_end)

