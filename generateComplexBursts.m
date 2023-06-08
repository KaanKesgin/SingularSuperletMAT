function y = generateComplexBursts(duration, numPackets, freqs, cLen, amp, Fs)
        t = 0:1/Fs:duration;
        y = zeros(1, length(t), 'single');
        
        for i = 1:numPackets
            burstFrequency = datasample(freqs,1); %randomly sample from the given frequency range
            burstDuration = datasample(cLen,1)*floor(Fs/burstFrequency); %generate a random duration with respect to number of cycles
        
            while burstDuration>=length(t) % perform the operation again if anything exceeds the duration
                burstFrequency = datasample(freqs,1);
                burstDuration  = datasample(cLen,1)*floor(Fs/burstFrequency);
            end
        
            burstStart = datasample(1:length(t)-burstDuration,1); %make sure the starting point for the burst does not cause exeeding the duration of the signal
            burst = datasample(amp,1)*sin(2*pi*burstFrequency*t); %create the burst
            burst = burst(burstStart:burstStart+burstDuration-1);
            y(:, burstStart:burstStart+burstDuration-1) = burst + y(burstStart:burstStart+burstDuration-1);% sum the burst to the data
        
        end

end
