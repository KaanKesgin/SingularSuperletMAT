function ss = singularSuperlet(Fc, Nc, Fs, norm)
    t = getWaveletTimeRange(Fc, Nc, Fs); % get the time range where the wavelet is defined
    timeCancelFactor = 1/(Nc/(2*Fc))^2;
    envelope =  ( -log(timeCancelFactor * (t).^2 ) ) .* exp( -(timeCancelFactor * t.^2 ).^( 2*log(Nc) )  ) ;
    wavelet = envelope .* exp(1i * 2*pi*Fc * t);
    ss = normalize(wavelet, envelope, norm, Fc);
end
