%% Primera parte

%{

Datos

Robot asignado: BX200X

Alumno: John Andres Rodriguez Vasquez

%}


%%% Iniciacion del ambiente de trabajo %%%

zonaTrabajo


%%% Animacion recursiva de la operacion:

for i=1:10

% pieza a mover
CreaCubo

dibuobj(cubo, despl(2500-150,-3000,1000))

mpieza



%%% Accionamiento del robot para alistarse a recoger el objeto
q_1 = [pi/2,pi/2,0,0,pi,0];
q_2 = [pi/12,pi/2,0,0,pi,0];%[pi/12,(pi/4)+(pi/7),-pi/50,0,0,0]
trayectoria1 = gentray(q_1',q_2',1);

dibrob(r2,robot,trayectoria1)

q_3 = [pi/12,(pi/5)+(pi/7.5),pi/10.5,-pi,(pi/4),0];
trayectoria2 = gentray(q_2',q_3',1);

dibrob(r2,robot,trayectoria2)


%%% pick and place

trayectoria3 = gentray(q_3',q_2',1);
borobj(cubo);
 
CreaCubo
movRob_pieza(r2,robot,trayectoria3,cubo)

q_4 = [pi-pi/12,pi/2,0,0,pi,0];
trayectoria4 = gentray(q_2',q_4',1);
borobj(cubo);

CreaCubo
movRob_pieza(r2,robot,trayectoria4,cubo)

q_5 = [pi-pi/12,(pi/5)+(pi/7.5),pi/10.5,-pi,(pi/4),0];
trayectoria5 = gentray(q_4',q_5',1);
borobj(cubo);

CreaCubo
movRob_pieza(r2,robot,trayectoria5,cubo)


borobj(cubo)
CreaCubo
dibuobj(cubo, despl(-2500-150,670,1000))

%%% regresar a la posicion inicial

trayectoria5 = gentray(q_5',q_1',1);
dibrob(r2,robot,trayectoria5)


%%desplazamiento final
for i=0:450

	dibuobj(cubo,despl(0,-10,0));
	drawnow
end


borobj(cubo)
end





