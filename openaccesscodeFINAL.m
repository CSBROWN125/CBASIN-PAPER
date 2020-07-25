%% %%%%%%%%% BROWNETALMODEL %%%%%%%%%% %%
%%%% Model to solve deep coaxial BHE %%%%
%%%%%%%%% Method FD explicit %%%%%%%%%%%%
%%%%%%%%%%% Author: C.S.BROWN %%%%%%%%%%%
%%%% LINK TO G.SCHOLAR PROFILE BELOW %%%%
% https://scholar.google.co.uk/citations?user=BsHF5xAAAAAJ&hl=en&oi=sra 
% Data available upon reasonable request %

% NOTES: 
% 1) need to apply specific BC desired 
% 2) for longer sims need to expand mesh so no BC interactions 


clc;clear
%% Determining time step
ts=10;
nt=timesteps(ts);

%% Parameter Input
[pb,cb,pf,cf,Kf,K,sT,Tg,S,Qt,Kg,pg,cg,ri,rip,ro,rio,rg,ri2,u,HH,ui,HH2,big,rgs,bgs,rig,bpg,Sp,bpi,bsg,dSio,dSig,dSsg,dss,dVp,dVpi,dVg,dVs,TGp,xl,Df,Dg,Db]=loaddata;

%% Temperature profile set up
[Ypro,Ypro1,Ypro2,Fsp,Yg,Yp,Ypi,Ypipe,Ypipein1]=staticsetup(sT,TGp,Sp,xl);

%% Dynamic simulation
for it = 1:nt;
    %boundary conditions for 1D WB
    [Yp,Ypi]=PipeBC(Yp,Ypi,Qt);    

    %solve 1D wellbore
    [Yp,Ypi,Yg,Ypro,Ypro2] = wellboresolver(Ypro1,Ypi,Yg,Yp,Ypro,Sp,xl,ts,Df,Dg,Db,ui,u,bpg,bpi,bsg,dVpi,dVp,dVg,dVs,cf,pf,cg,pg,cb,pb,dSio,dSig,dSsg);
    Fsp(11,11,1:xl+1)=Ypro2(1,1,1:xl+1);
    
    %solve 3D temperature grid
    [Fsp,Ypro]=tempsolver(Fsp,S,Sp,Db,ts,xl);
    
    %store parameters
    [Ypipe,Ypipein1]=storeparam(Ypipe,Ypipein1,Yp,Ypi,it);
end
myplot(Ypipe,Ypipein1,nt,ts)
