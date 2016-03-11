function [iA] = part_inv2 (A)
	[n m] = size(A);
	
	if (n == 2)
		iA1 = 1/A(1,1);
		iA4 = 1/A(2,2);
		
		X1 = 1 / (A(1,1) - A(1,2) * iA4 * A(2,1));
		X4 = 1 / (A(2,2) - A(2,1) * iA1 * A(1,2));
		X2 = -iA4 * A(2,1) * X1;
		X3 = -iA1 * A(1,2) * X4;
		
		iA = [X1 X3; X2 X4];
		return;
	elseif (n == 1)
		iA = 1 / A;
		return;
	endif
	
	p = ceil(n/2) - 1;
	
	A1 = A(1:p, 1:p);
	A4 = A(p+1:n, p+1:n);
	
	A2 = A(p+1:n, 1:p);
	A3 = A(1:p, p+1:n);
	
	iA1 = part_inv(A1);
	iA4 = part_inv(A4);
	
	X1 = part_inv(A1 - multiply(A3, multiply(iA4, A2)));
	X4 = part_inv(A4 - multiply(A2, multiply(iA1, A3)));
	
	iA = [X1 (-multiply(iA1, multiply(A3, X4))); (-multiply(iA4, multiply(A2, X1))) X4];
	
endfunction
