% Crea un punto-matriz colinear con el sistema de
% coordenadas de origen a partir del vector de posición dado.

function matriz=punto(vector)

	matriz=[eye(3) vector;0 0 0 1];
