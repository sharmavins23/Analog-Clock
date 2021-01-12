`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Enable Signal Decoder
//
// Description: Takes a two bit input signal and decodes it to four outputs.
//              Outputs are serialized in a bus.
////////////////////////////////////////////////////////////////////////////////


module EnableDecoder (
    // Inputs
    input [1:0] signalIn,
    // Outputs
    output reg [3:0] signalOut
    );

    always @(*) begin
        case(signalIn)
            2'b11: signalOut = 4'b1000;
            2'b10: signalOut = 4'b0100;
            2'b01: signalOut = 4'b0010;
            2'b00: signalOut = 4'b0001;
        endcase
    end

endmodule