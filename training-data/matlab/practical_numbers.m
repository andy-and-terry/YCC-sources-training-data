% Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function practical_numbers()
  for n = 1:40
    if is_practical(n)
      fprintf('%d ', n);
    end
  end
  fprintf('\n');
end

function ok = is_practical(n)
  reach = false(1, n + 1);   % reach(i + 1) <=> i is a subset sum
  reach(1) = true;
  for d = 1:n
    if mod(n, d) == 0
      reach = reach | [false(1, d), reach(1:n + 1 - d)];
    end
  end
  ok = all(reach);
end
