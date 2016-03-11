function [A] = pow (A, n);
	dim = size(A);
	if (n == 0)
		A = eye(dim(1));
		return;
	elseif (n == 1)
		return;
	elseif (mod(n, 2))
		A = multiply(A, pow(multiply(A, A), (n-1)/2));
		return;
	else
		A = pow(multiply(A, A), n/2);
		return;
	endif
endfunction
