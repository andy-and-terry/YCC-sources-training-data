module fa_x2 (input a, b, cin, output s, cout);
  wire x1 = a ^ b;
  assign s = x1 ^ cin;
  assign cout = (a & b) | (x1 & cin);
endmodule
