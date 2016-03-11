%pad txt with zeros

function [txt] = pad (txt, n)
	if (mod(length(txt), n) != 0)
		nzeros = n - mod(length(txt), n); #calculate number of zeros to be added
		txt = [txt; zeros(nzeros, 1)]; #then add them
	endif
endfunction
