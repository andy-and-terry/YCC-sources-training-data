module priority_arbiter_weighted (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] request,
    input  wire [3:0] weight0,
    input  wire [3:0] weight1,
    input  wire [3:0] weight2,
    input  wire [3:0] weight3,
    output reg  [3:0] grant
);

reg [3:0] credit0, credit1, credit2, credit3;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        credit0 <= weight0;
        credit1 <= weight1;
        credit2 <= weight2;
        credit3 <= weight3;
        grant   <= 4'b0000;
    end else begin
        grant <= 4'b0000;
        if (request[0] && credit0 != 0) begin
            grant[0] <= 1'b1;
            credit0  <= credit0 - 1'b1;
        end else if (request[1] && credit1 != 0) begin
            grant[1] <= 1'b1;
            credit1  <= credit1 - 1'b1;
        end else if (request[2] && credit2 != 0) begin
            grant[2] <= 1'b1;
            credit2  <= credit2 - 1'b1;
        end else if (request[3] && credit3 != 0) begin
            grant[3] <= 1'b1;
            credit3  <= credit3 - 1'b1;
        end else begin
            credit0 <= weight0;
            credit1 <= weight1;
            credit2 <= weight2;
            credit3 <= weight3;
        end
    end
end

endmodule
