module onehot_multiplexer (
    input wire [3:0] data_a,
    input wire [3:0] data_b,
    input wire [3:0] data_c,
    input wire [3:0] data_d,
    input wire [3:0] sel_onehot,
    output reg [3:0] data_out
);

always @(*) begin
    case (sel_onehot)
        4'b0001: data_out = data_a;
        4'b0010: data_out = data_b;
        4'b0100: data_out = data_c;
        4'b1000: data_out = data_d;
        default: data_out = 4'b0000;
    endcase
end

endmodule
