function u = control(zita, ydes, f, g, h, degree)
    
    % passare i vettori g come matrice es: g = [g1, g2];
    % passare le uscite y come matrice es: h = [h1, h2];

    % costruzione matrice A, in questo caso matrice quadrata 

    n = size(f, 1);
    m = size(g, 2);
    A = sym('a', [m, m]);
    
    for i = 1:m
        for j = 1:m
            %keyboard;
            A(i, j) = LieDerivative(MultipleLieDerivative(h(i), f, degree(1) - 1 ), g(:,j));
        end
        keyboard;
        b(i) = MultipleLieDerivative(h(i), f, degree(i));
    end
    keyboard;

    % calcolo della matrice b

    



end