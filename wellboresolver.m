function [Yp,Ypi,Yg,Ypro,Ypro2] = wellboresolver(Ypro1,Ypi,Yg,Yp,Ypro,Sp,xl,ts,Df,Dg,Db,ui,u,bpg,bpi,bsg,dVpi,dVp,dVg,dVs,cf,pf,cg,pg,cb,pb,dSio,dSig,dSsg)
i=1:xl; %solve 1d nodes
Yp(i)=Yp(i)+ts.*((abs(4.*Df.*(del2(Yp(i),Sp)))-(((u)).*((Yp(i)-Yp(i+1))./Sp))+(((bpi)./(dVp.*cf.*pf)).*(Ypi(i)-Yp(i)).*dSio)));
i=2:xl+1;
Ypi(i)=Ypi(i)+ts.*((abs(4.*Df.*(del2(Ypi(i),Sp)))+(((ui)).*((Ypi(i-1)-Ypi(i))./Sp))+(((bpg)./(dVpi.*cf.*pf)).*(Yg(i)-Ypi(i)).*dSig)+(((bpi)./(dVpi.*cf.*pf)).*(Yp(i)-Ypi(i)).*dSio)));
i=1:xl+1;
Yg(i)=Yg(i)+ts.*(((4.*Dg.*(del2(Yg(i),Sp)))+((((bpg)./(dVg.*cg.*pg)).*(Ypi(i)-Yg(i)).*dSig)+((bsg./(pg.*cg*dVg)).*(Ypro(i)-Yg(i)).*dSsg))));
Ypro(i)=Ypro(i)+ts.*(((((bsg)./(dVs.*cb*pb)).*(Yg(i)-Ypro(i)).*dSsg)));
Ypro1=repmat(Ypro,21,1,21);% transform 1D nodes of rock to 3D
Ypro2=permute(Ypro1,[1,3,2]);
end