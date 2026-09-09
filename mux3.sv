module mux3(

input logic [31:0] aluResult,
input logic [31:0] memoryReadData,
input logic [31:0] pcPlus4,
input logic [1:0] resultSrc,

output logic [31:0] result

);


always_comb
begin

case(resultSrc)

2'b10: result = pcPlus4;
2'b00: result = aluResult;
2'b01: result = memoryReadData;

endcase
end

endmodule