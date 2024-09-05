%Devuelve desplazamientos.

function A = despl(x,y,z)
	

	A =    [1	0	0	x
		0	1	0	y
		0	0	1	z
		0	0	0	1];

%desplazamiento en x   y=0 z=0
%desplazamiento en y   x=0 z=0
%desplazamiento en z  x=0 y=0