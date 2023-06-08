format long

%parameters for generating complex bursts
numPackets = 50;          % generate numPackets amount of randomly positioned random bursts
duration   = 0.05;        % for the total duration of duration (in seconds)
freqs      = 1:1500;      % with frequencies sampled from freqs (in Hz)
cLen       = 1:5;         % number of cycles sampled from cLen
amp        = 1:5;         % amplitudes sampled from amp
Fs         = 30000;       % sampling rate of the input data (Hz)

%generate the data based on parameters above or load your own data
y = generateComplexBursts(duration, numPackets, freqs, cLen, amp, Fs);

% parameters for time frequency analysis
frange    = 1:1:2000;        % frequency range of interest for performing the time frequency decomposition
norm      = "frequency-sqrt";% normalization to be used
step      = 250;             % adaptive parameter for numbe r of cycles increment per frequency band
baseCycle = 3;               % number of baseline cycles to build the adaptive increments on 

% perform time frequency decomposition
sstRez = sst(y, frange, Fs, baseCycle, norm, step); % perform sst
cwtRez = cwt(y, frange, Fs, baseCycle, norm, step); % perform cwt for comparison with the same parameters

% plot things
t = 1/Fs:1/Fs:length(y)/Fs; % time variable for plotting the time data (in seconds)

%plot time data
subplot(3,1,1);
plot(1000*t,y)
xlim([t(1) 1000*t(end)])
xlabel("time (ms)")
title("time signal")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot sst
subplot(3,1,2);
heatmap(t, frange, sstRez', 'Colormap', jet)
ylabel("frequency (Hz)")
xlabel("time (ms)")
title("sst")

grid off
%do a whole bunch of nonsense to make matlab not show a thousand ticks with thousand labels in the x and y axis
showEveryX = floor(length(t)/10); %show 10 ticks in x axis
XLabels = 1:length(t);
CustomXLabels = string(1000*t); %multiplied with 1000 here to show in terms of milliseconds
CustomXLabels(mod(XLabels,showEveryX) ~= 0) = " "; %makes it show every 10th label
set(gca,'XDisplayLabels',CustomXLabels)

showEveryY = floor(length(frange)/10); %show 10 ticks in y axis
YLabels = 1:length(frange);
CustomYLabels = string(frange);
CustomYLabels(mod(YLabels,showEveryY) ~= 0) = " "; %makes it show every 10th label
set(gca,'YDisplayLabels',CustomYLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot cwt
subplot(3,1,3);
heatmap(t, frange, cwtRez', 'Colormap', jet)
ylabel("frequency (Hz)")
xlabel("time (ms)")
title("cwt")

grid off
%do a whole bunch of nonsense to make matlab not show a thousand ticks with thousand labels in the x and y axis
set(gca,'XDisplayLabels',CustomXLabels)
set(gca,'YDisplayLabels',CustomYLabels)



