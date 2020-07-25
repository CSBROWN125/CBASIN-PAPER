function myplot(Ypipe,Ypipein1,nt,ts)
time=linspace(0,((nt*ts)./(60*60*24)),(nt));
figure
hold all
plot(time,Ypipe,'r-')
plot(time,Ypipein1,'b--')
ylim([0 50])
xlabel('Time (days)')
ylabel('Temperature (°C)')
end