module mux1(

input logic pcSrc,

input logic [31:0] pcPlus4,
input logic [31:0] pcTarget,

output logic [31:0] pcNext


);


assign pcNext = pcSrc ? pcTarget : pcPlus4;


endmodule