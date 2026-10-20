module sync_fifo #(parameter W = 8, D = 4) (
    input  wire clk, rst, wr, rd,
    input  wire [W-1:0] din,
    output reg  [W-1:0] dout,
    output wire full, empty
);
    localparam AW = $clog2(D);
    reg [W-1:0] mem [0:D-1];
    reg [AW:0] wp, rp;
    assign empty = (wp == rp);
    assign full  = (wp[AW] != rp[AW]) && (wp[AW-1:0] == rp[AW-1:0]);
    always @(posedge clk) begin
        if (rst) begin wp <= 0; rp <= 0; end
        else begin
            if (wr && !full) begin mem[wp[AW-1:0]] <= din; wp <= wp + 1; end
            if (rd && !empty) begin dout <= mem[rp[AW-1:0]]; rp <= rp + 1; end
        end
    end
endmodule
