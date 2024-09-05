% Crea la matriz de Dennavit Hartenberg

function [matriz]=DH(robot,eje,q)

a=robot(eje+1,2);
alpha=robot(eje+1,1);
if robot(eje+1,5) == 0
	theta=q;
	d=robot(eje+1,3);
else
	d=q;
	theta=robot(eje+1,4);
end

matriz=[cos(theta) -cos(alpha)*sin(theta) sin(alpha)*sin(theta) a*cos(theta);
	sin(theta) cos(alpha)*cos(theta) -sin(alpha)*cos(theta) a*sin(theta);
	0	   sin(alpha)		 cos(alpha)		d;
	0	   0			 0			1];

 