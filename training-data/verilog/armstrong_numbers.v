module armstrong_numbers (
    input  wire [9:0] n,        // 0..999
    output wire       is_armstrong
);

wire [3:0] hundreds = n / 100;
wire [3:0] tens     = (n / 10) % 10;
wire [3:0] ones     = n % 10;

wire [9:0] cubes = hundreds * hundreds * hundreds
                 + tens * tens * tens
                 + ones * ones * ones;

// Valid for 3-digit inputs: 153, 370, 371, 407
assign is_armstrong = (n >= 100) && (cubes == n);

endmodule
