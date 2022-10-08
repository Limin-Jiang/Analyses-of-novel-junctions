function out=split_LR(a, a_all)
    a_left = a_all(1:a+33);
    a_right = a_all(a:end);    
    out =[a-1,{a_left},length(a_all)-33-a,{a_right}];
end
