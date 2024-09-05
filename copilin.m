function L= copilin(linea, matriz)

[P1, P2] = extrae(linea);

L = crealin(matriz*P1,matriz*P2,linea.Color);
