% 2.(a)
Ts = 0.001;
fs = 1000;
f1 = 100;

x1 = zeros(1, 1000);
for i = 1:1000
    x1(i) = cos(2*pi*(i-1)*Ts) + 2*cos(2*pi*f1*(i-1)*Ts);
end
figure
subplot(3, 1, 1), plot(x1), title('x[n]')

% 2.(b)
L = 8;
fc = 42.5/(fs/2);

[b, a] = butter(L, fc);
b
a
y = filter(b, a, x1);
subplot(3, 1, 2), plot(y), title('y[n] lowpass')

% 2.(c)
L = 8;
fL = 42.5/(fs/2);
fH = 250/(fs/2);

[b, a] = butter(L, [fL, fH]);
b
a
y = filter(b, a, x1);
subplot(3, 1, 3), plot(y), title('y[n] bandpass')