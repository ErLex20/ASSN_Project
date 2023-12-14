function ad_f_k = multipleLieBrackets(f, g, k)

    if k == 0
        ad_f_k = g;
    end
    
    
    if k>=1
        syms appoggio
        appoggio = g;
        for i = 1:k
            appoggio = LieBrackets(f,appoggio);
        end
        ad_f_k = appoggio;
    end



end