module datapath(
input logic clk,
input logic reset,
input logic [1:0] immSrc,
input logic [2:0] aluControl,
input logic aluSrc,
input logic pcSrc,
input logic regWrite,
input logic memWrite,
input logic resultSrc,

output logic zero,
output logic [31:0] instruction
);

logic [31:0] pcNext;
logic [31:0] pc;
logic [31:0] pcPlus4;
logic [31:0] srcB;
logic [31:0] srcA;
logic [31:0] aluResult;
logic [31:0] writeData;
logic [31:0] readData;
logic [31:0] result;
logic [31:0] pcTarget;
logic [31:0] immExt;



adder1 a_adder1(

    .pc(pc),
    .pcPlus4(pcPlus4)
);

adder2 a_adder2(

    .pc(pc),
    .immExt(immExt),
    .pcTarget(pcTarget)
);

dmem a_data_memory(

    .clk(clk),
    .we(memWrite),
    .wd(writeData),
    .a(aluResult),
    .rd(readData)
);

extender a_extender(
    .instruction(instruction[31:7]),
    .immSrc(immSrc),
    .immOut(immExt)

);
imem a_instructionMemory(
    .a(pc),
    .rd(instruction)

);

mux1 a_mux1(
    .pcSrc(pcSrc),
    .pcPlus4(pcPlus4),
    .pcTarget(pcTarget),
    .pcNext(pcNext)
);

mux2 a_mux2(
    .rd2(writeData),
    .srcB(srcB),
    .immExt(immExt),
    .aluSrc(aluSrc)
);

mux3 a_mux3(
    .pcPlus4(pcPlus4),
    .memoryReadData(readData),
    .aluResult(aluResult),
    .resultSrc(resultSrc),
    .result(result)
);

programcounter a_programcounter(
    .pcNext(pcNext),
    .pc(pc),
    .clk(clk),
    .reset(reset)

);

register a_register(


.a1(instruction[19:15]),
.a2(instruction[24:20]),
.a3(instruction[11:7]),
.wd(result),
.clk(clk),
.we(regWrite),
.rd1(srcA),
.rd2(writeData)

);

alu a_alu(
    .A(srcA), 
    .B(srcB), 
    .cntrl(aluControl),
    .result(aluResult),
    .zero(zero)
);


endmodule