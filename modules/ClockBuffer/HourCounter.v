`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Hour Counter
//
// Description: Acts as a counter, inverting the output signal every 30 m.
////////////////////////////////////////////////////////////////////////////////

module HourCounter (
    // Inputs
    input minuteClock,
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
    always @(posedge minuteClock) begin
        if (counterFeedback == 30) begin // Stop at 30m
            clockOut <= ~clockFeedback;
            counterOut <= 0;
        end else begin
            counterOut <= counterFeedback + 1;
        end
    end

endmodule