% Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
n = 15;
J = zeros(1, n);
J(2) = 1;
for k = 3:n
    J(k) = J(k-1) + 2 * J(k-2);
end
disp(J)
