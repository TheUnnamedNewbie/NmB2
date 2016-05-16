function cmp = compare_int(a, b)
%COMPARE_INT Controleer welk van twee getallen groter is
%   
%   De invoer van de functie moet gegeven zijn als vectoren die natuurlijke
%   getallen voorstellen (zie opgave practicum)
%
%   Deze functie geeft +1 terug als a groter is dan b, -1 als a kleiner is
%   dan b en 0 als de getallen gelijk zijn.

    cmp = 0;
    for i=length(a):-1:1
        if (a(i) > b(i))
            cmp = 1;
            break
        elseif (a(i) < b(i))
            cmp = -1;
            break;
        end
    end

end