`timescale 1ns / 1ps

module FPGA_tb();
    reg clock,
        reset;
        
    reg  [7:0] input_1,
               input_2,
               BitFile;
               
    wire [7:0] sum;
               
    wire C_Out;
    
    FPGA    UUT(clock,
                reset,
                BitFile,
                input_1,
                input_2,
                sum,
                C_Out);
                
    initial begin
        clock   = 1'b0;
        BitFile = 8'b11100100;
        reset   = 1'b1;
        input_1 = 64;
        input_2 = 64;        
        
        #10
        reset   = 1'b0;
        
        #40
        reset   = 1'b1;
        
        #40
        reset   = 1'b0;
        input_1 = 100;
        input_2 = 100;
        
        #40
        reset   = 1'b1;
        
        #40
        reset   = 1'b0;
        input_1 = 64;
        input_2 = 128;
        
        #40
        reset   = 1'b1;
        
        #40
        reset   = 1'b0;
        input_1 = 8'b10101010;
        input_2 = 8'b01010101;
        
        #40
        reset   = 1'b1;
        
        #40
        reset   = 1'b0;
        input_1 = 127;
        input_2 = 1;
                        
        #40
        reset   = 1'b1;
        
        #40
        reset   = 1'b0;
        input_1 = 255;
        input_2 = 1;
    end
    
    always #5 clock = ~clock;
    
endmodule
