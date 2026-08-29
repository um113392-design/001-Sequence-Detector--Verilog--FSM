`timescale 1ns/1ps

module tb_sequence_detector_001;

    reg clk;
    reg reset;
    reg din;
    wire detected;

    // Instantiate DUT
    sequence_detector_001 DUT (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        clk = 1'b0;
        reset = 1'b1;
        din = 1'b0;

        #10;
        reset = 1'b0;

        // Input sequence: 001001
        #10 din = 1'b0;
        #10 din = 1'b0;
        #10 din = 1'b1;   // 001 detected

        #10 din = 1'b0;
        #10 din = 1'b0;
        #10 din = 1'b1;   // 001 detected again

        #10;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | Reset=%b | Din=%b | State=%b | Detected=%b",
                 $time, reset, din, DUT.state, detected);
    end

endmodule
