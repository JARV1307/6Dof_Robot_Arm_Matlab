%Devuelve la mtriz de rotación con respecto al eje y.

function A = rotay(alpha)
	
	calpha = cos(alpha);
	salpha = sin(alpha);


	A =    [calpha	0	salpha	0
		0	1	0	0
		-salpha	0	calpha	0
		0	0	0	1];
