% Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function mobius_function()
  out = arrayfun(@mobius, 1:30);
  disp(num2str(out));
end

function r = mobius(n)
  r = 1;
  p = 2;
  while p * p <= n
    if mod(n, p) == 0
      n = n / p;
      if mod(n, p) == 0
        r = 0;
        return;
      end
      r = -r;
    end
    p = p + 1;
  end
  if n > 1
    r = -r;
  end
end
