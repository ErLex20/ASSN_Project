function L_f_k = MultipleLieDerivative(lambda, f, k)

    syms appoggio
    appoggio = lambda;

    for i = 1:k
        appoggio = LieDerivative(appoggio,f);
    end

    L_f_k = appoggio;

end