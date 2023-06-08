function m = morlet(Fc, Nc, Fs, norm)
    t = getWaveletTimeRange(Fc, Nc, Fs); % get the time range where the wavelet is defined
    a = Fc*sqrt(2*pi); % get morlet constant for the central frequency
    envelope = (a/Nc) * exp( - t.^2 * a^2 * pi  / Nc^2); % generate the envelope/temporal decay
    wavelet = envelope .* exp(1i * 2*pi*Fc * t);
    m = normalize(wavelet, envelope, norm, Fc);
end
