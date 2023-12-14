function field_vector = LieBrackets(f,g)

   % given two fields of vectors of dimension n,this function returns their lie brackets
    n = length(f(:,1));
    if n == 1
        sym x
        df_dx = diff(f,x);
        dg_dx = diff(g,x);
        field_vector = dg_dx*f - df_dx*g;
    else
        variables = sym('x',[1,n]);
        df_dx = jacobian(f,variables);
        dg_dx = jacobian(g,variables);
        field_vector = dg_dx*f - df_dx*g;
    end
end