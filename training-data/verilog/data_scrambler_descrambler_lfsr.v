module data_scrambler_lfsr (
    input  wire clk,
    input  wire rst_n,
    input  wire data_in,
    output wire data_out
);

reg [6:0] lfsr;
wire feedback;

assign feedback = lfsr[6] ^ lfsr[5];
assign data_out = data_in ^ feedback;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        lfsr <= 7'b1111111;
    end else begin
        lfsr <= {lfsr[5:0], feedback};
    end
end

endmodule

module data_descrambler_lfsr (
    input  wire clk,
    input  wire rst_n,
    input  wire scrambled_in,
    output wire data_out
);

reg [6:0] lfsr;
wire feedback;

assign feedback = lfsr[6] ^ lfsr[5];
assign data_out = scrambled_in ^ feedback;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        lfsr <= 7'b1111111;
    end else begin
        lfsr <= {lfsr[5:0], scrambled_in};
    end
end

endmodule
