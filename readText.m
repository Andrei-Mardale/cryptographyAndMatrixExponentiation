%reads all characters from file given by fid
function [txt] = readText (filename)
	[fid msg] = fopen(filename, 'r');
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	txt = fgets(fid); #read
	
	fclose(fid);
endfunction
	
	
