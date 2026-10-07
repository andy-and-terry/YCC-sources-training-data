module rom_lookup_table (
    input wire [2:0] addr,
    output reg [7:0] data
);

// Quarter-resolution sine table (unsigned, offset 128)
always @(*) begin
    case (addr)
        3'd0: data = 8'd128;
        3'd1: data = 8'd218;
        3'd2: data = 8'd255;
        3'd3: data = 8'd218;
        3'd4: data = 8'd128;
        3'd5: data = 8'd37;
        3'd6: data = 8'd0;
        3'd7: data = 8'd37;
        default: data = 8'd128;
    endcase
end

endmodule
