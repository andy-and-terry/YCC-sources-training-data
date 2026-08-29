module interrupt_controller #(
    parameter NUM_IRQS = 4
) (
    input wire clk,
    input wire rst_n,
    input wire [NUM_IRQS-1:0] irq_in,
    input wire [NUM_IRQS-1:0] irq_mask,
    output wire irq_pending,
    output reg [$clog2(NUM_IRQS)-1:0] irq_vector
);

wire [NUM_IRQS-1:0] masked_irq;
assign masked_irq = irq_in & ~irq_mask;
assign irq_pending = |masked_irq;

integer i;
always @(*) begin
    irq_vector = 0;
    for (i = NUM_IRQS - 1; i >= 0; i = i - 1) begin
        if (masked_irq[i]) irq_vector = i;
    end
end

endmodule
