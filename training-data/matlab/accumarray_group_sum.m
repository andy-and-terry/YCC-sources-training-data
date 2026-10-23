groups = [1 2 1 3 2 1];
values = [10 20 30 40 50 60];
totals = accumarray(groups', values')'
counts = accumarray(groups', 1)'
means = totals ./ counts
