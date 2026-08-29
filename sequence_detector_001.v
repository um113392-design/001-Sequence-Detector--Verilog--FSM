module sequence_detector_001 (
    input  wire clk,
    input  wire reset,
    input  wire din,
    output reg  detected
);

    // FSM states
    parameter S0 = 2'b00;  // No match
    parameter S1 = 2'b01;  // Detected '0'
    parameter S2 = 2'b10;  // Detected '00'

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)

            S0: begin
                if (din == 1'b0)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (din == 1'b0)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                if (din == 1'b1)
                    next_state = S0;
                else
                    next_state = S2;
            end

            default:
                next_state = S0;

        endcase
    end

    // Output logic
    always @(*) begin
        detected = 1'b0;

        if ((state == S2) && (din == 1'b1))
            detected = 1'b1;
    end

endmodule
