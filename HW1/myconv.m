
% no. 1

x1 = zeros(1, 10);
for i = 1:5
    x1(i) = i;
end
for i = 6:9
    x1(i) = 10 - i;
end
figure
stem(x1)

x2 = zeros(1, 10);
for i = 1:4
    x2(i) = 1;
end
figure
stem(x2)

y = conv(x1, x2)
figure
stem(y)

x1 = zeros(12, 4)
for i = 1:4
    for j = 1:5
        x1(j+i-1, i) = j
    end
end
for i = 1:4
    for j = 6:9
        x1(j+i-1, i) = 10 - j
    end
end

x2 = zeros(4, 1)
for i = 1:4
    x2(i) = 1
end

y = x1 * x2
figure
stem(y)

% no. 2

x1 = zeros(1, 10);
for i = 1:3
    x1(i) = 5^i;
end
figure
stem(x1)

x2 = zeros(1, 10);
for i = 1:5
    x2(i) = 2^i;
end
figure
stem(x2)

y = conv(x1, x2)
figure
stem(y)

x1 = zeros(7, 5)
for i = 1:5
    for j = 1:3
        x1(j+i-1, i) = 5^j
    end
end

x2 = zeros(5, 1)
for i = 1:5
    x2(i) = 2^i
end

y = x1 * x2
figure
stem(y)

% no. 3

label = zeros(1, 20)
for i = 1:20
    label(i) = i-1
end

h1 = zeros(1, 10)
for i = 1:9
    h1(i) = cos((pi/4)*(i-1))
end
label_h = label( : , 1:10)
figure
stem(label_h, h1)

h2 = zeros(1, 10)
for i = 1:9
    h2(i) = 0.5^(i-1)
end
figure
stem(label_h, h2)

label_x = label( : , 1:2)
x=zeros(1, 2)
x(1) = 1
x(2) = -0.5
figure
stem(label_x, x)

y = conv(conv(x, h1), h2)
figure
stem(label, y)