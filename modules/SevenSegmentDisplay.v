`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven Segment Display Controller
//
// Description: Takes an input clock signal and outputs a 2 bit counter value
//              that overflows consistently.
////////////////////////////////////////////////////////////////////////////////


module SevenSegmentDisplay (
    // Inputs
    input displayClock,
    input [3:0] nibbleA,
    input [3:0] nibbleB,
    input [3:0] nibbleC,
    input [3:0] nibbleD,
    // Outputs
    output reg [3:0] sevenSegmentEnable,
    output reg [7:0] sevenSegmentData
    );

    wire [1:0] sevenSegmentCounterFeedback;
    SevenSegmentCounter SevenSegmentCounter(
        displayClock,
        sevenSegmentCounterFeedback,
        sevenSegmentCounterFeedback
    );

    wire [3:0] enableNibble;
    EnableDecoder EnableDecoder(
        sevenSegmentCounterFeedback,
        enableNibble
    );

    wire [3:0] dataNibble;
    NibbleMux NibbleMux(
        sevenSegmentCounterFeedback,
        nibbleA,
        nibbleB,
        nibbleC,
        nibbleD,
        dataNibble
    );

    always @(counter) begin
        // Drive hex enable signal
        sevenSegmentEnable = ~enableNibble;

        // Drive hex data signals
        case(dataNibble)
            4'b0000: sevenSegmentData = 8'b00010001; // 0
            4'b0001: sevenSegmentData = 8'b11010111; // 1
            4'b0010: sevenSegmentData = 8'b00110010; // 2
            4'b0011: sevenSegmentData = 8'b10010010; // 3
            4'b0100: sevenSegmentData = 8'b11010100; // 4
            4'b0101: sevenSegmentData = 8'b10011000; // 5
            4'b0110: sevenSegmentData = 8'b00011000; // 6
            4'b0111: sevenSegmentData = 8'b11010011; // 7
            4'b1000: sevenSegmentData = 8'b00010000; // 8
            4'b1001: sevenSegmentData = 8'b10010000; // 9
            4'b1010: sevenSegmentData = 8'b01010000; // A
            4'b1011: sevenSegmentData = 8'b00011100; // b
            4'b1100: sevenSegmentData = 8'b00111001; // C
            4'b1101: sevenSegmentData = 8'b00010110; // d
            4'b1110: sevenSegmentData = 8'b00111000; // E
            4'b1111: sevenSegmentData = 8'b01111000; // F
        endcase
    end

endmodule