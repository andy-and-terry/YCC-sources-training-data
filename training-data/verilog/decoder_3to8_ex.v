module decoder_3to8_ex (input [2:0] in, input en, output [7:0] out);
  assign out = en ? (8'b1 << in) : 8'b0;
endmodule
