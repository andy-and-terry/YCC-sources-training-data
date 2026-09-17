module pulse_stretcher #(
    parameter WIDTH = 4
) (
    input wire clk,
    input wire rst_n,
    input wire trigger,
    output wire pulse_out
);

reg [WIDTH-1:0] counter;
reg active;

assign pulse_out = active;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= {WIDTH{1'b0}};
        active <= 1'b0;
    end else if (trigger) begin
        counter <= {WIDTH{1'b1}};
        active <= 1'b1;
    end else if (active) begin
        counter <= counter - 1'b1;
        active <= (counter != {WIDTH{1'b0}});
    end
end

endmodule
