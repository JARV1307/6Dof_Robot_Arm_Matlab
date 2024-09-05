%Devuelve la matriz de rotación con respecto al eje z.

function A = rotaz(alpha)
	
	calpha = cos(alpha);
	salpha = sin(alpha);


	A =    [calpha	-salpha	0	0
		salpha	calpha	0	0
		0	0	1	0
		0	0	0	1];