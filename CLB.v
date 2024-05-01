`timescale 1ns / 1ps

module CLB(
        reset, 
        clock,
        C_In,
        input_1,
        input_2,
        sum,
        C_Out
    );
    
    /*
    This module performs addition using a LUT.
        -> addition of two 2-bit numbers.
        -> one input is Cout.
        -> 32 possible combinations.
    */
    
    // I/O ports:    
    input       reset,
                clock,
                C_In;      // Carry in
    
    input [1:0] input_1,
                input_2;
    
    // sum of the addition.
    output [1:0] sum;
    reg    [1:0] sum;
    
    // carry if there is an overflow after addition.
    output       C_Out;
    reg          C_Out;
    
    always @ (posedge clock or
              posedge reset)
    begin   
            if (reset) 
            begin 
                sum   = 2'b00;
                C_Out = 1'b0;
            end
            else begin
                // LUT for addition
                case({C_In, input_1, input_2})
                5'b00000: begin sum = 2'b00; C_Out = 1'b0; end
                5'b00001: begin sum = 2'b01; C_Out = 1'b0; end
                5'b00010: begin sum = 2'b10; C_Out = 1'b0; end
                5'b00011: begin sum = 2'b11; C_Out = 1'b0; end
                5'b00100: begin sum = 2'b01; C_Out = 1'b0; end
                5'b00101: begin sum = 2'b10; C_Out = 1'b0; end
                5'b00110: begin sum = 2'b11; C_Out = 1'b0; end
                5'b00111: begin sum = 2'b00; C_Out = 1'b1; end
                5'b01000: begin sum = 2'b10; C_Out = 1'b0; end
                5'b01001: begin sum = 2'b11; C_Out = 1'b0; end
                5'b01010: begin sum = 2'b00; C_Out = 1'b1; end
                5'b01011: begin sum = 2'b01; C_Out = 1'b1; end
                5'b01100: begin sum = 2'b11; C_Out = 1'b0; end
                5'b01101: begin sum = 2'b00; C_Out = 1'b1; end
                5'b01110: begin sum = 2'b01; C_Out = 1'b1; end
                5'b01111: begin sum = 2'b10; C_Out = 1'b1; end
                5'b10000: begin sum = 2'b01; C_Out = 1'b0; end
                5'b10001: begin sum = 2'b10; C_Out = 1'b0; end
                5'b10010: begin sum = 2'b11; C_Out = 1'b0; end
                5'b10011: begin sum = 2'b00; C_Out = 1'b1; end
                5'b10100: begin sum = 2'b10; C_Out = 1'b0; end
                5'b10101: begin sum = 2'b11; C_Out = 1'b0; end
                5'b10110: begin sum = 2'b00; C_Out = 1'b1; end
                5'b10111: begin sum = 2'b01; C_Out = 1'b1; end
                5'b11000: begin sum = 2'b11; C_Out = 1'b0; end
                5'b11001: begin sum = 2'b00; C_Out = 1'b1; end
                5'b11010: begin sum = 2'b01; C_Out = 1'b1; end
                5'b11011: begin sum = 2'b10; C_Out = 1'b1; end
                5'b11100: begin sum = 2'b00; C_Out = 1'b1; end
                5'b11101: begin sum = 2'b01; C_Out = 1'b1; end
                5'b11110: begin sum = 2'b10; C_Out = 1'b1; end
                5'b11111: begin sum = 2'b11; C_Out = 1'b1; end
                default:  begin sum = 2'b00; C_Out = 1'b0; end 
                endcase
            end
    end
endmodule