function result = valid_parentheses(s)
    stack = [];
    pairs_map = containers.Map({')', ']', '}'}, {'(', '[', '{'});
    for i = 1:length(s)
        c = s(i);
        if any(c == '([{')
            stack(end+1) = c;
        elseif any(c == ')]}')
            if isempty(stack) || stack(end) ~= pairs_map(c)
                result = false;
                return;
            end
            stack(end) = [];
        end
    end
    result = isempty(stack);
end
