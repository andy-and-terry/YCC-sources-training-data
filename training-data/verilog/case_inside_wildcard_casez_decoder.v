module casez_priority_decoder (
    input      [3:0] req,
    output reg [1:0] grant,
    output reg       valid
);
    always @* begin
        valid = 1'b1;
        casez (req)
            4'b1???: grant = 2'd3;
            4'b01??: grant = 2'd2;
            4'b001?: grant = 2'd1;
            4'b0001: grant = 2'd0;
            default: begin
                grant = 2'd0;
                valid = 1'b0;
            end
        endcase
    end
endmodule

module tb;
    reg [3:0] req;
    wire [1:0] grant;
    wire valid;
    integer i;

    casez_priority_decoder dut (req, grant, valid);

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            req = i;
            #1 $display("req=%b grant=%0d valid=%b", req, grant, valid);
        end
    end
endmodule
