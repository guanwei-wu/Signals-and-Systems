% some useful parameters

N = 501;
N1 = 250;
T = 20;
Ts = T/N1;
Tw = T/2;

% 1.(a)

x1 = zeros(1, N);
for i = 1:N
    x1(i) = (sin(2*pi*(i-(N1+1))*Ts))/(2*pi*(i-(N1+1))*Ts);
end

x1(N1+1) = 1;

label = zeros(1, N);
for i = 1:N
    label(i) = i - (N1+1);
end

figure
plot(label, x1)

% 1.(b)

omega = zeros(1, N);
for i = 1:N
    omega(i) = (2*pi*(i-(N1+1)))/(N);
end

x2 = fft(x1, N);

x3 = fftshift(x2);

figure
plot(omega, abs(x3))

% 1.(c)

x4 = zeros(1, N);
for i = 1:N
    for j = 1:N
        x4(i) = x4(i) + x1(j)*(exp(-1i*(2*pi*(i-(N1+1))/N)*((j-(N1+1))-1)));
    end
end

figure
plot(omega, abs(x4))

% 2.(d)

x5 = zeros(1, N);
for i = (ceil(-Tw/(2*Ts))+(N1+1)):(floor(Tw/(2*Ts))+(N1+1))
    x5(i) = (1/2)*(1+cos((2*pi*abs((i-(N1+1))*(Ts)))/(Tw)));
end

figure
plot(label, x5)

% 2.(e)

x6 = zeros(1, N);
for i = 1:N
    x6(i) = x1(i) * x5(i);
end

figure
plot(label, x6)

% 2.(f)

x7 = fft(x6, N);

x8 = fftshift(x7);

figure
plot(omega, abs(x8))