module mux2 (

input logic [31:0] rd2,

input logic [31:0] immExt,
input logic aluSrc,

output logic [31:0] srcB


);


assign srcB = aluSrc ? immExt : rd2;





endmodule