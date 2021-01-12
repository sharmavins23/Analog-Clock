`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Display Counter
//
// Description: Acts as a counter, inverting the output signal such that the
//              output frequency is 200 Hz, suitable for driving a display.
////////////////////////////////////////////////////////////////////////////////


module DisplayCounter (
    // Inputs
    input cmosClock,
    input [17:0] counterFeedback,
    input clockFeedback,
    // Outputs
    output reg [17:0] counterOut,
    output reg clockOut
    );

    // Initialize counter state
    initial begin
        clockOut = 0;
        counterOut = 0;
    end

    // Count up clock and feedback values
    always @(posedge cmosClock) begin
        if (counterFeedback == 250000) begin // Invert 400x per second
            clockOut = ~clockFeedback;
            counterOut <= 0;
        end else begin
            counterOut <= counterFeedback + 1;
        end
    end

endmodule