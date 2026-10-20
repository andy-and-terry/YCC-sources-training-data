fname = [tempname() '.txt'];
fid = fopen(fname, 'w');
fprintf(fid, '%d,%s\n', 1, 'a');
fprintf(fid, '%d,%s\n', 2, 'b');
fclose(fid);
fid = fopen(fname, 'r');
while true
    line = fgetl(fid);
    if ~ischar(line), break; end
    parts = strsplit(line, ',');
    fprintf('%s -> %s\n', parts{1}, parts{2});
end
fclose(fid);
txt = fileread(fname);
disp(numel(strsplit(strtrim(txt), "\n")));
M = [1 2; 3 4];
csv = [tempname() '.csv'];
dlmwrite(csv, M, ',');
disp(dlmread(csv, ','));
save([tempname() '.mat'], 'M');
disp(exist(fname, 'file') == 2);
delete(fname); delete(csv);
disp(exist(fname, 'file'));
disp(isa(1, 'double')); disp(class(int8(5))); disp(intmax('int8')); disp(int8(127) + int8(10));
