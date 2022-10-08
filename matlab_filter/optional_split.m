% function mun_end=optional_split(split,seq_all)
% mun_end=[];
% num_all=[];
%      for jj=1:length(seq_all)        
%             temp_main=seq_all{jj};
%             temp_left=temp_main(117-split{1,1}:150);
%             temp_right=temp_main(117:150+split{1,3});       
%             num_1 = compare(temp_left,split{1,2});
%             num_2 = compare(temp_right,split{1,4});
%             num_all=[num_all;[jj,length(temp_left),num_1,length(temp_right),num_2]];        
%      end
%     [I1,J1] = max(num_all(:,3));
%     [I2,J2] = max(num_all(:,5));
%     mun_end=[mun_end;[J1,num_all(J1,2:end),J2,num_all(J2,2:end)]];
% end
function mun_end=optional_split(out,seq_all)
%split = out;
mun_end=[];
num_all=[];
     for jj=1:length(seq_all)        
            temp_main=seq_all{jj}; % 获取loxp上下游序列，（904*2）x1
            temp_left=temp_main(117-out{1,1}:150); %loxp左侧序列(loxp定位在117位置，长34bp),
            temp_right=temp_main(117:150+out{1,3}); %loxp右侧序列
            num_1 = compare(temp_left,out{1,2}); %第i个loxp序列左侧序列中与spilt目标序列中loxp左侧（1：a+33）序列相同的个数
            num_2 = compare(temp_right,out{1,4});%第i个loxp序列右侧序列中与spilt目标序列中loxp右侧（a：end）序列相同的个数
            num_all=[num_all;[jj,length(temp_left),num_1,length(temp_right),num_2]];        
     end    
    [J1] = find(num_all(:,3) == max(num_all(:,3)));   
    [J2] = find(num_all(:,5) == max(num_all(:,5)));   
    C=intersect(J1,J2);
    if length(C)==0
        J1 = J1(1);
        J2 = J2(1);
    else
        J1 = C(1);
        J2 = C(1);
    end    
    mun_end=[mun_end;[J1,num_all(J1,2:end),J2,num_all(J2,2:end)]];
end