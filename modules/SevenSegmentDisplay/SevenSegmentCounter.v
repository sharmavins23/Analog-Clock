`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven Segment Counter
//
// Description: Takes an input clock signal and outputs a 2 bit counter value
//              that overflows consistently.
////////////////////////////////////////////////////////////////////////////////


module SevenSegmentCounter (
    // Inputs
    input clock,
    input [1:0] counterIn,
    // Outputs
    output reg [1:0] counterOut
    );

    always @(posedge clock) begin
        // Iterate counter value on clock input
        counterOut <= counterIn + 1;
    end

endmodule