inigraf

% mesas de trabajo
CreaMesa
dibuobj(mesa,despl(2500,0,0))
copiobj(mesa,despl(0,1200,0))
copiobj(mesa,despl(0,-1200,0))

copiobj(mesa,despl(-5000,0,0))
copiobj(mesa,despl(-5000,1200,0))
copiobj(mesa,despl(-5000,-1200,0))


%cintas transportadoras
CreaCinta
dibuobj(cinta, despl(2300,0,1000))
copiobj(cinta,despl(0,-1500,0))
copiobj(cinta,despl(0,-3000,0))

copiobj(cinta, despl(-5000,0,0))
copiobj(cinta,despl(-5000,-1500,0))
copiobj(cinta,despl(-5000,-3000,0))



%robot asignado
BX200X

robot=crearob(r2,[pi/2,pi/2,0,0,pi,0]')
