`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Authors:     William Johnson
//              Joseph Curatolo 
//
// Create Date: 02/17/2024 01:38:32 PM
// Design Name: Lab 2 Part 1 Substitution
// Module Name: sBoxLayer
// Description: PRESENT-80
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// substitution module sBoxLayer() that takes in x to produce S(x)
module sBoxLayer(
    input [3:0] x,
    output reg [3:0] Sx
    );
    
    always @(*) begin
        case(x)                    // Substitutions:
            4'h0:   Sx = 4'hC;     // 0->C
            4'h1:   Sx = 4'h5;     // 1->5
            4'h2:   Sx = 4'h6;     // 2->6
            4'h3:   Sx = 4'hB;     // 3->B
            4'h4:   Sx = 4'h9;     // 4->9
            4'h5:   Sx = 4'h0;     // 5->0
            4'h6:   Sx = 4'hA;     // 6->A
            4'h7:   Sx = 4'hD;     // 7->D
            4'h8:   Sx = 4'h3;     // 8->3
            4'h9:   Sx = 4'hE;     // 9->E
            4'hA:   Sx = 4'hF;     // A->F
            4'hB:   Sx = 4'h8;     // B->8
            4'hC:   Sx = 4'h4;     // C->4
            4'hD:   Sx = 4'h7;     // D->7
            4'hE:   Sx = 4'h1;     // E->1
            default:Sx = 4'h2;     // F->2
        endcase    
    end  
endmodule
