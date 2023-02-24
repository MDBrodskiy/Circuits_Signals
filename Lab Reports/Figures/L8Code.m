%{
daq.getDevices()
s = daq.createSession("ni");
ch = addAnalogInputChannel(s, "Dev5", "ai0", "Voltage");

sub = ch.Device.Subsystems;
s.Rate = 1000;
s.NumberOfScans = 2000;
data1k = s.startForeground();
%figure;
%plot(data, ".-");

dt = 1/s.Rate;
t_end = double(s.NumberOfScans) * dt;
time = [dt:dt:t_end];
figure;
plot(time, data20k, "r.-");
xlabel("Time(s)");
ylabel("Input Signal (V)");
title("20kHz Sound Sample");
%}
%soundsc(data20k, 20000);
%soundsc(data5k, 5000);
soundsc(data3k, 3000);
%soundsc(data1k, 1000);
%soundsc(data20k, 20000);

