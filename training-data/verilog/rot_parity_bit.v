module parity_bit (
    input wire [7:0] data,
    output wire even_parity
);
    assign even_parity = ^data;
endmodule
