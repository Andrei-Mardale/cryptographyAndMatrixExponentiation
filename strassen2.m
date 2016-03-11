%solves task 2
function [] = strassen2(in, out)
	[fid msg] = fopen(in, "r");
	if (fid < 0)
		disp(msg);
		return
	endif
	
	n = fscanf(fid, "%d\n", 1);
	
	A = zeros(0);
	while (1)
		buff = fgetl(fid);
		if (buff == -1)
			break;
		endif
		buff = str2double(ostrsplit(buff, " \n"));
		A = [A; buff(1:length(buff) - 1)];
	endwhile
		
	fclose(fid);
	
	A = part_inv2(A);
	A = pow(A, n);	
	
	[fid msg] = fopen(out, "w");
	if (fid < 0)
		disp(msg);
		return
	endif
	
	dim = size(A);
	for p = 1:dim(1)
		fprintf(fid, "%.6f ", A(p,:));
		fprintf(fid, "\n");
	endfor
	
	fclose(out);
endfunction
	
	
