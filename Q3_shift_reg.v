`timescale 1ns / 1ps

module shift_reg(
    input clk,                  // clock - 1 bit (low or high)
    input R,                    // reset (which resets Q to binary 1110) - 1 bit (low or high)
    input [2:0] S,              // shift control (i.e. opcode) - 3 bits
    input [3:0] L,              // data in (used for loading) - 4 bits
    output reg signed [3:0] Q   // output (IMPORTANT: signed to support proper use of <<< and >>>) - 4 bits
    );

    always @(posedge clk, posedge R) begin
        if (R) begin
            assign Q = 4'b1110; // set Q's default value when shift register is reset
        end else begin
            case(S) // S = S2, S1 S0
                3'b000:  assign Q = Q;
                3'b001:  assign Q = {Q[2:0], Q[3]};
                3'b010:  assign Q = {Q[0], Q[3:1]};
                3'b011:  assign Q = Q >> 1;
                3'b100:  assign Q = Q << 1;
                3'b101:  assign Q = Q <<< 1;
                3'b110:  assign Q = Q >>> 1;
                default: assign Q = L; // S = 3'b111
            endcase
        end
    end
endmodule
