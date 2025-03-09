`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg [4:0] x;
    wire [4:0] Sx;
    
    integer x1;
    
    sBoxLayer uut (
        .x(x),
        .Sx(Sx)
    );
    
    // Clock generation
    always #1 clk = ~clk;
    
    // Test stimulus
    initial begin
        clk = 0;
    
        for (x1=0; x1<32; x1=x1+1) begin
            x = x1;
            #2;
            $display("5-bit input=%b,\trow=%d,\tcolumn=%d,\tmapping value=%d,\t5-bit output=%b", x, x[4], x[3:0], Sx, Sx);
        end
    
        $finish;
    end


endmodule
