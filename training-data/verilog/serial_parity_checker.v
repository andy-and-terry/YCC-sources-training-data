module serial_parity_checker (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire bit_in,
    output reg odd_parity
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        odd_parity <= 1'b0;
    else if (start)
        odd_parity <= bit_in;
    else
        odd_parity <= odd_parity ^ bit_in;
end

endmodule
