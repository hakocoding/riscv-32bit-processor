module processor(

input logic clk,
input logic reset


);
    logic [31:0] instruction;
    logic zero;

    logic [1:0]  immSrc;
    logic [2:0]  aluControl;
    logic  aluSrc;      
    logic  pcSrc;
    logic  regWrite;
    logic  memWrite;
    logic  resultSrc;

    controlunit cu (
        .op(instruction[6:0]),
        .funct3(instruction[14:12]),
        .op5(instruction[5]),
        .funct7(instruction[30]),
        .zero(zero),
        
        .pcSrc(pcSrc),
        .resultSrc(resultSrc),
        .memWrite(memWrite),
        .aluControl(aluControl),
        .aluSrc(aluSrc),
        .immSrc(immSrc),
        .regWrite(regWrite)
    );

    datapath dp (
        .clk(clk),
        .reset(reset),
        .immSrc(immSrc),
        .aluControl(aluControl),
        .aluSrc(aluSrc),
        .pcSrc(pcSrc),
        .regWrite(regWrite),
        .memWrite(memWrite),
        .resultSrc(resultSrc),
        
        .instruction(instruction), 
        .zero(zero)                
    );

endmodule