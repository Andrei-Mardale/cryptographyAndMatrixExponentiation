%Gauss-Jordan
%will be using partial pivoting => better numerical stability
%limit case for partinv (when 16x16 is reached)
function [iA] = minverse (A)
	n = length(A);
	A = [A eye(n)];
	N = 2 * n;
	
	for p = 1:n
		[x i] = max(abs(A(p:n, p))); #find max
		i += p - 1; #norm position
		
		[A(i, p:N), A(p, p:N)]  = deal(A(p, p:N), A(i, p:N)); #exchange values
		
		A(p, :) /= A(p, p);
		A(p+1:n, p:N) -= A(p+1:n, p) * A(p, p:N);
	endfor

	for p = n:-1:1
		A(1:p-1, p:N) -= A(1:p-1, p) * A(p, p:N);
	endfor
	
	iA = A(1:n, n+1:N);
endfunction
	
