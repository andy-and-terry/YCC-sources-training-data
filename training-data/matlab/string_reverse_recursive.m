function reversed = string_reverse_recursive(str)
    if isempty(str)
        reversed = str;
    else
        reversed = [string_reverse_recursive(str(2:end)), str(1)];
    end
end

disp(string_reverse_recursive('recursion'))
