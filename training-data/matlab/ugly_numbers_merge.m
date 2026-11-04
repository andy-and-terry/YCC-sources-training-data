function u = ugly(n)
  seq = zeros(1, n); seq(1) = 1;
  i2 = 1; i3 = 1; i5 = 1;
  for k = 2:n
    c2 = seq(i2) * 2; c3 = seq(i3) * 3; c5 = seq(i5) * 5;
    next = min([c2 c3 c5]);
    seq(k) = next;
    if next == c2, i2 = i2 + 1; end
    if next == c3, i3 = i3 + 1; end
    if next == c5, i5 = i5 + 1; end
  end
  u = seq(n);
end

disp(arrayfun(@ugly, 1:12));
