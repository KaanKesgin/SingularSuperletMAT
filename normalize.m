function normed = normalize(wavelet, envelope, norm, Fc)

    if norm == "modulus-integral"
        normed = wavelet / sum( abs(envelope) );
    elseif norm=="unit"
        normed = wavelet / max( abs(envelope) );
    elseif norm=="frequency-sqrt"
        normed = wavelet * sqrt(Fc) / sum( abs(envelope) );
    elseif norm=="frequency-square"
        normed = wavelet * Fc / sum( abs(envelope) );
    elseif norm=="energy"
        normed = wavelet / sum( abs(envelope).^2 );
    else %if norm is given none of the options above, still return modulus integral
        normed = wavelet / sum( abs(envelope) );
    end

end