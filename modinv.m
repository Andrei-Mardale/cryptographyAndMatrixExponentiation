%finds the inverse of A in modulo x
%uses Gauss-Jordan algorithm modified for modulo 29
function [A] = modinv(A, x)
	[n m] = size(A);
	A = [A eye(n)];
	m = 2 * n;
	
	#store all multiplicative inverses in a 2 by x matrix
	#minv as in multiplicative inverse
	minv = zeros(1, x-1);
	
	#fill values for row 2
	#index i from row 1 will have inverse i from row 2
	for p = 1:x-1
		minv(p) = euclid(p, x);
		if (minv(p) < 0)
			minv(p) += x;
		endif
	endfor
	
	#Gauss top -> bottom
	#make pivot 1 then add below and make zero (mod x)
	for p = 1:n
		A(p, p:m) *= minv(mod(A(p, p), 29));
		for k = p+1:n
			A(k, p:m) += mod(A(p, p:m) * (x - A(k, p)), 29);
		endfor
	endfor
	
	#Gauss bottom -> top
	for p = n:-1:1
		for k = p-1:-1:1
			A(k, p:m) += mod(A(p, p:m) * (x - A(k, p)), 29);
		endfor
	endfor
	
	#take what we need
	A = A(1:n, n+1:m);  
endfunction
		
