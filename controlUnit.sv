module controlunit(
    input  logic [6:0] op,
    input  logic [2:0] funct3,
    input  logic       op5,
    input  logic       funct7,
    input  logic       zero,

    output logic       pcSrc,
    output logic       resultSrc,
    output logic       memWrite,
    output logic [2:0] aluControl,
    output logic       aluSrc,
    output logic [1:0] immSrc,
    output logic       regWrite
);

    logic [1:0] aluOp;
    logic       branch;

    main_decoder md (
        .op(op),
        .immSrc(immSrc),
        .aluOp(aluOp),
        .aluSrc(aluSrc),
        .regWrite(regWrite),
        .memWrite(memWrite),
        .resultSrc(resultSrc),
        .branch(branch)
    );

    alu_decoder ad (
        .aluOp(aluOp),
        .funct3(funct3),
        .op5(op5),
        .funct7(funct7),
        .aluControl(aluControl)
    );

    pcSrcBranch psb (
        .zero(zero),
        .branch(branch),
        .pcSrc(pcSrc)
    );

endmodule