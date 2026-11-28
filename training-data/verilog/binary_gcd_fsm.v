module binary_gcd_fsm (
    input  wire        clk, rst, start,
    input  wire [15:0] a_in, b_in,
    output reg  [15:0] result,
    output reg         done
);
    reg [15:0] a, b;
    reg [4:0]  shift;
    reg [1:0]  state;
    localparam IDLE = 0, RUN = 1, FIN = 2;

    always @(posedge clk) begin
        if (rst) begin state <= IDLE; done <= 0; end
        else case (state)
            IDLE: if (start) begin
                a <= a_in; b <= b_in; shift <= 0; done <= 0; state <= RUN;
            end
            RUN: begin
                if (a == b || a == 0 || b == 0) state <= FIN;
                else if (!a[0] && !b[0]) begin a <= a >> 1; b <= b >> 1; shift <= shift + 1; end
                else if (!a[0]) a <= a >> 1;
                else if (!b[0]) b <= b >> 1;
                else if (a > b) a <= a - b;
                else b <= b - a;
            end
            FIN: begin result <= (a | b) << shift; done <= 1; state <= IDLE; end
        endcase
    end
endmodule
