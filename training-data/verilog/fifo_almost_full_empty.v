module fifo_almost_full_empty #(
    parameter DEPTH     = 8,
    parameter WIDTH     = 8,
    parameter ALM_FULL  = 6,
    parameter ALM_EMPTY = 2
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             wr_en,
    input  wire             rd_en,
    input  wire [WIDTH-1:0] din,
    output reg  [WIDTH-1:0] dout,
    output wire             almost_full,
    output wire             almost_empty,
    output wire             full,
    output wire             empty
);

reg [WIDTH-1:0] mem [0:DEPTH-1];
reg [$clog2(DEPTH):0] count;
reg [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;

assign full         = (count == DEPTH);
assign empty        = (count == 0);
assign almost_full  = (count >= ALM_FULL);
assign almost_empty = (count <= ALM_EMPTY);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;
    end else begin
        if (wr_en && !full) begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1'b1;
        end
        if (rd_en && !empty) begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end
        case ({wr_en && !full, rd_en && !empty})
            2'b10:   count <= count + 1'b1;
            2'b01:   count <= count - 1'b1;
            default: count <= count;
        endcase
    end
end

endmodule
