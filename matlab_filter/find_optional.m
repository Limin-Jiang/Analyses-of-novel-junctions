% function out = find_optional(twonum_end)
%     temp_num = twonum_end(:,[3:6,8:11]);
%     tem_all=[];
%     for i=1:length(temp_num(:,1))
%         tem=[];
%         for j=1:4
%             tem=[tem,temp_num(i,2*j)/temp_num(i,2*j-1)];
%         end
%         tem_all=[tem_all;tem];
%     end
%     if (tem_all(1,1)+ tem_all(1,4)) > (tem_all(2,1)+ tem_all(2,4))
%         out = twonum_end(1,:);
%     else
%         out = twonum_end(2,:);
%     end
%     
% end


function out = find_optional(twonum_end)
    temp_num = twonum_end(:,[3:6,8:11]);
    tem_all=[];
    for i=1:length(temp_num(:,1))
        tem=[];
        for j=1:4
            tem=[tem,temp_num(i,2*j)/temp_num(i,2*j-1)];
        end
        tem_all=[tem_all;tem];
    end
    tem_end = tem_all(:,1)+ tem_all(:,4);    
    [I,J] = max(tem_end);
    out = twonum_end(J,:);       
end