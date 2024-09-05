% Crea el robot dado en la configuración dada.

function elem=crearob(robot,q)

elem=[];
matriz=eye(4);

q=[0;q];

for i=1:size(robot,1)
	
	matriz=matriz*DH(robot,i-1,q(i));
	Pi=matriz*punto(robot(i,6:8)');
	Pf=matriz*punto(robot(i,9:11)');
	color=robot(i,12:14);
	elem(i)=crealin(Pi,Pf,color);
	
end

elem=elem';
