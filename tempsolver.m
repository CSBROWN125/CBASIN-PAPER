function[Fsp,Ypro]=tempsolver(Fsp,S,Sp,Db,ts,xl);
    x=21;
    y=21;
    z=141+10;
    i=1:x;
    j=1:y;
    k=1:z;
    arbgrad(j,i,k)=6*del2(Fsp(j,i,k),S,S,Sp);
    Fsp= Fsp+ ts.*Db.*(arbgrad);
    %remove data from 3D to solve 1D at subsequent TS
    F1=Fsp(11,11,:);
    F2=[F1];
    Ypro(1:xl+1)=F1(1:xl+1);
end