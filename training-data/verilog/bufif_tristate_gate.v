// Gate-level tri-state buffers sharing one bus line
module bufif_tristate_gate (
    input wire data_a,
    input wire data_b,
    input wire en_a,
    input wire en_b,
    output wire bus
);

bufif1 drv_a (bus, data_a, en_a);
bufif1 drv_b (bus, data_b, en_b);

endmodule
