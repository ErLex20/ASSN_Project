function [A, b] = normalForm(f, g, h, degree)
    
    m = size(g, 2);
    A = sym('a', [m, m]);
    b = sym('b', [m, 1]);

    for i = 1:m
        for j = 1:m
            A(i, j) = LieDerivative(MultipleLieDerivative(h(i), f, degree(1) - 1), g(:, j));
        end
        b(i) = MultipleLieDerivative(h(i), f, degree(i));
    end
    
end