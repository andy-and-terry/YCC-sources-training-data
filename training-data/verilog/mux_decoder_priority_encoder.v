module mux4 (input wire [3:0] d, input wire [1:0] s, output wire y);
    assign y = d[s];
endmodule

module decoder3to8 (input wire [2:0] a, input wire en, output reg [7:0] y);
    always @* begin
        y = 8'b0;
        if (en) y[a] = 1'b1;
    end
endmodule

module prio_enc (input wire [7:0] req, output reg [2:0] idx, output wire valid);
    assign valid = |req;
    integer i;
    always @* begin
        idx = 3'd0;
        for (i = 0; i < 8; i = i + 1)
            if (req[i]) idx = i[2:0];
    end
endmodule
