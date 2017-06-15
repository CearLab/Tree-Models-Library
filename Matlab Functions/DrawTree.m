function DrawTree(Tree,BranchColor,FruitColor)
hold on;

for i=1:Tree.BranchN
    DrawCylinderN(Tree.BranchPos(i,:),Tree.BranchVec(i,:),Tree.BranchR(i),BranchColor);
%         text(Tree.BranchPos(i,1)+Tree.BranchVec(i,2)/2,Tree.BranchPos(i,2)+Tree.BranchVec(i,2)/2,Tree.BranchPos(i,3)+Tree.BranchVec(i,3)/2,num2str(i));
end
for i=1:Tree.TrellisN
    DrawCylinderN(Tree.TrellisPos(i,:),Tree.TrellisVec(i,:),Tree.TrellisR(i),[0 0 1]);
%         text(Tree.BranchPos(i,1)+Tree.BranchVec(i,2)/2,Tree.BranchPos(i,2)+Tree.BranchVec(i,2)/2,Tree.BranchPos(i,3)+Tree.BranchVec(i,3)/2,num2str(i));
end

for i=1:Tree.FruitN
    h=DrawSphereN(Tree.FruitPos(i,:),Tree.FruitVec(i,:),FruitColor);
    set(h,'UserData',num2str(i));
    set(h,'ButtonDownFcn',{@FruitTextButtonDownFcn,Tree});
%     text(Tree.FruitPos(i,1)+Tree.FruitVec(i,1)/2+Tree.FruitR(i),Tree.FruitPos(i,2)+Tree.FruitVec(i,2)/2,Tree.FruitPos(i,3)+Tree.FruitVec(i,3)/2,num2str(i));
end

if Tree.BranchN~=0
    Xmax=max(Tree.BranchPos(:,1)); Xmin=min(Tree.BranchPos(:,1));
    Ymax=max(Tree.BranchPos(:,2)); Ymin=min(Tree.BranchPos(:,2));
else
    Xmax=max(Tree.FruitPos(:,1)); Xmin=min(Tree.FruitPos(:,1));
    Ymax=max(Tree.FruitPos(:,2)); Ymin=min(Tree.FruitPos(:,2));
end
patch([Xmin Xmax Xmax Xmin],[Ymax Ymax Ymin Ymin],[0.75 0.5 0.25]);


legend off; xlabel('X [m]'); ylabel('Y [m]'); zlabel('Z [m]');
axis tight; axis equal;

camlight('headlight'); %view(0,0);

function FruitTextButtonDownFcn(src,evnt,Tree)
Fruit_i=str2num(get(gcbo,'UserData'));
disp(['Fruit ' num2str(Fruit_i)]);
if Tree.BranchN~=0
    x1b=min(Tree.BranchPos(:,1));
    x2b=max(Tree.BranchPos(:,1));
    y1b=min(Tree.BranchPos(:,2));
    y2b=max(Tree.BranchPos(:,2));
    z1b=min(Tree.BranchPos(:,3));
    z2b=max(Tree.BranchPos(:,3));
else
    x1b=0; x2b=0; y1b=0; y2b=0; z1b=0; z2b=0;
end
x1f=0; x2f=0; y1f=0; y2f=0; z1f=0; z2f=0;
if Tree.FruitN~=0
    x1f=min(Tree.FruitPos(:,1));
    x2f=max(Tree.FruitPos(:,1));
    y1f=min(Tree.FruitPos(:,2));
    y2f=max(Tree.FruitPos(:,2));
    z1f=min(Tree.FruitPos(:,3));
    z2f=max(Tree.FruitPos(:,3));
end
x1=min([x1f x1b]); x2=max([x2f x2b]);
y1=min([y1f y1b]); y2=max([y2f y2b]);
z1=min([z1f z1b]); z2=max([z2f z2b]);
dx=x2-x1; dy=y2-y1; dz=z2-z1;
CubeD=max([dx dy dz]);
    
T=Tree.FruitPos(Fruit_i,:);
N=Tree.FruitVec(Fruit_i,:);
x1=T(1)+N(1)/2-CubeD/2; x2=T(1)+N(1)/2+CubeD/2;
y1=T(2)+N(2)/2-CubeD/2; y2=T(2)+N(2)/2+CubeD/2;
z1=T(3)+N(3)/2-CubeD/2; z2=T(3)+N(3)/2+CubeD/2;
axis([x1 x2 y1 y2 z1 z2]);
