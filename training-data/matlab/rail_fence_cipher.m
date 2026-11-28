text = 'WEAREDISCOVERED'; k = 3; cycle = 2 * (k - 1);
i = 0:numel(text)-1;
r = mod(i, cycle);
rail = r .* (r < k) + (cycle - r) .* (r >= k);
[~, order] = sort(rail);        % sort is stable for ties
disp(text(order));
