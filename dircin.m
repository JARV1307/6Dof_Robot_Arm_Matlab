function T = dircin(robot,q)

N = length(q);

A = eye(4);

for i=1:N
    A = A*DH(robot,i,q(i));
end

T = A;