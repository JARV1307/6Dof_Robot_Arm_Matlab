% Borra un objeto.

function borobj(obj)

N=length(obj);

for i=1:N
	
	delete(obj(i));
	
end