// Reverse the digits of a number below 200 and test both for primality (trial division table)
module emirp_numbers (
    input  wire [7:0] p,
    output wire       is_emirp
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

wire [7:0] hundreds = p / 100;
wire [7:0] tens     = (p / 10) % 10;
wire [7:0] ones     = p % 10;
wire [7:0] reversed = ones * 100 + tens * 10 + hundreds;

assign is_emirp = (reversed != p) && is_prime(p) && is_prime(reversed[7:0]);

endmodule
