`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Minute Counter
//
// Description: Acts as a counter, inverting the output signal every 30 s.
////////////////////////////////////////////////////////////////////////////////

module MinuteCounter (
    // Inputs
    input secondClock,
    input [4:0] counterFeedback,
    input clockFeedback,
    // Outputs
    output reg [4:0] counterOut,
    output reg clockOut
    );

    // Initialize counter state
    initial begin
        clockOut = 0;
        counterOut = 0;
    end

    // Count up clock and feedback values
    always @(posedge secondClock) begin
        if (counterFeedback == 30) begin // Stop at 30s
            clockOut <= ~clockFeedback;
            counterOut <= 0;
        end else begin
            counterOut <= counterFeedback + 1;
        end
    end

endmodule