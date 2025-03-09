`timescale 1ns / 1ps

// sbox that operates on 5 bits
module sBoxLayer(
    input [4:0] x,
    output reg [4:0] Sx
    );
    
    always @(*) begin
        if (x[4] == 0) begin
            case(x[3:0])
                4'd0:   Sx = 5'd10;
                4'd1:   Sx = 5'd3;
                4'd2:   Sx = 5'd11;
                4'd3:   Sx = 5'd22;
                4'd4:   Sx = 5'd17;
                4'd5:   Sx = 5'd4;
                4'd6:   Sx = 5'd1;
                4'd7:   Sx = 5'd8;
                4'd8:   Sx = 5'd12;
                4'd9:   Sx = 5'd28;
                4'd10:  Sx = 5'd23;
                4'd11:  Sx = 5'd18;
                4'd12:  Sx = 5'd26;
                4'd13:  Sx = 5'd6;
                4'd14:  Sx = 5'd31;
                default:Sx = 5'd20;
            endcase
        end
        else begin // i.e. (x[2] == 1)
            case(x[3:0])
                4'd0:   Sx = 5'd15;
                4'd1:   Sx = 5'd24;
                4'd2:   Sx = 5'd29;
                4'd3:   Sx = 5'd13;
                4'd4:   Sx = 5'd14;
                4'd5:   Sx = 5'd19;
                4'd6:   Sx = 5'd30;
                4'd7:   Sx = 5'd5;
                4'd8:   Sx = 5'd25;
                4'd9:   Sx = 5'd27;
                4'd10:  Sx = 5'd7;
                4'd11:  Sx = 5'd0;
                4'd12:  Sx = 5'd16;
                4'd13:  Sx = 5'd21;
                4'd14:  Sx = 5'd2;
                default:Sx = 5'd9;
            endcase
        end
    end  
endmodule
