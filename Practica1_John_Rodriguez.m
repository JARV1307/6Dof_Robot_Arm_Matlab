puntoP =[eye(3),[100;100;100];0 0 0 1];

P1 = rotax(pi/4)*puntoP

P2 = despl(100,0,0)*P1;
P2 = despl(0,100,0)*P2;
P2 = despl(0,0,100)*P2;

col = [0.1 0.9 0]; %color

lintres = crealin(P1,P2,col) %linea
lintres2 = crealin(P1,P2,col) 

dibulin(lintres2,rotay(pi/4)) %edita la linea

lintres2.Color


%% 3.3 TABLA
inigraf

tabla1=crealin([eye(3) [600;600;1000];0 0 0 1], [eye(3) [600;-600;1000] ;0 0 0 1],[0.1 0.1 1])

[P1 P2]=extrae(tabla1)
P1=rotaz(pi/2)*P1
P2=rotaz(pi/2)*P2
tabla2=crealin(P1,P2,[0.1 0.1 1])


[P3 P4]=extrae(tabla2)
P3=rotaz(pi/2)*P3
P4=rotaz(pi/2)*P4
tabla3=crealin(P3,P4,[0.1 0.1 1])


[P5 P6]=extrae(tabla3)
P5=rotaz(pi/2)*P5
P6=rotaz(pi/2)*P6
tabla4=crealin(P5,P6,[0.1 0.1 1])

tabla=[tabla1 tabla2 tabla3 tabla4]

[P7 P8]=extrae(tabla1);


pata1 = crealin(despl(0,0,+400)*despl(0,+400,0)*rotax(pi/2)*P7,despl(0,0,+400)*despl(0,+400,0)*rotax(pi/2)*P8,[0.1 0.1 1])

pata2 = copilin(pata1,despl(-1200,0,0))

pata3 = copilin(pata2,despl(0,1200,0))

pata4 = copilin(pata1,despl(0,1200,0))



%dibuobj(tabla, rotax(pi/2)*despl(0,0,-100))

%dibuobj(copiobj(tabla,rotay(pi/4)*despl(0,0,-300)),rotax(pi/2))



mesa = [tabla;pata1 pata2 pata3 pata4]

CreaCinta

dibuobj(cinta, despl(-200,0,1000))

CreaCubo

dibuobj(cubo, despl(-150,0,1000))

mpieza

%% parametros DH robot

PRR



%% generacion robot en espacio 3D
inigraf

robot=crearob(r1,[1000,pi,-pi/2,0,pi/2,0]') %lineas robot


%% pruebas de cinematica directa

modrob(r1,[1400,pi/3,-pi/2,pi/3,2*pi/3,0]',robot) % dibujar en el espacio

T = dircin(r1,[1400,pi/3,-pi/2,pi/3,2*pi/3,0]');% matriz homogenea de la posicion de la herramienta respecto a sistema de coordenadas fijo universal


%% trayectoria 

trayectoria = gentray([1000,pi,-pi/2,0,pi/2,0]',[1400,pi/3,-pi/2,pi/3,2*pi/3,0]',1);

%%
inigraf
CreaCubo

%%

matrix_X= 1.0e+03 *[ -0.0010   -0.0000    0.0000    2.0000
    0.0000   -0.0000    0.0010    0.2000
         0    0.0010    0.0000    1.0000
         0         0         0    0.0010];
matrix_X2=[    0.9839    0.0581   -0.1688   45.8139
   -0.0386    0.9925    0.1163  118.3213
    0.1743   -0.1079    0.9788 -457.8191
         0         0         0    1.0000];
dibuobj(cubo,matrix_X2)

%% animacion trayectoria

dibrob(r1,robot,trayectoria)


%% Caja pegada a la punta del brazo 
inigraf

CreaCubo

robot=crearob(r1,[1000,pi,-pi/2,0,pi/2,0]')
matrix_direccion = dircin(r1,[1000,pi,-pi/2,0,pi/2,0]')
dibuobj(cubo,matrix_direccion)
%movRob_pieza(r1,robot,trayectoria,cubo) %lineas robot


%%
dibuobj(cubo,matrix_direccion)


%%
inigraf
CreaCubo
posicion_1 = 1000*[1.4000    0.0010   -0.0016    0.0010    0.0021         0]'
robot=crearob(r1,posicion_1)
matrix_direccion = dircin(r1,posicion_1)
dibuobj(cubo,matrix_direccion)

%%
m =1.0e+03 * [-0.0010   -0.0000    0.0000    2.0000;
    0.0000   -0.0000    0.0010    0.2000;
         0    0.0010    0.0000    1.0000;
         0         0         0    0.0010]
dibuobj(cubo,m)


%% caja movida junto con la punta del brazo

inigraf

CreaCubo
mpieza
robot=crearob(r1,[1000,pi,-pi/2,0,pi/2,0]');%crea robot en posicion incial
movRob_pieza(r1,robot,trayectoria,cubo) %

%%

inigraf
robot2=crearob(r2,[0,pi/2,0,0,0,0]')