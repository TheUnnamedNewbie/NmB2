function T = cheb(n)

	%Joren Vaes
	%2016

	%Calculates the polynomial cooefficients for the Chebyshev-polinomials of degree 0 to n


	if n < 0;
		disp('Invalid n! N must be greater than 2!');
		return
	end
	if n == 1
		T = [1];
		return;
	end

	% t(y, x)
	% Fill in default two values
	T = zeros(n+1, n+1);
	T(1, 1) = 1;
	T(2, 2) = 1;

	%MAIN PROGRAM
	if ~(n == 2)
		for k = 3:n+1
			T(k, 1) = -T(k-2, 1);
			for i=2:k %since past k it's just zeroes
				T(k, i) = 2*T(k-1, i-1) - T(k-2, i);
			end
		end
	end
end