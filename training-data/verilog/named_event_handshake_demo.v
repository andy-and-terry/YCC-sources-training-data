`timescale 1ns/1ps

// Two processes synchronise through a named event.
module named_event_handshake_demo;
    event data_ready;
    reg [7:0] payload;
    integer received;

    // Producer: writes data, then triggers the event.
    initial begin
        payload = 8'h00;
        repeat (3) begin
            #10;
            payload = payload + 8'h11;
            $display("[%0t] producer wrote %h", $time, payload);
            -> data_ready;
        end
    end

    // Consumer: waits for the event each time.
    initial begin
        received = 0;
        forever begin
            @(data_ready);
            received = received + 1;
            $display("[%0t] consumer saw %h (count %0d)", $time, payload, received);
        end
    end

    initial begin
        #50;
        $display("total received: %0d", received);
        $finish;
    end
endmodule
