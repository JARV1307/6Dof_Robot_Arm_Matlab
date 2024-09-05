function movRob_pieza(robot, lineas, trayectorias, pieza)


matrix_homogenea_inicial = eye(4);

dibuobj(pieza,despl(-100,-100,0))

for i=1:height(trayectorias)

    modrob(robot,trayectorias(i,:)',lineas) %modificacion de las lineas del robot

    %seguimiento del cubo:

    matriz1=dircin(robot,trayectorias(i,:)')*inv(matrix_homogenea_inicial);
    %se obtiene un matriz homogenea de transformacion que relaciona el
    %sistema de coordenadas anterior con la posicion actual del efector
    %final del robot
   
    dibuobj(pieza,matriz1) % modifica el dibujo de la pieza que recoge el brazo
    %esta funcion realiza desplazamientos y rotaciones por post multiplicacion
  
    matrix_homogenea_inicial = dircin(robot,trayectorias(i,:)');%se reemplaza por la matriz
    %homogenea actual para tener en cuenta el siguiente paso.

    pause(0.1);
 
end

