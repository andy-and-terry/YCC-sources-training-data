% Narayana's cows N(n)=N(n-1)+N(n-3)
v = [1 1 1];
for i = 4:10
    v(i) = v(i - 1) + v(i - 3);
end
disp(num2str(v));
