function lah_numbers()
  for n = 1:5
    row = zeros(1, n);
    for k = 1:n
      row(k) = nchoosek(n - 1, k - 1) * factorial(n) / factorial(k);
    end
    disp(row);
  end
end
