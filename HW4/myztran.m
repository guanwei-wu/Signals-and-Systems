figure
set(gcf,'unit','normalized','position',[0,0,0.9,1.8]);

label = zeros(1, 21);
for j = 1:21
    label(j) = j - 1;
end

b = [0.5, 0.5, -0.375, -0.25, 0.125];
a = [1, -1, 0.57, -0.148, 0.02];

% (a)
subplot(3, 3, 1), zplane(b, a), title('zplane');

[r, p, k] = residuez(b, a);
[rp_l, rp_w] = size(r);
[k_l, k_w] = size(k);
h = zeros(1, 21);
for n = 1:21
    for j = 1:rp_l
        h(n) = h(n) + r(j)*p(j)^(n-1);
    end
    if n<=k_l
        h(n) = h(n) + k(n);
    end
end

% (b)
subplot(3, 3, 2), stem(label, h), title('h[n]');

[H, w] = freqz(b, a);

% (c)
subplot(3, 3, 3), plot(w, 20*log(abs(H))), title('Magnitude frequency response'), xlim([0, pi]);
subplot(3, 3, 4), plot(w, 360*(angle(H)/(2*pi))), title('Phase frequency response'), xlim([0, pi]);

% (d)
[z, p, k] = tf2zp(b, a);
sos = zp2sos(z, p, k);
sos

b1 = sos(1:1,1:3);
b2 = sos(2:2,1:3);
a1 = sos(1:1,4:6);
a2 = sos(2:2,4:6);
[H1, w1] = freqz(b1, a1);
[H2, w2] = freqz(b2, a2);

% (e)
subplot(3, 3, 5), plot(w1, 20*log(abs(H1))), title('Magnitude frequency response 1'), xlim([0, pi]);
subplot(3, 3, 6), plot(w2, 20*log(abs(H2))), title('Magnitude frequency response 2'), xlim([0, pi]);
subplot(3, 3, 7), plot(w1, 20*log(abs(H1).*abs(H2))), title('Magnitude frequency response 1*2'), xlim([0, pi]);

del = zeros(1, 21);
del(1) = 1;

% (f)
y = filter(b, a, del);
subplot(3, 3, 8), stem(label, y), title('y[n]');