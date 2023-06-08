function scalogram = cwt(y, frange, Fs, baseCycle, norm, step)
        N = length(y);      % get N points from the input data and
        M = length(frange); % M frequency points for correct number of points operations
        scalogram = zeros(N, M, 'single'); % N points in time, M points in frequency
        
        for i = 1:M
            o = 1 + frange(i)/step; % number of cycles increase factor per frequency
            w = morlet(frange(i), baseCycle*o, Fs, norm); % generate the wavelet
            scalogram(:,i) =  2 * abs( conv(y,w,'same').^2 ); % apply convolution operation and correct for the resultant size
        end

end

 % generate the wavelet

