%actual Strassen algorithm
%matrices are assumed to be square
%is not called directly, it's a subroutine of multiply
function [C] = Strassen(A, B)
	dim = length(A);
	if (dim <= 32)
		C = A * B;
		return;
	endif
	
	p1 = ceil(dim / 2);
	r = mod(dim, 2);
	p2 = p1 + 1;
	
	[A11 B11] = deal(A(1:p1, 1:p1), B(1:p1, 1:p1));
	[A12 B12] = deal(A(1:p1, p2:dim), B(1:p1, p2:dim));
	[A21 B21] = deal(A(p2:dim, 1:p1), B(p2:dim, 1:p1));
	[A22 B22] = deal(A(p2:dim, p2:dim), B(p2:dim, p2:dim));
	
	if (r)		
		A12 = [A12 zeros(p1, 1)];
		B12 = [B12 zeros(p1, 1)];
		
		A21 = [A21; zeros(1, p1)];
		B21 = [B21; zeros(1, p1)];
		
		temp = p1 - 1;
		A22 = [[A22 zeros(temp, 1)]; zeros(1, p1)];
		B22 = [[B22 zeros(temp, 1)]; zeros(1, p1)];
	endif
	
	M1 = Strassen(A11 + A22, B11 + B22); 
	M2 = Strassen(A21 + A22, B11);
	M3 = Strassen(A11, B12 - B22);
	M4 = Strassen(A22, B21 - B11);
	M5 = Strassen(A11 + A12, B22);
	M6 = Strassen(A21 - A11, B11 + B12);
	M7 = Strassen(A12 - A22, B21 + B22);

	temp = p1 - r;
	C11 =	M1 + M4 - M5+ M7;
	C12 =	M3(1:p1, 1:temp) + M5(1:p1, 1:temp);
	C21 =	M2(1:temp, 1:p1) + M4(1:temp, 1:p1);
	C22 =	M1(1:temp, 1:temp) - M2(1:temp, 1:temp) + M3(1:temp, 1:temp) + M6(1:temp, 1:temp);

	C = [C11 C12; C21 C22];
endfunction
	
	
