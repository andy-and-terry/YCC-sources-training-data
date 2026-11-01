% Reverse-and-add until a palindrome; count the steps.
starts = [56 57 59 79 89];
result = zeros(size(starts));
for i = 1:numel(starts)
    n = starts(i);
    result(i) = -1;
    for count = 0:49
        s = num2str(n);
        if count > 0 && strcmp(s, fliplr(s))
            result(i) = count;
            break;
        end
        n = n + str2double(fliplr(s));
    end
end
disp(num2str(result));
