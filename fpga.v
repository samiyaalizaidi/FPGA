`timescale 1ns / 1ps

module FPGA(
    clock,
    reset,
    BitFile,
    input_1,
    input_2,
    sum,
    C_Out
    );
    
    // I/O Ports
    input clock,
          reset;
          
    input  [7:0]  input_1,
                  input_2,
                  BitFile;
                
    output [7:0]  sum;
    
    output C_Out;
        
    // Internal Wires
    wire [1:0] sum_A, sum_B, sum_C, sum_D; 
    wire carry_0, carry_A, carry_B, carry_C, carry_D;
    wire C_Out, Cin_A, Cin_B, Cin_C, Cin_D;
    wire [1:0] CLB_Sum_A, CLB_Sum_B, CLB_Sum_C, CLB_Sum_D;
    wire [1:0] num_1_A, num_1_B, num_1_C, num_1_D;
    wire [1:0] num_2_A, num_2_B, num_2_C, num_2_D;
    
    Routing_Channel  IC (BitFile, input_1, input_2, 1'b0, carry_A, carry_B, carry_C, carry_D,
                         sum_A, sum_B, sum_C, sum_D, C_Out, Cin_A, Cin_B, Cin_C, Cin_D,
                         CLB_Sum_A, CLB_Sum_B, CLB_Sum_C, CLB_Sum_D, 
                         num_1_A, num_1_B, num_1_C, num_1_D,
                         num_2_A, num_2_B, num_2_C, num_2_D
                         );
    
    CLB   CLB_A(reset, 
                clock,
                Cin_A,
                num_1_A,
                num_2_A,
                sum_A,
                carry_A
                );
                
    CLB   CLB_B(reset, 
                clock,
                Cin_B,
                num_1_B,
                num_2_B,
                sum_B,
                carry_B
                );
                
    CLB   CLB_C(reset, 
                clock,
                Cin_C,
                num_1_C,
                num_2_C,
                sum_C,
                carry_C
                );
                
    CLB   CLB_D(reset, 
                clock,
                Cin_D,
                num_1_D,
                num_2_D,
                sum_D,
                carry_D
                );
    
    assign sum = {CLB_Sum_D, CLB_Sum_C, CLB_Sum_B, CLB_Sum_A};
endmodule
