%solves a*x + b*y = gcd(a, b)
%used here for finding multiplicative inverse
function [x y] = euclid (a, b)
	s = [1 0];
	t = [0 1];
	
	if (a > b)
		[a b] = deal(b, a);
	endif
	
	while ((temp = mod(a, b)) != 0)
		temp2 = floor(a/b);
		[a b] = deal(b, temp);
		s = [s(2) s(1) - temp2 * s(2)];
		t = [t(2) t(1) - temp2 * t(2)];
	endwhile
	
	[x y] = deal(s(2), t(2));
endfunction
