%crea una linea desde el pto P1 hasta el pto P2.

function linea=crealin(P1,P2,color)

X=[P1(1,4);P2(1,4)];
Y=[P1(2,4);P2(2,4)];
Z=[P1(3,4);P2(3,4)];

linea=line('xdata',X,'ydata',Y,'zdata',Z,'color',color);
%set(linea,'EraseMode','Background'); %Descomentar para versiones
%anteriores a 2015