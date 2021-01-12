`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Analog Clock
//
// Description: Top level module for analog clock functionality.
////////////////////////////////////////////////////////////////////////////////

module AnalogClock (
    // Inputs
    input cmosClock,
    // Outputs
    output reg [3:0] sevenSegmentEnable,
    output reg [7:0] sevenSegmentData
    );

    wire secondClock, minuteClock, hourClock;
    ClockBuffer ClockBuffer(
        cmosClock,
        secondClock,
        minuteClock,
        hourClock
    );

endmodule