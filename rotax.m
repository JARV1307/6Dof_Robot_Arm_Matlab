%Devuelve la matriz de rotación con respecto al eje x.

function A = rotax(alpha)
	
	calpha = cos(alpha);
	salpha = sin(alpha);


	A =    [1	0	0	0
		0	calpha	-salpha	0
		0	salpha	calpha	0
		0	0	0	1];

