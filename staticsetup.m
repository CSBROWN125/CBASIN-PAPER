function [Ypro,Ypro1,Ypro2,Fsp,Yg,Yp,Ypi,Ypipe,Ypipein1]=staticsetup(sT,TGp,Sp,xl)
Ypro=linspace(10,sT + ( ((TGp*Sp).*(xl+10))),xl+1+10);%initial temperature profile
Ypro1=repmat(Ypro,21,1,21);%extending to 3d
Ypro2=permute(Ypro1,[1,3,2]);
Fsp=Ypro2;
Ypro=Ypro(1:141); %1d line source component 
Yg=Ypro;% 1d grout
Yp=Yg; %1d pipe in
Ypi=Yp;%1d pipe out
Ypipe=sT;
Ypipein1=sT;
end
