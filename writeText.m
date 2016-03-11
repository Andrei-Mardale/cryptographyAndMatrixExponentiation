%receives the encoded text
%tranforms it and outputs it to file

function [] = writeText (txt, filename)
	[fid msg] = fopen(filename, 'w');
	if (fid < 0)
		disp(msg);
		return
	endif
	
	fprintf(fid, "%c", txt);
	
	fclose(fid);
endfunction

