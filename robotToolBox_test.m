%% Usando Robotics System Toolbox en matlab

%%esta seccion sirve para visualizar el robot en un ambiente especializado
%%para programacion de robot y sirve para obtener todas las posbiles
%%configuraciones de la cinematica inversa.

          % a       alpha   d       theta
dhparams = [210   	pi/2	670   	0;
sqrt((1370)^(2)+(185^2))	0       0       pi/2
            0	   pi/2	    0	    0;
            0      pi/2	    1950	0;
            0       pi/2	0   	0;
            0       0       245       0];

bx2002x=rigidBodyTree;

bodies = cell(6,1);
joints = cell(6,1);

for i = 1:6
    bodies{i} = rigidBody(['body' num2str(i)]);
    joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    setFixedTransform(joints{i},dhparams(i,:),"dh");
    bodies{i}.Joint = joints{i};
    if i == 1 % Add first body to base
        addBody(bx2002x,bodies{i},"base")
    else % Add current body to previous body by name
        addBody(bx2002x,bodies{i},bodies{i-1}.Name)
    end
end

showdetails(bx2002x)

figure(Name="BX200X")
show(bx2002x);

%%
randConfig = bx2002x.randomConfiguration;
tform = getTransform(bx2002x,randConfig,'body6','base');


show(bx2002x,randConfig)

%%
ik = inverseKinematics('RigidBodyTree',bx2002x);
weights = [0.25 0.25 0.25 1 1 1];
initialguess = bx2002x.homeConfiguration


[configSoln,solnInfo] = ik('body6',tform,weights,initialguess);
show(bx2002x,configSoln)
tform2 = getTransform(bx2002x,configSoln,'body6','base');

