function t = getWaveletTimeRange(Fc, Nc, Fs)
    resolution = abs(floor(log10(1/Fs)))-2;
    tEdge = round(Nc/(2*Fc), resolution)*2.0;
    tRange = -tEdge:1/Fs:tEdge;
    t = tRange + (45e-2)/Fs;
end
