module gray_enc #(parameter W = 4) (input wire [W-1:0] b, output wire [W-1:0] g);
    assign g = b ^ (b >> 1);
endmodule

module gray_dec #(parameter W = 4) (input wire [W-1:0] g, output reg [W-1:0] b);
    integer i;
    always @* begin
        b[W-1] = g[W-1];
        for (i = W - 2; i >= 0; i = i - 1) b[i] = b[i+1] ^ g[i];
    end
endmodule

module parity8 (input wire [7:0] d, output wire even, odd);
    assign odd = ^d;
    assign even = ~^d;
endmodule
