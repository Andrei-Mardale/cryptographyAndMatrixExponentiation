function [] = decrypt()
	A = readMatrix('key1B');
	n = length(A);
		
	txt = readText('input1B')';
	txt = transformSN(txt);	#transform symbols -> numbers	
	

	
	A = modinv(A, 29); #compute inverse
	
	#algorithm from a
	for p=1:n:length(txt)
		temp = p + n - 1;
		txt(p:temp) = A * txt(p:temp);
	endfor
	
	txt(1:length(txt)) = mod(txt(1:length(txt)), 29);
	txt = transformNS (txt); #transform numbers -> symbols
	
	writeText(txt', 'output1B');
endfunction
