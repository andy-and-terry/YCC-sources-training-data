function rail_fence_cipher()
  text = 'WEAREDISCOVERED';
  rails = 3;
  period = 2 * (rails - 1);
  idx = 0:numel(text) - 1;
  m = mod(idx, period);
  rail = m;
  rail(m >= rails) = period - m(m >= rails);
  [~, order] = sortrows([rail(:), idx(:)]);
  disp(text(order));
end
