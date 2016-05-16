function [c] = poly(a, T, n)
	
	
	parfor i=1:n+1
		for j = 1:n+1
			Tnew(i, j) = T(i, j)*a(1, i)
		end
	end
	
	
	
	% parfor i=1:n+1
		% for j = 1:n+1
			% Tnew(i, j) = T(i, j)*a(1, j);
		% end
	% end
	c = zeros(1, n+1);
	for i = 1:n+1
		for j = 1:n+1
			c(1, i) = Tnew(j, i) + c(1, i);
		end
	end		

end