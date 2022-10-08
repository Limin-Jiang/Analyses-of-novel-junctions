function num = compare(a,b)
    num=0;
    for i=1:length(a)
        if a(i)==b(i)
            num=num+1;
        end
    end
end
