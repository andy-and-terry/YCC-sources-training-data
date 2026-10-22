% Aliquot sequence: repeatedly replace n by the sum of its proper divisors until 0
n = 12;
terms = n;
while n > 0
    divisors = 1:floor(n / 2);
    n = sum(divisors(mod(n, divisors) == 0));
    terms(end + 1) = n;
end
disp(strjoin(arrayfun(@num2str, terms, 'UniformOutput', false), ' '))
