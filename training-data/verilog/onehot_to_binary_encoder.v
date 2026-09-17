module onehot_to_binary_encoder (
    input wire [7:0] onehot_in,
    output reg [2:0] binary_out,
    output wire valid
);

assign valid = |onehot_in;

always @(*) begin
    casez (onehot_in)
        8'b1???????: binary_out = 3'd7;
        8'b01??????: binary_out = 3'd6;
        8'b001?????: binary_out = 3'd5;
        8'b0001????: binary_out = 3'd4;
        8'b00001???: binary_out = 3'd3;
        8'b000001??: binary_out = 3'd2;
        8'b0000001?: binary_out = 3'd1;
        8'b00000001: binary_out = 3'd0;
        default: binary_out = 3'd0;
    endcase
end

endmodule
