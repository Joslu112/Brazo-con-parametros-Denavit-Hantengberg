close all
clear all
clc

 abc = 'Introduce el valor de la distancia del vector uno:\n';
 l1= input(abc);
 
 cba = 'Introduce el valor de la distancia del vector dos:\n';
 l2= input(cba);
 
 abd = 'Introduce el valor de la distancia del vector tres:\n';
 l3= input(abd);
 
 promt = 'Cuanto deseas rotar en grados con respecto a la primera extremidad del brazo :\n';
 angDeg = input(promt);
 angRad = deg2rad(angDeg);
 
 promt = 'Cuanto deseas rotar en grados con respecto a la segunda extremidad del brazo :\n';
 angDeg2 = input(promt);
 angRad2 = deg2rad(angDeg2);
 
 promt = 'Cuanto deseas rotar en grados con respecto a la tercera extremidad del brazo :\n';
 angDeg3 = input(promt);
 angRad3 = deg2rad(angDeg3);
 
 %Definir el p1
 p1=[0 0 0]';
 
 if angDeg>=0
     angVec = 0:0.01:angRad;
 else
      angVec = 0:-0.01:angRad;
 end
 for i=1:length(angVec)
   clf
 grid on
 Imprimir_3_ejes();
 cos(angVec(i))

TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1];
TTz = [1 0 0 0;0 1 0 0; 0 0 1 l1; 0 0 0 1];
T1=TRz1*TTz;
p2=T1(1:3,4);
%Marcos de referencia.
v1x=T1(1:3,1);
v1y=T1(1:3,2);
v1z=T1(1:3,3);

view(150,15)

line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[.9 .9 .1],'linewidth',6)%primer eslabon del brazo
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)


Imprimir_3_ejes();
TRy1 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz1 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRy1*TTz1;
Ta=T1*T2;
p3=Ta(1:3,4);
%Marcos de referencia.
v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);

line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[.1 .9 .9],'linewidth',6)%segundo eslabon del brazo
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(3) v2y(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)

Imprimir_3_ejes();
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);

line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[.9 .3 .4],'linewidth',6)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)


Imprimir_3_ejes();
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;

v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
pause(0.1);
 end
   if angDeg2>=0
 angVec2=0:0.01:angRad2;
 else
     angVec2=0:-0.01:angRad2;
  end
 for i=1:length(angVec2)
   clf
  grid on
 Imprimir_3_ejes();
 p2=T1(1:3,4);
 %primer eslabon del brazo
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[.9 .9 .1],'linewidth',6)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

 Imprimir_3_ejes();
TRy1 = [cos(angVec2(i)) 0 -sin(angVec2(i)) 0;0 1 0 0;sin(angVec2(i)) 0 cos(angVec2(i)) 0;0 0 0 1];
TTz1 = [1 0 0 l2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRy1*TTz1;
Ta=T1*T2;
p3=Ta(1:3,4);
v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);
%imprime linea 2
view(150,15)
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[.1 .9 .9],'linewidth',6)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(3) v2y(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
Imprimir_3_ejes();
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 l3;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);


line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[.9 .3 .4],'linewidth',6)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

Imprimir_3_ejes();
%Marcos de referencia.
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)%segundo eslabon del brazo
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)%segundo eslabon del brazo
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)%segundo eslabon del brazo

pause(0.1);
 end
 if angDeg3>=0
 angVec3=0:0.01:angRad3;
 else
     angVec3=0:-0.01:angRad3;
  end
  
   for i=1:length(angVec3)
   clf
 grid on
 Imprimir_3_ejes();
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[.9 .9 .1],'linewidth',6)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

 p3=Ta(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[.1 .9 .9],'linewidth',6)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
 line([p2(1) v2y(1)],[p2(2) v2y(2)],[p2(3) v2y(3)],'color',[0 1 0],'linewidth',5)
 line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)

Imprimir_3_ejes();
TRy2 = [cos(angVec3(i)) 0 -sin(angVec3(i)) 0;0 1 0 0;sin(angVec3(i)) 0 cos(angVec3(i)) 0;0 0 0 1];
TTz2 = [1 0 0 l3;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
%Marcos de referencia.
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);

view(150,15)
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[.9 .3 .4],'linewidth',6)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

Imprimir_3_ejes();

%Marcos de referencia.
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
pause(0.1);
   end