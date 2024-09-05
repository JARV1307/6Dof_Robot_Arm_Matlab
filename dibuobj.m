% Traslada o gira un objeto según la matriz homogénea dada.

function dibuobj(obj,matriz)

N=length(obj);

for i=1:N
	
	dibulin(obj(i),matriz);
	
end