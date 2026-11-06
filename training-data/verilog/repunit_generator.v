// Repunit generator: 1, 11, 111, ... via r <= r*10 + 1 on each enable pulse
module repunit_generator (
    input  wire        clk,
    input  wire        rst,
    input  wire        en,
    output reg  [31:0] repunit
);

always @(posedge clk) begin
    if (rst)
        repunit <= 32'd0;
    else if (en)
        repunit <= repunit * 10 + 1;
end

endmodule
