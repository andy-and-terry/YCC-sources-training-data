module demux_1to4 (
    input wire data_in,
    input wire [1:0] sel,
    output reg [3:0] data_out
);

always @(*) begin
    data_out = 4'b0000;
    case (sel)
        2'b00: data_out[0] = data_in;
        2'b01: data_out[1] = data_in;
        2'b10: data_out[2] = data_in;
        2'b11: data_out[3] = data_in;
    endcase
end

endmodule
