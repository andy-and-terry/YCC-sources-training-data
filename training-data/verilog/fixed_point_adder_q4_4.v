module fixed_point_adder_q4_4 (
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [7:0] sum,
    output reg saturated
);

wire signed [8:0] wide = a + b;

always @(*) begin
    saturated = 1'b0;
    if (wide > 9'sd127) begin
        sum = 8'sd127;
        saturated = 1'b1;
    end else if (wide < -9'sd128) begin
        sum = -8'sd128;
        saturated = 1'b1;
    end else begin
        sum = wide[7:0];
    end
end

endmodule
