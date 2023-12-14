function u = control(states, y_des, A, b, degree)
    c10 = 1;
    c11 = 1;
    c20 = 1;
    c21 = 1;
    
    syms t
    M1 = sym('M', [2 1]);

    for i = 1:2
        M1(i) = diff(y_des(i), t, degree(i));
    end
    M2 = [-c10*(states(1) - y_des(1)) - c11*(states(2) - diff(y_des(1), t, 1));
          -c20*(states(3) - y_des(2)) - c21*(states(4) - diff(y_des(2), t, 1))]; 

    u = A\(-b + M1 - M2);
end