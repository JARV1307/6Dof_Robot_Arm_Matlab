% Modifica los ptos inicial y final de una linea a P1 y P2.

function modlin(linea,P1,P2)

X=[P1(1,4);P2(1,4)];
Y=[P1(2,4);P2(2,4)];
Z=[P1(3,4);P2(3,4)];

set (linea, 'xdata',X,'ydata',Y,'zdata',Z);
