module priority_encoder (
    input  wire [7:0] req,
    output reg  [2:0] index,
    output wire       valid
);
    assign valid = |req;
    always @* begin
        index = 3'd0;
        casez (req)
            8'b1???????: index = 3'd7;
            8'b01??????: index = 3'd6;
            8'b001?????: index = 3'd5;
            8'b0001????: index = 3'd4;
            8'b00001???: index = 3'd3;
            8'b000001??: index = 3'd2;
            8'b0000001?: index = 3'd1;
            default:     index = 3'd0;
        endcase
    end
endmodule
