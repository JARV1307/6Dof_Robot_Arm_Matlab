% Crea el cubo de basura

Cubo1=punto([0,0,0]');
Cubo2=despl(300,0,0)*Cubo1;
ariscub1= crealin(Cubo1,Cubo2,[1 0 1]);
ariscub2=copilin(ariscub1,despl(0,300,0));
ariscub3=copilin(ariscub1,rotaz(pi/2));
ariscub4=copilin(ariscub3,despl(300,0,0));
carcub1=[ariscub1;ariscub2;ariscub3;ariscub4];
carcub2=copiobj(carcub1,despl(0,0,300));

Cubo3=despl(0,0,300)*Cubo1;
ariscub5=crealin(Cubo1,Cubo3,[1 0 1]);
ariscub6=copilin(ariscub5,despl(300,0,0));
ariscub7=copilin(ariscub6,despl(0,300,0));
ariscub8=copilin(ariscub7,despl(-300,0,0));

cubo=[carcub1;carcub2;ariscub5;ariscub6;ariscub7;ariscub8];

