for i = 1:3
    fprintf('%d ', i);
end
fprintf('\n');
for v = [10 20 30], fprintf('%d,', v); end; fprintf('\n');
n = 0;
while true
    n = n + 1;
    if mod(n, 2) == 0, continue; end
    if n > 7, break; end
    fprintf('%d ', n);
end
fprintf('\n');
for k = {1, 'a'}
    disp(class(k{1}));
end
x = 'beta';
switch x
    case {'alpha', 'beta'}
        disp('greek');
    case 'gamma'
        disp('other');
    otherwise
        disp('unknown');
end
if ~isempty([]) || true, disp('or'); else, disp('no'); end
try
    error('MyPkg:bad', 'Value %d is bad', 7);
catch err
    disp(err.identifier); disp(err.message);
end
total = 0; for r = 1:3, for c = 1:3, if r == c, total = total + r * c; end, end, end; disp(total)
