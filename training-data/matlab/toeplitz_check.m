function tf = is_toeplitz(m)
  tf = all(all(m(2:end, 2:end) == m(1:end-1, 1:end-1)));
end

disp(is_toeplitz([1 2 3; 4 1 2; 5 4 1]));
disp(is_toeplitz([1 2; 2 2]));
disp(isequal(toeplitz([1 2 3]), toeplitz([1 2 3])));  % built-in generator
