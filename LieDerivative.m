function L = LieDerivative(lambda, f)
    % given a vector field f and a function lambda, this "function" returns a
    % function
    n = length(f(:,1));
    if n == 1
        sym x
        dlambda_dx = diff(lambda,x);
        L = dlambda_dx*f;
    else
        variables = sym('x',[1,n-1]);
        syms zita
        variables = [variables zita];
        dlambda_dx = jacobian(lambda,variables);
        L = dlambda_dx*f;
    end

end