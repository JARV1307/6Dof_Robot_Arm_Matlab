function T = dircin_gen(robot, q1, MH1, MH2)

N = length(q1);
A = eye(4);

A = A*MH1;

for i=1:N
    A = DH(robot, i, q1(i))*A;
end

A = A*MH2;

T = A;