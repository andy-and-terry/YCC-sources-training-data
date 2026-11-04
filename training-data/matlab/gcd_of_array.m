function g = gcd_all(v)
  g = 0;
  for n = v(:)'
    g = gcd(g, n);
  end
end

disp(gcd_all([12 18 24]));
disp(gcd_all([7 13]));
disp(lcm(4, 6));
