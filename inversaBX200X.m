function [q_invK_codoarriba, q_invK_codoarriba2, q_invK_codoabajo, q_invK_codoabajo2, q_invK_codoarriba_or2, q_invK_codoarriba_or2_2, q_invK_codoabajo_or2, q_invK_codoabajo_or2_2]=inversaBX200X(matriz)

BX200X


%obtener expresion simbolica para matriz rotacion rot_3_6
%para definir las relaciones angulares

syms q1sym
syms q2sym
syms q3sym
syms q4sym
syms q5sym
syms q6sym

q_sym=[q1sym,q2sym,q3sym,q4sym,q5sym,q6sym];


    %   alpha    a    d    theta tipo  xi  yi  zi  xf  yf  zf   R   G   B
r2_sym=[   0     0    0     0     0    0   0   0   0   0   0    1   0   1;
    pi/2   210  670    q1sym     0  -210 -670 0   0   0   0    0   1   1;
   0   sqrt((1370)^(2)+(185^2))  0    q2sym    0  -sqrt((1370)^(2)+(185^2))  0   0   0   0   0    0   0  0.9;
   pi/2   0    0   q3sym    0    0   0   0   0   0  0   0   1   0;
  pi/2    0     1950    q4sym     0    0  -1950  0   0   0   0    1   0   0
   pi/2     0    0     q5sym     0    0   0   0   0   0  100  0.5 0.5  0;
     0      0   245    q6sym     0    0   0 -245  0   0   0   0.6 0.5 0.8];


for i=1:length(q_sym);

    if i==1
    A01 = DH(r2_sym,i,q_sym(i));

    elseif i==2
    A12 = DH(r2_sym,i,q_sym(i));
    
    elseif i==3
    A23 = DH(r2_sym,i,q_sym(i));

    elseif i==4
    A34 = DH(r2_sym,i,q_sym(i));

    elseif i==5
    A45 = DH(r2_sym,i,q_sym(i)); 

    elseif i==6
    A56 = DH(r2_sym,i,q_sym(i));   

    end

end

rot_3_6_sym = A34*A45*A56;
rot_3_6_sym=rot_3_6_sym(1:3,1:3);

M6=matriz;%matriz de transformacion homogenea que relaciona la herramienta con la base del robot

p_6=pos(M6);%posicion deseada de la herramienta

z_6=zeta(M6);

rot_6=rotacion(M6);%rotacion deseada de la herramienta 

p_muneca=p_6-rot_6*[0; 0; 245];%posicion de la muneca

pm_x=p_muneca(1,:);
pm_y=p_muneca(2,:);
pm_z=p_muneca(3,:);


%orientacion

%q1
q1_1=atan(pm_y/pm_x);%orientacion2

q1_2=q1_1+pi;%orientacion1


q1=[q1_1,q1_2];

%%distancia de r con orientacion 1

%q2
r=sqrt(pm_x^(2)+pm_y^(2));

r1=r-210;

s=sqrt(r1^(2)+(pm_z-670)^(2));

l_2=sqrt((1370)^(2)+(185^2));

l_3=1950;

alpha1=atan((pm_z-670)/r1);

beta1=acos((l_2^(2)+s^(2)-l_3^(2))/(2*l_2*s));

angulob=pi-atan(670/210)-90;

q_2_1=beta1+alpha1;%codo arriba
q_2_2=-beta1+alpha1;%codo abajo


%q3
gamma1=acos((l_2^(2)-s^(2)+l_3^(2))/(2*l_3*l_2));
q_3_1=gamma1-pi/2;%codo arriba
q_3_2=-gamma1-pi/2;%codo abajo


%desacoplo

%%con codo arriba

matriz_0_3_arriba=dircin(r2,[q1_2,q_2_1,q_3_1]);

rot_0_3_arriba=rotacion(matriz_0_3_arriba);

rot_3_6_arriba=rot_0_3_arriba'*rot_6;%matriz de rotacion r de 3 a 6

q_5_arriba=solve(rot_3_6_sym(3,3)==rot_3_6_arriba(3,3),q5sym);

%q_5=-acos(rot_3_6(3,3))
q_5_1_arriba=q_5_arriba(1);
q_5_2_arriba=q_5_arriba(2);


q_4_arriba=solve(rot_3_6_sym(2,3)/rot_3_6_sym(1,3)==rot_3_6_arriba(2,3)/rot_3_6_arriba(1,3),q4sym,Real=true);
%q_4=atan(rot_3_6(2,3)/rot_3_6(1,3))
q_4_1_arriba=q_4_arriba(1);
q_4_2_arriba=q_4_arriba(2);

q_6_arriba=solve(rot_3_6_sym(3,2)/rot_3_6_sym(3,1)==rot_3_6_arriba(3,2)/rot_3_6_arriba(3,1),q6sym,Real=true);
q_6_1_arriba=q_6_arriba(1);
q_6_2_arriba=q_6_arriba(1);



%con codo abajo

matriz_0_3_abajo=dircin(r2,[q1_2,q_2_2,q_3_2]);

rot_0_3_abajo=rotacion(matriz_0_3_abajo);

rot_3_6_abajo=rot_0_3_abajo'*rot_6; %esta bien

q_5_abajo=solve(rot_3_6_sym(3,3)==rot_3_6_abajo(3,3),q5sym);

%q_5=-acos(rot_3_6(3,3))
q_5_1_abajo=q_5_abajo(1);
q_5_2_abajo=q_5_abajo(2);


q_4_abajo=solve(rot_3_6_sym(2,3)/rot_3_6_sym(1,3)==rot_3_6_abajo(2,3)/rot_3_6_abajo(1,3),q4sym,Real=true);
%q_4=atan(rot_3_6(2,3)/rot_3_6(1,3))
q_4_1_abajo=q_4_abajo(1);
q_4_2_abajo=q_4_abajo(2);

