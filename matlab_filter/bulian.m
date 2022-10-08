function bu=bulian(S)
    bu=S;
    for ii=1:length(S)
        if S(ii)=='A'
           bu(ii)='T';
        elseif S(ii)=='C'
             bu(ii)='G';
        elseif S(ii)=='G'
             bu(ii)='C';
        elseif S(ii)=='T'
             bu(ii)='A';
         elseif S(ii)=='a'
           bu(ii)='t';
        elseif S(ii)=='c'
             bu(ii)='g';
        elseif S(ii)=='g'
             bu(ii)='c';
        elseif S(ii)=='t'
             bu(ii)='a';
        end
     end
end           
