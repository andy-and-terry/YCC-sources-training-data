% Bulls and Cows scoring for equal-length digit strings.
function bulls_and_cows()
    [b, c] = score('1807', '7810');
    fprintf('%d bull(s), %d cow(s)\n', b, c);
end

function [bulls, cows] = score(secret, guess)
    same = secret == guess;
    bulls = sum(same);
    cows = 0;
    for d = '0':'9'
        cows = cows + min(sum(secret(~same) == d), sum(guess(~same) == d));
    end
end
