% Crea el robot dado en la configuración dada.

function modrob(robot,q,lineas)

matriz=eye(4);

q=[0;q];

for i=1:size(lineas,1)
	
	matriz=matriz*DH(robot,i-1,q(i));
	Pi=matriz*punto(robot(i,6:8)');
	Pf=matriz*punto(robot(i,9:11)');
	modlin(lineas(i),Pi,Pf);	
end


