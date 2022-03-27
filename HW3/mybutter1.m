% 1.(a)
Ts = 1/20;
fs = 20;

x1 = zeros(1, 100);
for i = 1:100
    x1(i) = cos(2*pi*(i-1)*Ts);
end
figure
plot(x1), title('x[n]')

% 1.(b)
L = 3;
fc = 0.02;

[b, a] = butter(L, fc);
b
a
[H, w] = freqz(b, a);
figure('Renderer', 'painters', 'Position', [200 10 900 600]);
subplot(3, 3, 1), plot(w, 20*log(abs(H))), title('Magnitude frequency response (b)'), xlim([0, pi]);
subplot(3, 3, 2), plot(w, 360*(angle(H)/(2*pi))), title('Phase frequency response (b)'), xlim([0, pi]);
y = filter(b, a, x1);
subplot(3, 3, 3), plot(y), title('y[n] (b)');

% 1.(c)
L = 5;
fc = 0.02;

[b, a] = butter(L, fc);
b
a
[H, w] = freqz(b, a);
subplot(3, 3, 4), plot(w, 20*log(abs(H))), title('Magnitude frequency response (c)'), xlim([0, pi]);
subplot(3, 3, 5), plot(w, 360*(angle(H)/(2*pi))), title('Phase frequency response (c)'), xlim([0, pi]);
y = filter(b, a, x1);
subplot(3, 3, 6), plot(y), title('y[n] (c)');

% 1.(d)
L = 3;
fc = 0.5;

[b, a] = butter(L, fc);
b
a
[H, w] = freqz(b, a);
subplot(3, 3, 7), plot(w, 20*log(abs(H))), title('Magnitude frequency response (d)'), xlim([0, pi]);
subplot(3, 3, 8), plot(w, 360*(angle(H)/(2*pi))), title('Phase frequency response (d)'), xlim([0, pi]);
y = filter(b, a, x1);
subplot(3, 3, 9), plot(y), title('y[n] (d)');