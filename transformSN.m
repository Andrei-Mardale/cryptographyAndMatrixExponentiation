%converts ascii code to usable numbers (symbols -> numbers)
function [txt] = transformSN (txt)
	txt = tolower(txt); #lowercase
	
	txt(find(txt == ' ')) = 0;
	txt(find(txt == '.')) = 27;
	txt(find(txt == "'")) = 28;
	txt(find(txt >= 'a' & txt <= 'z')) -= 96;
	
	txt = toascii(txt);	#treat as numbers
endfunction
	
