% Perrin sequence P(n)=P(n-2)+P(n-3)
v = [3 0 2];
for i = 4:10
    v(i) = v(i - 2) + v(i - 3);
end
disp(num2str(v));
