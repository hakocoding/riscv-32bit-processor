module pcSrcBranch(
    input logic zero,
    input logic branch,
    output logic pcSrc


);



assign pcSrc = (branch && zero) ? 1 : 0;


endmodule