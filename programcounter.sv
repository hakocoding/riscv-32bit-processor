module programcounter(

input logic [31:0] pcNext,
input logic clk,
output logic [31:0] pc,
input logic reset

);


always_ff @ (posedge clk, posedge reset)
begin

if(reset)
pc <= 0;
else
pc <= pcNext;
end



endmodule