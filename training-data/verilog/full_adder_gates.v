module fa(input a, b, cin, output sum, cout);
  wire x = a ^ b;
  assign sum = x ^ cin;
  assign cout = (a & b) | (x & cin);
endmodule
