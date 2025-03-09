`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg R;
    reg [2:0] S;
    reg [3:0] L;
    wire [3:0] Q;
    
    // instantiation
    shift_reg uut(
        .clk(clk),
        .R(R),
        .S(S),
        .L(L),
        .Q(Q)
    );

    // clock generation
    always #2 clk = ~clk;
    always #2 R = ~R;
    
    // test stimulus
    initial begin
        // initialized
        clk = 0;
        R = 1;
        L = 4'b0000;
        S = 3'b111;
        
        // HOLD
        #1; S = 3'b000; $display("Q(Old)=%b\t",Q);
        #3; $display("Operation=Hold\nS=%b\tQ(New)=%b\n", S, Q);
        
        // CIRCULAR SHIFT LEFT
        #5; S = S+1; $display("Q(Old)=%b\t",Q);
        #7; $display("Operation=Circular Shift Left\nS=%b\tQ(New)=%b\n", S, Q);
        
        // CIRCULAR SHIFT RIGHT
        #9; S = S+1; $display("Q(Old)=%b\t",Q);
        #11; $display("Operation=Circular Shift Right\nS=%b\tQ(New)=%b\n", S, Q);
        
        // LOGICAL SHIFT RIGHT
        #13; S = S+1; $display("Q(Old)=%b\t",Q);
        #15; $display("Operation=Logical Shift Right\nS=%b\tQ(New)=%b\n", S, Q);
        
        // LOGICAL SHIFT LEFT
        #17; S = S+1; $display("Q(Old)=%b\t",Q);
        #19; $display("Operation=Logical Shift Left\nS=%b\tQ(New)=%b\n", S, Q);
        
        // ARITHMETIC SHIFT LEFT
        #21; S = S+1; $display("Q(Old)=%b\t",Q);
        #23; $display("Operation=Arithmetic Shift Left\nS=%b\tQ(New)=%b\n", S, Q);
        
        // ARITHMETIC SHIFT RIGHT
        #25; S = S+1; $display("Q(Old)=%b\t",Q);
        #27; $display("Operation=Arithmetic Shift Right\nS=%b\tQ(New)=%b\n", S, Q);
        
        // LOAD
        #29; S = S+1; $display("Q(Old)=%b\t",Q);
        #31; $display("Operation=Load\nS=%b\tQ(New)=%b\n", S, Q);
        
        $finish;
    end
endmodule
