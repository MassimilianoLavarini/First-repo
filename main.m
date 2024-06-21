clc;
clear all;
close all;

%%
data_GPS = readtable("File_Telemetry(csv)/GH010107_Hero7 Black-GPS5.csv");
data_acc = readtable("File_Telemetry(csv)/GH010108_Hero7 Black-ACCL.csv");

origin = [data_GPS.GPS_Lat___deg_(1), data_GPS.GPS_Long___deg_(1), data_GPS.GPS_Alt___m_(1)];
[x,y,z] = latlon2local(data_GPS.GPS_Lat___deg_, data_GPS.GPS_Long___deg_, data_GPS.GPS_Alt___m_, origin);

%%
v_filt = lowpass(data_GPS.GPS_2DSpeed__m_s_ ,1,200);
v3_filt = lowpass(data_GPS.GPS_3DSpeed__m_s_ ,1,200);

figure
plot(data_GPS.cts*1000,3.6*v_filt)
hold on
plot(data_GPS.cts*1000,3.6*data_GPS.GPS_2DSpeed__m_s_)
xlabel('time [s]')
ylabel('speed [km/h]')

figure
plot(data_GPS.cts,acc)

%%
Ts_acc=mean(diff(data_acc.cts))/1000;
fs_acc = 1/Ts_acc;

Ts_gps=mean(diff(data_GPS.cts))/1000;
fs_gps = 1/Ts_gps;

axG = lowpass(data_acc.Accelerometer_x__m_s2_,0.1,200);
ayG = lowpass(data_acc.Accelerometer_y__m_s2_,0.1,200);
azG = lowpass(data_acc.Accelerometer_z__m_s2_,0.1,200);

% figure
% hold on
% plot(data_acc.cts,axG)
% plot(data_acc.cts,ayG)
% plot(data_acc.cts,azG)

%%
for i =2:length(v_filt)
    acc(i) = (v_filt(i)-v_filt(i-1))/Ts_gps;
end
%%
figure
plot3(ayG,axG,azG,'LineStyle','none','Marker','.')
view(2)
% hold on
% plot(data_acc.Accelerometer_y__m_s2_,data_acc.Accelerometer_x__m_s2_)

%%
figure
plot3( x,y,z )
axis equal
