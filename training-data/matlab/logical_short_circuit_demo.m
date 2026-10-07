function logical_short_circuit_demo()
    data = [];
    if ~isempty(data) && data(1) > 0
        disp('positive');
    else
        disp('skipped safely');
    end

    a = [1 0 1]; b = [1 1 0];
    disp(a & b);
    disp(a | b);
    disp(xor(a, b));
    disp(~a);

    x = 5;
    disp(x > 3 && x < 10);
    disp(any(a) || error('not evaluated'));

    t = true; f = false;
    fprintf('%d %d\n', t + t, f * 5);
    disp(class(a == b));
    disp(isequal([1 2 3], [1 2 3]));
end
