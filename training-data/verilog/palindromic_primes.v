module palindromic_primes (
    input  wire [7:0] n,        // 0..199
    output wire       is_pal_prime
);

function is_prime;
    input [7:0] x;
    integer i;
    begin
        is_prime = (x >= 2);
        for (i = 2; i * i <= x; i = i + 1)
            if (x % i == 0) is_prime = 1'b0;
    end
endfunction

wire [3:0] hundreds = n / 100;
wire [3:0] ones     = n % 10;
wire       is_palindrome = (n < 10) || (n < 100 ? (n / 10 == ones) : (hundreds == ones));

assign is_pal_prime = is_palindrome && is_prime(n);

endmodule
