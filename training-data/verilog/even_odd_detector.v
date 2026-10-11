module even_odd_detector (
    input wire [7:0] value,
    output wire is_even,
    output wire is_odd,
    output wire is_zero
);

assign is_odd = value[0];
assign is_even = ~value[0];
assign is_zero = (value == 8'd0);

endmodule
