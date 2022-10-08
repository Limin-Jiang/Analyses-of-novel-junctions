function [resut_end] = filter_data(reads,flag_num)
%   reads是纯序列，有很多条
load('data.mat')
 if flag_num == 6
     extract_seq = extract_seq(1:904,:);
 end    
    
%   确定reads在base(1)中对映的id
    read_pos=[];
    for i=1:length(reads)
        a=cellstr(reads{i});           %读取第i个序列
        idx1=strfind(a,base(1));       %base是34bp的loxp序列，查找Loxp在reads(i)中的位置
        read_pos=[read_pos;[i,idx1]];  %记录第i个序列含loxp，且lxop位置为idx1
    end

    seq_all=[extract_seq(:,3);extract_seq(:,4)];
    mun_end=[];
    for i=1:length(reads)
        a=read_pos{i,2};
        a_all = cellstr(reads(i));
        a_all =a_all{1};
        if length(a)>1
            twonum_end=[];
            for kk=1:length(a)
                out=split_LR(a(kk), a_all); 
                sub_num = optional_split(out,seq_all);
                twonum_end = [twonum_end;[a(kk),sub_num]];   
            end
            submun_end = find_optional(twonum_end);
        else
            out=split_LR(a, a_all);
            submun_end = optional_split(out,seq_all);
            submun_end =[a,submun_end];
        end
         mun_end = [mun_end;submun_end];   
    end

    [I]=find(mun_end(:,2)==mun_end(:,7));
    A=zeros(length(reads),1);
    A(I)=1;

    result_all=[A,mun_end];

    name_all=[extract_seq(:,1:2);extract_seq(:,1:2)];

    name_all=[name_all,[num2cell(zeros(length(extract_seq),1));num2cell(ones(length(extract_seq),1))]];


    pos=result_all(:,3);
    name=[];
    for i=1:length(pos)
         name=[name;name_all(pos(i,1),:);];
    end 



    pos=result_all(:,8);
    name_r=[];
    for i=1:length(pos)
         name_r=[name_r;name_all(pos(i,1),:)];
    end 

    result_all=num2cell(result_all);

    resut_end=[result_all(:,1:2),name,result_all(:,4:7),name_r,result_all(:,9:end)];
    %%%%

    result=resut_end;
    %%%The number of SNPs on the left 0---less four, 1----more four
    A = result(:,6:7);
%     A=cell2mat(A);
    A=double(A);
    B = A(:,1)-A(:,2);
    number_all =[];
    C=[];
    for i=1:length(B)

        if B(i)>4
           C=[C;[1,B(i)]];
        else
           C=[C;[0,B(i)]];
        end

    end

    number_all = [number_all,C];

    %%%right SNP number
    A = result(:,end-1:end);
    A=double(A);
    B = A(:,1)-A(:,2);
    D=[];
    for i=1:length(B)

        if B(i)>4
           D=[D;[1,B(i)]];
        else
           D=[D;[0,B(i)]];
        end

    end

    number_all = [number_all,D];


    %%% 右边的  左右两边同时小于四，0---至少有一个大于四，1---同时小于四
    A = result(:,end-3:end);
    A=double(A);

    B = [A(:,1)-A(:,2),A(:,3)-A(:,4)];

    C=[];
    for i=1:size(B,1)

        if B(i,1)<5 && B(i,2)<5
           C=[C;1];
        else
           C=[C;0];
        end

    end

    number_all = [C,number_all];

    %%% 左边的   左右两边同时小于四，0---至少有一个大于四，1---同时小于四
    A = result(:,6:9);
    A=double(A);
    B = [A(:,1)-A(:,2),A(:,3)-A(:,4)];

    C=[];
    for i=1:size(B,1)

        if B(i,1)<5 && B(i,2)<5
           C=[C;1];
        else
           C=[C;0];
        end

    end

    number_all=[C,number_all];
    number_all=num2cell(number_all);
    resut_end=[number_all,resut_end];

    resut_end=[resultS2;resut_end];

end