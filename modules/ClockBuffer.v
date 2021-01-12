`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Clock Buffer
//
// Description: Takes the input 100MHz clock oscillator signal and divides it to
//              acceptable values. Uses three clock buffer counters to divide.
////////////////////////////////////////////////////////////////////////////////

module ClockBuffer (
    // Inputs
    input cmosClock,        // Input 100MHz clock
    // Outputs
    output reg secondClock  // Inverts every half second
    output reg minuteClock, // Inverts every half minute
    output reg hourClock,   // Inverts every half hour
    output reg displayClock // 200Hz signal for display switching
    );

    wire [25:0] secondCounterFeedback;
    wire secondClockFeedback;
    SecondCounter SecondCounter(
        cmosClock,
        secondCounterFeedback,
        secondClockFeedback,
        secondCounterFeedback,
        secondClockFeedback
    );

    wire [4:0] minuteCounterFeedback;
    wire minuteClockFeedback;
    MinuteCounter MinuteCounter(
        secondClockFeedback,
        minuteCounterFeedback,
        minuteClockFeedback,
        minuteCounterFeedback,
        minuteClockFeedback
    );

    wire [4:0] hourCounterFeedback;
    wire hourClockFeedback;
    HourCounter HourCounter(
        minuteClockFeedback,
        hourCounterFeedback,
        hourClockFeedback,
        hourCounterFeedback,
        hourClockFeedback
    );

    wire [17:0] displayCounterFeedback;
    wire displayClockFeedback;
    DisplayCounter DisplayCounter(
        cmosClock,
        displayCounterFeedback,
        displayClockFeedback,
        displayCounterFeedback,
        displayClockFeedback
    );

    always @(*) begin
        // Driving clock outputs
        secondClock <= secondClockFeedback;
        minuteClock <= minuteClockFeedback;
        hourClock   <= hourClockFeedback;

        // Driving display signal
        displayClock <= displayClockFeedback;
    end

endmodule