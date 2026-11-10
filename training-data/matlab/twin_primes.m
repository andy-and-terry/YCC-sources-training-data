function twin_primes()
    p = primes(80);
    idx = diff(p) == 2;
    pairs = [p(idx); p([false idx])]';
    disp(pairs); % rows: 3 5; 5 7; 11 13; 17 19; 29 31; 41 43; 59 61; 71 73
end
