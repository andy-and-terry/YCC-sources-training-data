s = struct();
fields = {'alpha', 'beta', 'gamma'};
for i = 1:numel(fields)
    s.(fields{i}) = i^2;
end
disp(s);
disp(fieldnames(s)');
disp(isfield(s, 'beta'));
s = rmfield(s, 'alpha');
disp(isfield(s, {'alpha', 'gamma'}));
