clear all
%%%
name='1,2,3,4,5,6,7,8初筛';
sheet_num_s=1;
sheet_num_e=7;
reads=[];
for sheet=sheet_num_s:sheet_num_e
%%%
name_input=strcat(name,'.xlsx');
[~,~,reads_i]=xlsread(name_input,sheet);
reads_i=string(reads_i);
%%%% 表头 %%%%
reads_i(1,:)=[];
%%%%%%%%%%%%
reads=[reads;reads_i];
end
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

%% 结果输出
name_output=strcat('result_merae',name,'.xlsx');
xlswrite(name_output,result,1)
