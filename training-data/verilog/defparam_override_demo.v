module scaler #(
    parameter WIDTH = 4,
    parameter FACTOR = 2
) (
    input  wire [WIDTH-1:0]  in,
    output wire [WIDTH+3:0]  out
);
    assign out = in * FACTOR;
endmodule

module defparam_override_demo;
    reg  [7:0] a;
    wire [7:0] y_default;
    wire [11:0] y_named, y_defparam;

    // Defaults: WIDTH=4, FACTOR=2
    scaler u_default (.in(a[3:0]), .out(y_default));

    // Override with named parameter association.
    scaler #(.WIDTH(8), .FACTOR(3)) u_named (.in(a), .out(y_named));

    // Override with hierarchical defparam.
    scaler u_def (.in(a), .out(y_defparam));
    defparam u_def.WIDTH = 8;
    defparam u_def.FACTOR = 5;

    initial begin
        a = 8'd10;
        #1;
        $display("default  : %0d", y_default);
        $display("named x3 : %0d", y_named);
        $display("defparam x5: %0d", y_defparam);
        $finish;
    end
endmodule
