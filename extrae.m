% Extrae las coordenadas del punto inicial y punto final de una linea.

function [P1, P2]=extrae(linea)

X=get(linea,'xdata');
Y=get(linea,'ydata');
Z=get(linea,'zdata');

P1=[eye(3) [X(1);Y(1);Z(1)];0 0 0 1];
P2=[eye(3) [X(2);Y(2);Z(2)];0 0 0 1];

