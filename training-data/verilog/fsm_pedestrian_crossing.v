module fsm_pedestrian_crossing (
    input  wire clk,
    input  wire rst_n,
    input  wire ped_button,
    output reg  car_green,
    output reg  car_red,
    output reg  ped_walk
);

localparam CARS_GO = 2'd0, CARS_WARN = 2'd1, PED_GO = 2'd2, PED_WARN = 2'd3;
reg [1:0] state, next_state;
reg button_latched;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state          <= CARS_GO;
        button_latched <= 1'b0;
    end else begin
        state <= next_state;
        if (ped_button) begin
            button_latched <= 1'b1;
        end else if (state == PED_GO) begin
            button_latched <= 1'b0;
        end
    end
end

always @(*) begin
    case (state)
        CARS_GO:   next_state = button_latched ? CARS_WARN : CARS_GO;
        CARS_WARN: next_state = PED_GO;
        PED_GO:    next_state = PED_WARN;
        PED_WARN:  next_state = CARS_GO;
        default:   next_state = CARS_GO;
    endcase
end

always @(*) begin
    car_green = (state == CARS_GO);
    car_red   = (state == PED_GO) || (state == PED_WARN);
    ped_walk  = (state == PED_GO);
end

endmodule
