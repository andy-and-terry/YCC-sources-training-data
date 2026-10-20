d = [5 3 8 1 9 2 8];
disp(mean(d)); disp(median(d)); disp(mode(d)); disp(std(d)); disp(var(d)); disp(range(d));
disp(sort(d, 'descend')); [s, i] = sort(d); disp(i);
disp(unique(d)); disp(histc(d, 1:9)); disp(cumsum(d)); disp(max(d)); disp(min(d, [], 2));
disp(union([1 2], [2 3])); disp(intersect([1 2 3], [2 3 4])); disp(setdiff([1 2 3], 2)); disp(ismember(3, d));
disp(prctile(d, 50)); disp(corrcoef(1:5, [2 4 6 8 10]));
disp(round(2.5)); disp(floor(-2.5)); disp(fix(-2.5)); disp(rem(-7, 3)); disp(mod(-7, 3));
disp(sortrows([3 1; 1 2; 2 0]));
disp(accumarray([1; 2; 1], [10; 20; 30])');
disp(any(isnan([1 NaN]))); disp(nansum_like([1 NaN 3]));
function s = nansum_like(v), s = sum(v(~isnan(v))); end
