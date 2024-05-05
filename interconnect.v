`timescale 1ns / 1ps

module Routing_Channel(
    BitFile,
    num_1,
    num_2,
    carry_0,
    carry_A,
    carry_B,
    carry_C,
    carry_D,
    sum_A,
    sum_B,
    sum_C,
    sum_D,
    Cout,
    Cin_A,
    Cin_B,
    Cin_C,
    Cin_D,
    CLB_Sum_A,
    CLB_Sum_B,
    CLB_Sum_C,
    CLB_Sum_D,
    num_1_A,
    num_1_B,
    num_1_C,
    num_1_D,
    num_2_A,
    num_2_B,
    num_2_C,
    num_2_D
    );
    
    // input ports
    
    // bits 0 and 1 for CLB A
    // bits 2 and 3 for CLB B
    // bits 4 and 5 for CLB C
    // bits 6 and 7 for CLB D
    input [7:0] BitFile;
    
    input [7:0] num_1,
                num_2;   // numbers to be added.
                
    input       carry_0, // external carry in (if any)
                carry_A, // carry from CLB A
                carry_B, // carry from CLB B
                carry_C, // carry from CLB C
                carry_D; // carry from CLB D
                
    input [1:0] sum_A,   // sum from CLB A
                sum_B,   // sum from CLB B
                sum_C,   // sum from CLB C
                sum_D;   // sum from CLB D
                
    // output ports
    output reg  Cout,   // Last Carry Out
                Cin_A, // Carry Out for CLB A
                Cin_B, // Carry Out for CLB B
                Cin_C, // Carry Out for CLB C
                Cin_D; // Carry Out for CLB D
                       
    output reg [1:0]    CLB_Sum_A,
                        CLB_Sum_B,
                        CLB_Sum_C,
                        CLB_Sum_D;
                        
                        
    output reg [1:0]    num_1_A,
                        num_1_B,
                        num_1_C,
                        num_1_D,
                        num_2_A,
                        num_2_B,
                        num_2_C,
                        num_2_D;                   
                        
    always @ (*)
    begin
        // for A
        case(BitFile[1:0])
            2'b00:   begin CLB_Sum_A <= sum_A; Cin_A <= carry_0; num_1_A <= num_1[1:0]; num_2_A <= num_2[1:0]; end
            2'b01:   begin CLB_Sum_A <= sum_B; Cin_A <= carry_B; num_1_A <= num_1[3:2]; num_2_A <= num_2[3:2]; end
            2'b10:   begin CLB_Sum_A <= sum_C; Cin_A <= carry_C; num_1_A <= num_1[5:4]; num_2_A <= num_2[5:4]; end
            2'b11:   begin CLB_Sum_A <= sum_D; Cin_A <= carry_D; num_1_A <= num_1[7:6]; num_2_A <= num_2[7:6]; end
            default: begin CLB_Sum_A <= sum_A; Cin_A <= carry_0; num_1_A <= num_1[1:0]; num_2_A <= num_2[1:0]; end
        endcase
        // for B
        case(BitFile[3:2])
            2'b00:   begin CLB_Sum_B <= sum_A; Cin_B <= carry_0; num_1_B <= num_1[1:0]; num_2_B <= num_2[1:0]; end
            2'b01:   begin CLB_Sum_B <= sum_B; Cin_B <= carry_A; num_1_B <= num_1[3:2]; num_2_B <= num_2[3:2]; end
            2'b10:   begin CLB_Sum_B <= sum_C; Cin_B <= carry_C; num_1_B <= num_1[5:4]; num_2_B <= num_2[5:4]; end
            2'b11:   begin CLB_Sum_B <= sum_D; Cin_B <= carry_D; num_1_B <= num_1[7:6]; num_2_B <= num_2[7:6]; end
            default: begin CLB_Sum_B <= sum_B; Cin_B <= carry_A; num_1_B <= num_1[3:2]; num_2_B <= num_2[3:2]; end
        endcase
        // for C
        case(BitFile[5:4])
            2'b00:   begin CLB_Sum_C <= sum_A; Cin_C <= carry_0; num_1_C <= num_1[1:0]; num_2_C <= num_2[1:0]; end
            2'b01:   begin CLB_Sum_C <= sum_B; Cin_C <= carry_A; num_1_C <= num_1[3:2]; num_2_C <= num_2[3:2]; end
            2'b10:   begin CLB_Sum_C <= sum_C; Cin_C <= carry_B; num_1_C <= num_1[5:4]; num_2_C <= num_2[5:4]; end
            2'b11:   begin CLB_Sum_C <= sum_D; Cin_C <= carry_D; num_1_C <= num_1[7:6]; num_2_C <= num_2[7:6]; end
            default: begin CLB_Sum_C <= sum_C; Cin_C <= carry_B; num_1_C <= num_1[5:4]; num_2_C <= num_2[5:4]; end
        endcase
        // for D
        case(BitFile[7:6])
            2'b00:   begin CLB_Sum_D <= sum_A; Cin_D <= carry_0; num_1_D <= num_1[1:0]; num_2_D <= num_2[1:0]; end
            2'b01:   begin CLB_Sum_D <= sum_B; Cin_D <= carry_A; num_1_D <= num_1[3:2]; num_2_D <= num_2[3:2]; end
            2'b10:   begin CLB_Sum_D <= sum_C; Cin_D <= carry_B; num_1_D <= num_1[5:4]; num_2_D <= num_2[5:4]; end
            2'b11:   begin CLB_Sum_D <= sum_D; Cin_D <= carry_C; num_1_D <= num_1[7:6]; num_2_D <= num_2[7:6]; end
            default: begin CLB_Sum_D <= sum_D; Cin_D <= carry_C; num_1_D <= num_1[7:6]; num_2_D <= num_2[7:6]; end
        endcase
        // for external carry out
        case(BitFile[7:6])
            2'b00:   Cout <= carry_A;
            2'b01:   Cout <= carry_B;
            2'b10:   Cout <= carry_C;
            2'b11:   Cout <= carry_D;
            default: Cout <= carry_D;
        endcase
        
    end                               
                                     
endmodule
