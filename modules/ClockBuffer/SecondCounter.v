`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Second Counter
//
// Description: Acts as a counter, inverting the output signal every 500 ms.
////////////////////////////////////////////////////////////////////////////////

module SecondCounter (
    // Inputs
    input cmosClock,
    input [25:0] counterFeedback,
    input clockFeedback,
    // Outputs
    output reg [25:0] counterOut,
    output reg clockOut
    );

    // Initialize counter state
    initial begin
        clockOut = 0;
        counterOut = 0;
    end

    // Count up clock and feedback values
    always @(posedge cmosClock) begin
        if (counterFeedback == 50000000) begin // Stop at 500ms
            clockOut = ~clockFeedback;
            counterOut <= 0;
        end else begin
            counterOut <= counterFeedback + 1;
        end
    end

endmodule