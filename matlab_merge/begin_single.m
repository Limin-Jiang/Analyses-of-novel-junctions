clear all
%%%
sheet=6;
name='data_���������������';
%%%
name_input=strcat(name,'.xlsx');
[~,~,reads]=xlsread(name_input,sheet);
reads=string(reads);
%%%% ��ͷ %%%%
reads(1,:)=[];
%%%%%%%%%%%%
count = {};

for i = 1:length(reads)
    if reads(i,3) == '1' && reads(i,6) == '0'
        reads(i,1:6) = (reads(i,[4 5 6 1 2 3]));
    end
    if reads(i,3) == '1' && reads(i,6) == '1'
        reads(i,1:6) = (reads(i,[4 5 6 1 2 3]));
        reads(i,3) = '0';reads(i,6) = '0';
    end
    count(i,1) = {[char(reads(i,1)),',',char(reads(i,2)),',',char(reads(i,3)),',',char(reads(i,4)),',',char(reads(i,5)),',',char(reads(i,6))]};
end
count = sortrows(tabulate(count),2);
result = {};
for i = 1:length(count)
    result(i,:) = [strsplit(count{i,1},','),count{i,2}];
end

%% ������
name_output=strcat('result_',name,'.xlsx');
xlswrite(name_output,result)