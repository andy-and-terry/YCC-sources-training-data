module shift_add_multiplier_4bit (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire [3:0] multiplicand,
    input wire [3:0] multiplier,
    output reg [7:0] product,
    output reg done
);

reg [3:0] mcand_reg;
reg [7:0] acc;
reg [2:0] count;
reg busy;
wire [4:0] add_result;

assign add_result = acc[7:4] + mcand_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        acc <= 8'b0;
        mcand_reg <= 4'b0;
        count <= 3'b0;
        busy <= 1'b0;
        done <= 1'b0;
        product <= 8'b0;
    end else if (start && !busy) begin
        mcand_reg <= multiplicand;
        acc <= {4'b0, multiplier};
        count <= 3'd4;
        busy <= 1'b1;
        done <= 1'b0;
    end else if (busy) begin
        if (acc[0]) begin
            acc <= {add_result, acc[3:1]};
        end else begin
            acc <= {1'b0, acc[7:4], acc[3:1]};
        end
        count <= count - 1'b1;
        if (count == 3'd1) begin
            busy <= 1'b0;
            done <= 1'b1;
            product <= acc[0] ? {add_result, acc[3:1]} : {1'b0, acc[7:4], acc[3:1]};
        end
    end
end

endmodule
