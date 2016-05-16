function [ a ] = from_flp( a_flp )
%FROM_FLP Zet FLP-voorstelling om naar matlab double-precision
%
%   De gebruikte voorstelling is beschreven in de opgave van het practicum.

    base = 10;

    a = 0;
    for i=1:min(16, length(a_flp.mantissa))
        a = a + base^(a_flp.exponent-i) * a_flp.mantissa(end-(i-1));
    end
    
    a = a_flp.sign * a;
end

