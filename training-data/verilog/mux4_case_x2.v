module mux4_x2 (input [1:0] sel, input [3:0] d, output reg y);
  always @* begin
    case (sel)
      2'b00: y = d[0];
      2'b01: y = d[1];
      2'b10: y = d[2];
      2'b11: y = d[3];
    endcase
  end
endmodule
