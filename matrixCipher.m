function [] = matrixCipher()
	A = readMatrix('key1A');
	n = length(A);
	
	txt = readText('input1A')';
	#get rid of EOF if there is one (vezi testele 7 si 8)
	if (txt(length(txt)) == 13)	
		txt = txt(1:length(txt)-1);
	endif	
	txt = transformSN(txt);	#transform symbols -> numbers	
	txt = pad(txt, n);
	
	#multiply block by block 
	#every block has dimension n
	for p=1:n:length(txt)
		temp = p + n - 1;
		txt(p:temp) = A * txt(p:temp);
	endfor
	
	txt(1:length(txt)) = mod(txt(1:length(txt)), 29); #compute modulo 29
	txt = transformNS (txt); #transform numbers -> symbols
	 
	writeText(txt', 'output1A');
endfunction
