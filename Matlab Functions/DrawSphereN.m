function h=DrawSphereN(Position,DirVector,Color) %N - direction vector, r - radius, l - length, Pos - ?, c - color
Length=norm(DirVector);
Radius=Length/3;
x=linspace(0,Length,10);
[X,Y,Z]=cylinder(sqrt(Radius^2-((x-Length/2)*2*Radius/Length).^2+0.00001),10);
Z=Z*Length;

t=atan2(DirVector(2),DirVector(1));
Nn=norm(DirVector);
f=acos(DirVector(3)/Nn);
cf=cos(f); sf=sin(f);
ct=cos(t); st=sin(t);
R1=[cf    0    sf;
        0     1     0;
       -sf   0   cf];
R2=[ct   -st   0;
        st   ct   0;
         0    0    1];
R=R2*R1;
for i=1:10
    for j=1:11
        c=[X(i,j); Y(i,j); Z(i,j)];
        w=R*c+Position';
        X(i,j)=w(1);
        Y(i,j)=w(2);
        Z(i,j)=w(3);
    end
end
% C1=R*[X(1,:); Y(1,:); Z(1,:)];
% C2=R*[X(2,:); Y(2,:); Z(2,:)];
% X=[C1(1,:); C2(1,:)]+Position(1);
% Y=[C1(2,:); C2(2,:)]+Position(2);
% Z=[C1(3,:); C2(3,:)]+Position(3);
h=surf(X,Y,Z,'FaceColor',Color,'EdgeColor','none');%[0.9 0.5 0.2]
