% Para el robot dado y la posición dada devuelve:
%       1. Origenes: los vectores de posición de los orígenes de los 
%          s.c.r asociados a los elementos con respecto al s.c.r de la
%          base.
%       2. Vectores: Los vectores que unen los orígenes sucesivos.
%       3. Zetas: los vectores de los ejes "z"  de los s.c.r asociados a 
%       los elementos con respecto al s.c.r de la base.


function [Origenes Vectores Zetas]=Encontrar_Origenes(robot,q)


n = size(robot,1)-1;

    P=[]';
    Origenes=[];
    Vectores=[];
    Zetas=[];
     
 	if length(q) == n,


mth=eye(4); 

         Origenes=mth(1:3,4);
         Zeta=mth(1:3,3);
         Zetas=Zeta;
         
         		for i=1:n,
%Propagación de las mth
%mth del extremo del link i con respecto al origen
            mth=mth*DH(robot,i,q(i));
%extraemos traslación del punto final de link i
            P=mth(1:3,4);
%extraemos vector unitario en Z del link i
            Zeta=mth(1:3,3);
            
            Origenes=[Origenes P];
            Zetas=[Zetas Zeta];
%vector del extremo del extremo del link i-1 al extremo del link i   
%(i=0->link fijo = base, i!=0->link movil) 
            temp=Origenes(:,i+1)-Origenes(:,i);
            Vectores=[Vectores temp]; 
                end       
    end