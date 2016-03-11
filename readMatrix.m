%reads matrix from file
function [A] = readMatrix (filename)
	#open and check file
	[fid msg] = fopen (filename, "r");
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	#read dimension
	n = fscanf(fid, '%d', 1);
	
	#read matrix as vector
	A = fscanf(fid, '%d', n^2);
	
	#reshape and transpose
	A = reshape(A, n, n)';
	
	fclose(fid);
endfunction
	
	
