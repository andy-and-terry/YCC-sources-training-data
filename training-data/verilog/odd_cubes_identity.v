module odd_cubes_identity;
function [31:0] cube_from_odds(input [31:0] n);
    integer i;
    reg [31:0] start;
    begin
        start = n * n - n + 1;
        cube_from_odds = 0;
        for (i = 0; i < n; i = i + 1)
            cube_from_odds = cube_from_odds + start + 2 * i;
    end
endfunction

initial begin
    integer n;
    for (n = 1; n <= 5; n = n + 1)
        $display("%0d %0d %0d", n, cube_from_odds(n), cube_from_odds(n) == n * n * n);
end

endmodule
