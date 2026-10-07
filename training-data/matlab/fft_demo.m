fs = 100;
t = (0:fs-1) / fs;
signal = sin(2*pi*5*t) + 0.5 * sin(2*pi*20*t);

N = numel(signal);
Y = fft(signal);
mag = abs(Y) / N * 2;
freqs = (0:N-1) * fs / N;

[~, order] = sort(mag(1:N/2), 'descend');
for k = 1:2
    fprintf('freq %.1f Hz amplitude %.2f\n', freqs(order(k)), mag(order(k)));
end

recovered = real(ifft(Y));
fprintf('max reconstruction error: %.2e\n', max(abs(recovered - signal)));

disp(abs(fft([1 0 0 0])))
disp(real(fft([1 1 1 1])))

% circular convolution via the FFT
a = [1 2 3 0];
b = [1 1 0 0];
c = real(ifft(fft(a) .* fft(b)));
disp(round(c))

filtered = Y;
filtered(10:N-10) = 0;
low = real(ifft(filtered));
fprintf('low-pass energy ratio: %.2f\n', sum(low.^2) / sum(signal.^2));
