module mux4_ex (input [3:0] d, input [1:0] sel, output reg y);
  always @(*) begin
    case (sel)
      2'b00: y = d[0];
      2'b01: y = d[1];
      2'b10: y = d[2];
      default: y = d[3];
    endcase
  end
endmodule
