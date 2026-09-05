module adder2(
input logic [31:0] pc,
input logic [31:0] immExt,
output logic [31:0] pcTarget


);

assign pcTarget = immExt + pc;




endmodule