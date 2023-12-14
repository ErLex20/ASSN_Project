function phi = changeCoordinates(f, h)

    n = size(f, 1);
    m = size(h, 2);
    phi = sym('phi', [n 1]);

    k = 1;
    for i = 1:m
        for j = 1:m
            phi(k) = MultipleLieDerivative(h(i), f, j - 1);
            k = k + 1;
        end
    end
end