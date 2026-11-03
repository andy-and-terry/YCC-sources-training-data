function out = swap_case_manual(s)
    out = s;
    up = isstrprop(s, 'upper');
    lo = isstrprop(s, 'lower');
    out(up) = lower(s(up));
    out(lo) = upper(s(lo));
end

disp(swap_case_manual('Hello World 42'));
