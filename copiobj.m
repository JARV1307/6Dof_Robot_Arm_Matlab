function ob = copiobj(objeto, matriz)

ob = zeros(length(objeto), 1); 

for i = 1:length(objeto)
    ob(i)=copilin(objeto(i),matriz);

end