q_6_abajo=solve(rot_3_6_sym(3,2)/rot_3_6_sym(3,1)==rot_3_6_abajo(3,2)/rot_3_6_abajo(3,1),q6sym,Real=true);
q_6_1_abajo=q_6_abajo(1);
q_6_2_abajo=q_6_abajo(1);



q_invK_codoarriba=[q1_1,q_2_1,q_3_1,q_4_1_arriba,q_5_1_arriba,q_6_1_arriba];
q_invK_codoarriba2=[q1_1,q_2_1,q_3_1,q_4_2_arriba,q_5_2_arriba,q_6_2_arriba];
q_invK_codoabajo=[q1_1,q_2_2,q_3_2,q_4_1_abajo,q_5_1_abajo,q_6_1_abajo];
q_invK_codoabajo2=[q1_1,q_2_2,q_3_2,q_4_2_abajo,q_5_2_abajo,q_6_2_abajo];





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% orientacion 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%distancia de r con orientacion 2

%q2
r=sqrt(pm_x^(2)+pm_y^(2));

r1_orientacion2=r+210;

s_orientacion2=sqrt(r1_orientacion2^(2)+(pm_z-670)^(2));

l_2=sqrt((1370)^(2)+(185^2));

l_3=1950;

alpha1_or2=atan((pm_z-670)/r1_orientacion2);

beta1_or2=acos((l_2^(2)+s_orientacion2^(2)-l_3^(2))/(2*l_2*s_orientacion2));

q_2_1_or2=pi-beta1_or2-alpha1_or2;%codo arriba
q_2_2_or2=pi+beta1_or2-alpha1_or2;%codo abajo


%q3
gamma1_or2=acos((l_2^(2)-s_orientacion2^(2)+l_3^(2))/(2*l_3*l_2));
q_3_1_or2=2*pi-(pi/2)-gamma1_or2;%codo arriba
q_3_2_or2=gamma1_or2-pi/2;%codo abajo


%desacoplo

%con codo arriba

matriz_0_3_arriba_or2=dircin(r2,[q1_1,q_2_1_or2,q_3_1_or2]);

rot_0_3_arriba_or2=rotacion(matriz_0_3_arriba_or2);

rot_3_6_arriba_or2=rot_0_3_arriba_or2'*rot_6; %esta bien

q_5_arriba_or2=solve(rot_3_6_sym(3,3)==rot_3_6_arriba_or2(3,3),q5sym);

%q_5=-acos(rot_3_6(3,3))
q_5_1_arriba_or2=q_5_arriba_or2(1);
q_5_2_arriba_or2=q_5_arriba_or2(2);


q_4_arriba_or2=solve(rot_3_6_sym(2,3)/rot_3_6_sym(1,3)==rot_3_6_arriba_or2(2,3)/rot_3_6_arriba_or2(1,3),q4sym,Real=true);
%q_4=atan(rot_3_6(2,3)/rot_3_6(1,3))
q_4_1_arriba_or2=q_4_arriba_or2(1);
q_4_2_arriba_or2=q_4_arriba_or2(2);

q_6_arriba_or2=solve(rot_3_6_sym(3,2)/rot_3_6_sym(3,1)==rot_3_6_arriba_or2(3,2)/rot_3_6_arriba_or2(3,1),q6sym,Real=true);
q_6_1_arriba_or2=q_6_arriba_or2(1);
q_6_2_arriba_or2=q_6_arriba_or2(1);



%con codo abajo

matriz_0_3_abajo_or2=dircin(r2,[q1_1,q_2_2_or2,q_3_2_or2]);

rot_0_3_abajo_or2=rotacion(matriz_0_3_abajo_or2);

rot_3_6_abajo_or2=rot_0_3_abajo_or2'*rot_6; %esta bien

q_5_abajo_or2=solve(rot_3_6_sym(3,3)==rot_3_6_abajo_or2(3,3),q5sym);

%q_5=-acos(rot_3_6(3,3))
q_5_1_abajo_or2=q_5_abajo_or2(1);
q_5_2_abajo_or2=q_5_abajo_or2(2);


q_4_abajo_or2=solve(rot_3_6_sym(2,3)/rot_3_6_sym(1,3)==rot_3_6_abajo_or2(2,3)/rot_3_6_abajo_or2(1,3),q4sym,Real=true);
%q_4=atan(rot_3_6(2,3)/rot_3_6(1,3))
q_4_1_abajo_or2=q_4_abajo_or2(1);
q_4_2_abajo_or2=q_4_abajo_or2(2);

q_6_abajo_or2=solve(rot_3_6_sym(3,2)/rot_3_6_sym(3,1)==rot_3_6_abajo_or2(3,2)/rot_3_6_abajo_or2(3,1),q6sym,Real=true);
q_6_1_abajo_or2=q_6_abajo_or2(1);
q_6_2_abajo_or2=q_6_abajo_or2(1);



q_invK_codoarriba_or2=[q1_2,q_2_1_or2,q_3_1_or2,q_4_1_arriba_or2,q_5_1_arriba_or2,q_6_1_arriba_or2];
q_invK_codoarriba_or2_2=[q1_2,q_2_1_or2,q_3_1_or2,q_4_2_arriba_or2,q_5_2_arriba_or2,q_6_2_arriba_or2];
q_invK_codoabajo_or2=[q1_2,q_2_2_or2,q_3_2_or2,q_4_2_abajo_or2,q_5_1_abajo_or2,q_6_1_abajo_or2];
q_invK_codoabajo_or2_2=[q1_2,q_2_2_or2,q_3_2_or2,q_4_1_abajo_or2,q_5_2_abajo_or2,q_6_2_abajo_or2];
