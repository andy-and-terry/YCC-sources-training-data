module rom_lookup_table (
    input wire clk,
    input wire [3:0] addr,
    output reg [7:0] data
);

// 16-entry sine-like table, one registered read per cycle
always @(posedge clk) begin
    case (addr)
        4'd0:  data <= 8'd128;
        4'd1:  data <= 8'd176;
        4'd2:  data <= 8'd218;
        4'd3:  data <= 8'd245;
        4'd4:  data <= 8'd255;
        4'd5:  data <= 8'd245;
        4'd6:  data <= 8'd218;
        4'd7:  data <= 8'd176;
        4'd8:  data <= 8'd128;
        4'd9:  data <= 8'd79;
        4'd10: data <= 8'd37;
        4'd11: data <= 8'd10;
        4'd12: data <= 8'd0;
        4'd13: data <= 8'd10;
        4'd14: data <= 8'd37;
        4'd15: data <= 8'd79;
    endcase
end

endmodule
