function [nt]=timesteps(ts)
nt = ((60*60*24.*30*4))./ts; %for 4 months
nt=round(nt);
end