%crea mesa de trabajo

tabla1=crealin([eye(3) [600;600;1000];0 0 0 1], [eye(3) [600;-600;1000] ;0 0 0 1],[0.1 0.1 1]);

[P1 P2]=extrae(tabla1);
P1=rotaz(pi/2)*P1;
P2=rotaz(pi/2)*P2;
tabla2=crealin(P1,P2,[0.1 0.1 1]);

[P3 P4]=extrae(tabla2);
P3=rotaz(pi/2)*P3;
P4=rotaz(pi/2)*P4;
tabla3=crealin(P3,P4,[0.1 0.1 1]);

[P5 P6]=extrae(tabla3);
P5=rotaz(pi/2)*P5;
P6=rotaz(pi/2)*P6;
tabla4=crealin(P5,P6,[0.1 0.1 1]);

tabla=[tabla1; tabla2; tabla3; tabla4];

[P7 P8]=extrae(tabla1);

pata1 = crealin(despl(0,0,+400)*despl(0,+400,0)*rotax(pi/2)*P7,despl(0,0,+400)*despl(0,+400,0)*rotax(pi/2)*P8,[0.1 0.1 1]);
pata2 = copilin(pata1,despl(-1200,0,0));
pata3 = copilin(pata2,despl(0,1200,0));
pata4 = copilin(pata1,despl(0,1200,0));


mesa = [tabla;pata1; pata2; pata3; pata4];

