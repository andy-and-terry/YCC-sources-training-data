module parity_generator (
    input wire [7:0] data,
    output wire parity_bit
);
assign parity_bit = ^data;
endmodule

module parity_checker (
    input wire [7:0] data,
    input wire parity_bit,
    output wire error
);
assign error = (^data) ^ parity_bit;
endmodule
