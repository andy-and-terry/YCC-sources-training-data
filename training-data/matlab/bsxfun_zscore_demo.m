X = [1 2 3; 4 5 6; 7 8 10];
mu = mean(X);
sigma = std(X);
Z = (X - mu) ./ sigma;
disp(Z);
disp(mean(Z));
disp(round(std(Z)));
