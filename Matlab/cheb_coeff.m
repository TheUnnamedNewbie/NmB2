function [a] = cheb_coeff(funct, N)
	if ~(exist('N', 'var') || isempty(N))
		disp('Using default value 100 for N');
		N = 100;
	end
	cosn = @cosOfNCheb;
	
	%Check if people are not being silly
	if (N <= 0)
		disp('N must be greater than 1');
		return;
	end
	
	%Set up empty array for fevals
	handlevector = zeros(1, (2*N)+1);
	
	%Set up empty array for a values
	a = zeros(1, N+1);
	
	
	
	
	
	%fill first set of the handlevector - This seems to work
	handlevector(1, 1) = funct(cosn(0, N));
	parfor i=1:N
		handlevector(1, i+1) = feval(funct, feval(cosn, i, N));
	end
	
	%even expantion of the function, so I can use the FFT to get my cheb coeef. - This seems to work
	for i=1:N-1
		handlevector(1, N+i+1) = handlevector(1, N-i)
	end

	values = fft(handlevector);
	a(1:N+1) = values(1:N+1)/N
	b = zeros(1, N+1);
	for i=0:N
		b(i+1)
	
	
end
	
		