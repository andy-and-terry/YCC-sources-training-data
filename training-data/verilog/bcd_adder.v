module bcd_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output reg [3:0] sum,
    output reg cout
);

reg [4:0] binary_sum;

always @(*) begin
    binary_sum = a + b + cin;
    if (binary_sum > 5'd9) begin
        sum = binary_sum[3:0] + 4'd6;
        cout = 1'b1;
    end else begin
        sum = binary_sum[3:0];
        cout = 1'b0;
    end
end

endmodule
