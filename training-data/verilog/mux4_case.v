module mux4(input [1:0] sel, input [3:0] d, output reg y);
  always @* begin
    case (sel)
      2'd0: y = d[0];
      2'd1: y = d[1];
      2'd2: y = d[2];
      default: y = d[3];
    endcase
  end
endmodule
