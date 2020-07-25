function [Yp,Ypi]=PipeBC(Yp,Ypi,Qt);
Yp(end)=Ypi(end); % Base of pipe temperature condition
Ypi(1)=Qt; % Top of pipe temperature condition
end