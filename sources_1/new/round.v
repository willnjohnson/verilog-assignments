`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Authors:     William Johnson
//              Joseph Curatolo 
//
// Create Date: 02/17/2024 01:38:32 PM
// Design Name: Lab 2 Part 3 Round
// Module Names: subAndPermute, addRoundKey
// Description: PRESENT-80
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// part 3a) call addRoundKey and combine S-box and Permutation layers
module doRound(
    input wire [63:0] state_in, wire [63:0] K,
    output wire [63:0] state_out
    );
      
    wire [63:0] round_out;
    wire [63:0] sub_out;

    // part 3b) perform round key (i.e. input XOR roundKey) 
    addRoundKey uutAddRoundKey (
        .in(state_in), .K(K),
        .out(round_out)
    );
    
    // Run sBoxLayer for 16 4-bit slices
    genvar i;
    generate
        for (i=0; i<64; i = i+4) begin: doSbox
            // Each Sbox produces result in sub_out wire
            sBoxLayer uutSBoxLayer (
                .x(round_out[i+3:i]),
                .Sx(sub_out[i+3:i])
            );
         end
    endgenerate
      
    // Permutation produces result in state_out wire
    pLayer uutPLayer (
        .in(sub_out),
        .out(state_out)
    );
endmodule

// part 3b) perform round key (i.e. input XOR roundKey) 
module addRoundKey(
    input wire [63:0] in, wire [63:0] K,
    output wire [63:0] out
    );
    assign out = in ^ K;
endmodule
