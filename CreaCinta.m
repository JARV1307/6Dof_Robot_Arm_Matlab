% crea la cinta transportadora.

cin1=punto([0;0;0]);
cin2=despl(0,1500,0)*cin1;
cin3=despl(400,0,0)*cin1;
cinta1=crealin(cin1,cin2,[0 1 0]);
cinta2=crealin(cin1,cin3,[0 1 0]);
cinta3=copilin(cinta1,despl(400,0,0));
cinta4=copilin(cinta2,despl(0,1500,0));
cinta=[cinta1;cinta2;cinta3;cinta4];
