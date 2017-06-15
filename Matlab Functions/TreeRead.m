function Tree=TreeRead(FileName,DrawFlag)
fid = fopen(FileName);

Tree.BranchN=fscanf(fid,'%i',1);
Tree.BranchPos=zeros(Tree.BranchN,3);
Tree.BranchVec=zeros(Tree.BranchN,3);
Tree.BranchR=zeros(1,Tree.BranchN);
for i=1:Tree.BranchN
    s=fscanf(fid,'%g',7);
    Tree.BranchPos(i,:)=s(1:3);
    Tree.BranchVec(i,:)=s(4:6);
    Tree.BranchR(i)=s(7);
end
    
Tree.FruitN=fscanf(fid,'%i',1);
Tree.FruitPos=zeros(Tree.FruitN,3);
Tree.FruitVec=zeros(Tree.FruitN,3);
Tree.FruitR=zeros(1,Tree.FruitN);
for i=1:Tree.FruitN
    s=fscanf(fid,'%g',7);
    Tree.FruitPos(i,:)=s(1:3);
    Tree.FruitVec(i,:)=s(4:6);
    Tree.FruitR(i)=s(7);
end

Tree.TrellisN=0;
fclose(fid);

if DrawFlag
    hold on; axis equal; grid on; cla;
    DrawTree(Tree,[0.5 0.25 0],[1 0 0]);
    view(20,20);
    rotate3d on;
end
