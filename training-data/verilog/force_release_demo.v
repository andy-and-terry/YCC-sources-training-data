module force_release_demo;
    reg clk;
    reg [3:0] count;
    wire [3:0] observed;

    assign observed = count + 4'd1;

    always #5 clk = ~clk;

    always @(posedge clk)
        count <= count + 4'd1;

    initial begin
        clk = 0;
        count = 0;

        #22;
        $display("t=%0t count=%0d", $time, count);

        // force overrides the register until released.
        force count = 4'd9;
        #10;
        $display("t=%0t forced count=%0d", $time, count);
        release count;

        // Forcing a net overrides its continuous assignment.
        force observed = 4'd15;
        #1 $display("t=%0t observed forced=%0d", $time, observed);
        release observed;
        #1 $display("t=%0t observed released=%0d", $time, observed);

        #20 $finish;
    end
endmodule
