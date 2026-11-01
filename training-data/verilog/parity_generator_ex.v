module parity_generator_ex (input [7:0] data, output even_parity, output odd_parity);
  assign even_parity = ^data;
  assign odd_parity  = ~^data;
endmodule
