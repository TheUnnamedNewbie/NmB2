function [ c ] = add_flp(a, b)
%ADD_FLP Tel twee floating point getallen op
%
% De getallen moeten structs zijn zoals beschreven in de opgave van het
% practicum. De lengte van de mantissa moet voor beide getallen hetzelfde
% zijn. De output zal ook een mantissa hebben van dezelfde lengte.

    mant_len = length(a.mantissa);
    if (mant_len ~= length(b.mantissa))
        error('The length of the mantissa on both inputs has to be the same');
    end
    
    if (a.mantissa == 0)
        c = b; return;
    elseif(b.mantissa == 0)
        c = a; return;
    end

    % align point on both numbers
    shift = a.exponent - b.exponent;
    a_mant = a.mantissa;
    b_mant = b.mantissa;
    if (shift > 0)
        b_mant = shift_flp(b_mant, abs(shift));
    else
        a_mant = shift_flp(a_mant, abs(shift));
    end
    c_exp = max(a.exponent, b.exponent);
    
    
    % do addition / subtraction
    if (a.sign == b.sign)
        c_sign = a.sign;
        c_mant = add_int(a_mant, b_mant);
        if (length(c_mant) == mant_len+1)
            c_exp = c_exp + 1;
            c_mant = c_mant(2:end);
        end
    else
        [c_mant, sign] = sub_int(a_mant, b_mant);
        c_sign = sign*a.sign;
        
        % shift to point
        if (c_mant == 0)
            c_mant = zeros(1,mant_len);
            c_exp = 0;
        else
            shift = mant_len - length(c_mant);
            c_exp = c_exp - shift;
            c_mant = [zeros(1, shift), c_mant];
        end
    end
    
    c = struct('mantissa', c_mant, 'exponent', c_exp, 'sign', c_sign);
    
end



function num_shift = shift_flp(num, shift)
    
    mant_len = length(num);
    if (shift < mant_len)
        num_shift = [num(1+shift:end), zeros(1, shift)];
    else
        num_shift = zeros(1,mant_len);
    end
    
end
