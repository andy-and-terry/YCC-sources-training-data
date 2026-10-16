module leap_year_checker (
    input wire [11:0] year,
    output wire is_leap
);

wire div4 = (year % 4 == 0);
wire div100 = (year % 100 == 0);
wire div400 = (year % 400 == 0);

assign is_leap = div4 & (~div100 | div400);

endmodule
