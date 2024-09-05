% Devuelve las dos configuraciones de la muñeca para alcanzar la orientación deseada.
% Datos de entrada: la matriz que define el robot (rob) la matriz homogenea deseada (MH),
% y las coordenadas de las tres primeras articulaciones.

function [q1, q2]=ciPRR3_6(robot,MH,q3)

% Se encuentra la matriz de transformación del origen al sis. coord. 3 y la matriz
% de rotación correspondiente.

A03=DH(robot,0,0)*DH(robot,1,q3(1))*DH(robot,2,q3(2))*DH(robot,3,q3(3));
R03=rotacion(A03);

% Se encuentra la matriz de rotación del sist. coord. 3 al 6. 
R36=inv(R03)*rotacion(MH);

% Se extraen los datos de las tres últimas coordenadas generalizadas para los dos casos.
q1(1)=sin(R36(2,3)/R36(3,3))+pi;
q1(2)=acos(R36(3,3));  
q1(3)=atan2(R36(3,2),-R36(3,1));

q2(1)=q1(1)-pi;
q2(2)=-q1(2);
q2(3)=q1(3)-pi;


