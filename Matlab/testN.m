function result = testN(funct, n, a, b)
	g=40;
	f=70;
	incr = (b-a)/100;
	values = zeros(1, 101);
	values(1, 1) = a;
	for i = 1:100
		values(1, i+1) = a+i*incr;
	end
	T = cheb(n);
	A = cheb_coeff(funct, n);
	C = poly(A, T, n);
	sizec = size(C);
	result = zeros(1, 101);
	parfor i = 1:101
		result(1, i) = chebAprox(values(1, i), C);
	end	
	resultsfunction = zeros(1, 101);
	parfor i=1:101
		resultsfunction(1, i) = funct(values(1, i));
	end
	difference = zeros(1, 101); 
	parfor i=1:101
		difference(1, i) = resultsfunction(1, i) - result(1, i);
	end
	figure
	subplot(2, 1, 1)
	plot(values(1, g:f), resultsfunction(1, g:f), 'g', values(1, g:f), result(1, g:f), 'r');
	subplot(2, 1, 2)
	plot(values(1, g:f), difference(1, g:f));
	
end