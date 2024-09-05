function dibrob(robot, lineas, trayectoria)

for i=1:size(trayectoria)

    modrob(robot,trayectoria(i,:)',lineas)
    pause(0.1);
end
    