function [q] = gentray(qi, qf, tf)


d = qi';
c = zeros(size(d));
b = 3*(qf' - d);
a = 1/3 * (-2*b - c);

q = [];

m = 1;
for t = 0:0.1:tf
    q(m,1:6) = a*t^3 + b*t^2 + c*t + d;
    m = m + 1;  
end