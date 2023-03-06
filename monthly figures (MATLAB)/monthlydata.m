time1 = ts(sealevel);
time2 = ts(minsealevel);
time3 = ts(maxsealevel);
time1.Name = 'Monthly Sea Level';
time1.TimeInfo.Units = 'months';
time1.TimeInfo.StartDate = '31-Mar-1993';     
time1.TimeInfo.Format = 'mmm, yy';      
time1.Time = time1.Time - time1.Time(1);  

time4 = ts(meanairtemp);
time5 = ts(maxairtemp);
time6 = ts(minairtemp);
time4.Name = 'Monthly Air Temperature';
time4.TimeInfo.Units = 'months';
time4.TimeInfo.StartDate = '31-Mar-1993';     
time4.TimeInfo.Format = 'mmm, yy';      
time4.Time = time4.Time - time4.Time(1);  

time7 = ts(meanwatertemp);
time8 = ts(maxwatertemp);
time9 = ts(minwatertemp);
time7.Name = 'Monthly Water Temperature';
time7.TimeInfo.Units = 'months';
time7.TimeInfo.StartDate = '31-Mar-1993';     
time7.TimeInfo.Format = 'mmm, yy';      
time7.Time = time7.Time - time7.Time(1);  


figure(1)
plot(time1, "k")
hold on
plot(time2, "MarkerFaceColor", '#0072BD')
hold on
plot(time3, "MarkerFaceColor", '#A2142F')
legend("mean", "min", "max")
ylabel("sea level (m)")
xlabel("time")

figure(2)
plot(time4, "k")
hold on
plot(time5, "MarkerFaceColor", '#0072BD')
hold on
plot(time6, "MarkerFaceColor", '#A2142F')
legend("mean", "max", "min")
ylabel("air temperature (oC)")
xlabel("time")

figure(3)
plot(time7, "k")
hold on
plot(time8, "MarkerFaceColor", '#0072BD')
hold on
plot(time9, "MarkerFaceColor", '#A2142F')
legend("mean", "max", "min")
ylabel("water temperature (oC)")
xlabel("time")
%%
function time = ts(x)
    y = table2array(x);
    y = rmmissing(y);
    time = timeseries(y, 1:length(y));
    time.Name = 'Monthly';
    time.TimeInfo.Units = 'months';
    time.TimeInfo.StartDate = '31-Mar-1993';     
    time.TimeInfo.Format = 'mmm, yy'; 
    time.Time = time.Time - time.Time(1); 
end