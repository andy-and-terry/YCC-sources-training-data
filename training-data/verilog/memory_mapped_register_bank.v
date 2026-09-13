module memory_mapped_register_bank (
    input wire clk,
    input wire rst_n,
    input wire wr_en,
    input wire rd_en,
    input wire [1:0] addr,
    input wire [7:0] wr_data,
    output reg [7:0] rd_data
);

localparam ADDR_CTRL   = 2'b00;
localparam ADDR_STATUS = 2'b01;
localparam ADDR_DATA   = 2'b10;

reg [7:0] ctrl_reg;
reg [7:0] data_reg;
reg [7:0] status_count;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ctrl_reg <= 8'b0;
        data_reg <= 8'b0;
        status_count <= 8'b0;
    end else begin
        status_count <= status_count + 1'b1;
        if (wr_en) begin
            case (addr)
                ADDR_CTRL: ctrl_reg <= wr_data;
                ADDR_DATA: data_reg <= wr_data;
                default: ;
            endcase
        end
    end
end

always @(*) begin
    if (rd_en) begin
        case (addr)
            ADDR_CTRL:   rd_data = ctrl_reg;
            ADDR_STATUS: rd_data = status_count;
            ADDR_DATA:   rd_data = data_reg;
            default:     rd_data = 8'b0;
        endcase
    end else begin
        rd_data = 8'b0;
    end
end

endmodule
