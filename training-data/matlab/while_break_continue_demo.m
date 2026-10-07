function while_break_continue_demo()
    n = 0;
    while true
        n = n + 1;
        if mod(n, 2) == 0
            continue;
        end
        if n > 9
            break;
        end
        fprintf('%d ', n);
    end
    fprintf('\n');

    x = 27; steps = 0;
    while x ~= 1
        if mod(x, 2) == 0, x = x / 2; else, x = 3 * x + 1; end
        steps = steps + 1;
    end
    disp(steps);

    k = 10;
    do_once = true;
    while do_once || k < 5
        do_once = false;
        k = k - 3;
    end
    disp(k);
end
