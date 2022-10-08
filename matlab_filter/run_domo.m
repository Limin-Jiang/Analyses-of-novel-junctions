
flag_num = 7; %%flag_num染色体的的个数，6个或者7个

%%切换到序列排除目录下
[resut_end] = filter_data(reads,flag_num);%reads是导入全部reads的cell型

%%切换到热图录下
[matrix1, matrix2,matrix] = hot_chart(data1,data2,flag_num);%data1和data2是重排和不是重排的cell型数据

flag_num = 7; %%flag_num染色体的的个数，6个或者7个
%%切换到热图录下
[matrix1, matrix2,matrix] = hot_chart(data1,data2,flag_num);%data1和data2是重排和不是重排的cell型数据