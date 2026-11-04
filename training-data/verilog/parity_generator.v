module parity_generator #(parameter W = 8) (
    input  wire [W-1:0] data,
    output wire         even_parity,
    output wire         odd_parity
);
    assign even_parity = ^data;   // XOR-reduce: 1 when odd number of ones
    assign odd_parity  = ~^data;
endmodule
