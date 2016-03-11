function [] = transposition()
	[fid msg] = fopen('input1C', 'r');
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	#get k and n
	k = fscanf(fid, "%d");
	n = k(2);
	k = k(1);
	
	#get text
	txt = fgets(fid)'; 
	fclose(fid);
	
	#transform symbols (letters) to numbers
	txt = transformSN(txt);
	L = length(txt); #remember original length
	
	#pad it
	txt = pad(txt, n);
	
	#translation matrix
	A = eye(n+1);
	A (1:n, n+1) = k;
	
	[fid msg] = fopen('key1C', 'w');
	if (fid < 0)
		disp(msg);
		return;
	endif
	
	for p = 1:n+1
		fprintf(fid, "%d ", A(p,:));
		fprintf(fid, "\n");
	endfor
	fclose(fid);	
	
	p = 1; #current position
	check = 1000;
	changed = false;
	while (p < length(txt))
		txt(p:p+n-1) = (A * [txt(p:p+n-1); 1])(1:n);
		p += n;
		
		if (changed)
			A(1:n, n + 1) = k; #change the rest of the values
			changed = false;
		endif
		
		if (p + n - 1 > check)
			temp = check - p + 2; #position from which to change k value in matrix
			++k;
			A(temp:n, n+1) = k;
			changed = true;
			check += 1000;			
		endif	
	endwhile
	
	txt = txt(1:L); #forget the padding
	txt(1:L) = mod(txt(1:L), 29); #
	txt = (transformNS(txt)); #transform numbers to readable symbols
	txt(L) = 10; #EOF
	writeText(txt, 'output1C'); #write it
endfunction
	
