function secant_method()
  f = @(x) x.^2 - 2;
  x0 = 1; x1 = 2;
  for k = 1:50
    f0 = f(x0); f1 = f(x1);
    if f1 == f0, break; end
    x2 = x1 - f1 * (x1 - x0) / (f1 - f0);
    x0 = x1; x1 = x2;
    if abs(x1 - x0) < 1e-12, break; end
  end
  fprintf('%.10f\n', x1);
end
