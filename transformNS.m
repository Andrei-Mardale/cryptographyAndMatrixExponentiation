%converts numbers to ascii code (numbers -> symbols)
function [txt] = transformNS (txt)
	txt(find(txt == 0)) = ' ';
	txt(find(txt == 27)) = '.';
	txt(find(txt == 28)) = "'";	
	txt(find(txt >= 1 & txt <= 26)) += 96;
endfunction	
