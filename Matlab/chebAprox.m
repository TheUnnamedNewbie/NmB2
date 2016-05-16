function y = chebAprox(x, c)
	dimms = size(c);
	N = dimms(2);
	y=0;
	for i = 1:N
		y = (c(i)*(x^(i-1)))+y;
	end
end