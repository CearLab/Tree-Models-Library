function h=DrawCylinderN(Position,Vector,Radius,Color) %N - direction vector, r - radius, l - length, Pos - ?, c - color
Length=norm(Vector);
[X,Y,Z]=cylinder(Radius,10);
Z=Z*Length;
t=atan2(Vector(2),Vector(1));
f=acos(Vector(3)/Length);
cf=cos(f); sf=sin(f);
ct=cos(t); st=sin(t);
R1=[cf    0    sf;
        0     1     0;
       -sf   0   cf];
R2=[ct   -st   0;
        st   ct   0;
         0    0    1];
R=R2*R1;
C1=R*[X(1,:); Y(1,:); Z(1,:)];
C2=R*[X(2,:); Y(2,:); Z(2,:)];
X=[C1(1,:); C2(1,:)]+Position(1);
Y=[C1(2,:); C2(2,:)]+Position(2);
Z=[C1(3,:); C2(3,:)]+Position(3);
h=surf(X,Y,Z,'FaceColor',Color,'EdgeColor','none');%[0.9 0.5 0.2]