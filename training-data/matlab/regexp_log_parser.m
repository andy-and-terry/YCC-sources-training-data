function entries = regexp_log_parser(lines)
    entries = struct('level', {}, 'message', {});
    pattern = '\[(\w+)\]\s*(.*)';
    for i = 1:numel(lines)
        tokens = regexp(lines{i}, pattern, 'tokens');
        if ~isempty(tokens)
            entries(end + 1).level = tokens{1}{1};
            entries(end).message = tokens{1}{2};
        end
    end
end
