% Mover robot para dibujar una recta con cinemática inversa.

function recta(robot, P1, P2, tf, intervalo)
    
    sol_q = inversaBX200X(P1);
    ci1 = sol_q;
    rob = crearob(robot, sol_q');

    d = pos(P1)';
    c = zeros(1,3);
    b = 3*(pos(P2)' - pos(P1)')/(tf^2);
    a = (-2*b)/(3*tf);
    q1 = pos(P1)';

    t = intervalo;
    while (t<=tf)
        q2 = a*t^3 + b*t^2 + c*t + d;
        T_q = [eye(3), q2'; zeros(1,4)];
        sol_q = inversaBX200X(T_q);
        ci2 = sol_q(1,:);
        trayectoria = gentray(ci1', ci2', intervalo);
        dibrob(robot, rob, trayectoria);
        pause(intervalo);
        crealin([eye(3), q1'; zeros(1,4)], [eye(3), q2'; zeros(1,4)], 'black');
        ci1 = ci2;
        q1 = q2;
        t = t + intervalo;
    end
end