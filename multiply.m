%this actually pads matrices and THEN calls the actual Strassen algorithm
%this results in square matrices
%the padding is done up to the greatest dimension
function [C] = multiply(A, B)
	[dimA dimB] = deal(size(A), size(B));

	if (max(dimA != dimB)) 
		dim = max([dimA dimB]);
	
		A = [[A zeros(dimA(1), dim - dimA(2))]; zeros(dim - dimA(1), dim)];
		B = [[B zeros(dimB(1), dim - dimB(2))]; zeros(dim - dimB(1), dim)];
	endif
	
	C = Strassen(A, B) (1:dimA(1), 1:dimB(2));
endfunction
	
	
