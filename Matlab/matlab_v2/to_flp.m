function [ a_fp ] = to_flp( a , mant_len)
%TO_FLP Zet een matlab double-precision getal om naar de FLP-voorstelling
%
%   De gebruikte voorstelling is beschreven in de opgave van het practicum.

    base = 10;
    
    if (a == 0)
        a_fp = struct('mantissa', zeros(1,mant_len), 'exponent', 0, 'sign', 1);
        return;
    end
    
    % Determine sign
    if (a < 0)
        a_sign = -1;
    else
        a_sign = +1;
    end
    a = abs(a);
    
    % Determine exponent (and put a in form 0.xxxxx)
    a_exp = 0;
    while (a < 0.1)
        a = a * base;
        a_exp = a_exp - 1;
    end
    while (a >= 1)
        a = a / base;
        a_exp = a_exp + 1;
    end
    
    % Determine mantissa
    a_str = num2str(a, 16);
    a_mant = zeros(1,mant_len);
    for i=0:min(mant_len-1, length(a_str)-3)
        a_mant(end-i) = str2double(a_str(3+i));
    end
    
    a_fp = struct('mantissa', a_mant, 'exponent', a_exp, 'sign', a_sign);
    
end

