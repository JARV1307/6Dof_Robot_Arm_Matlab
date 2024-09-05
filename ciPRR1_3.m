% Resuelve la cinemática inversa para un robot PRR
% Parámetros de entrada:
%		Modelo cinemático del robot (tabla DH)
%		Localización del TCP0 deseada
% Parámetros de salida:
%		Configuracines izquierda y derecha

function [q_izd, q_der]=ciPRR1_3(robot,pos)

% Cuidado esta función depende de como se defina el modelo del robot (Tabla DH)

% Posibles soluciones para las articulaciones principales
q_izd(1)=pos(2); q_der(1)=pos(2);

p2 = (pos(1)^2) + (pos(3)^2);
p  = sqrt(p2);
l1 = -robot(3,2); % -a2=1000
l12= l1^2;
l2 = robot(5,3); % d4=1000
l22= l2^2;

beta=atan2(-pos(3),pos(1));
phi=acos( (p2+l12-l22) / (2.0*l1*p) );
q_izd(2)=pi+beta+phi; q_der(2)=pi+beta-phi;

gamma=acos( (p2-l12-l22) / (2.0*l1*l2) );
q_izd(3)=-gamma-(pi/2.0); q_der(3)=gamma-(pi/2.0);

sol_izq(1) = q_izd(1);
sol_izq(2) = q_izd(2)* (180.0/pi);
sol_izq(3) = q_izd(3)* (180.0/pi);

sol_der(1) = q_der(1);
sol_der(2) = q_der(2)* (180.0/pi);
sol_der(3) = q_der(3)* (180.0/pi);




