module register(

input logic [4:0] a1,
input logic [4:0] a2,
input logic [4:0] a3,
input logic [31:0] wd,
input logic clk,
input logic we,
output logic [31:0] rd1,
output logic [31:0] rd2


);


logic [31:0] registerFile [31:0];


assign rd1 = (a1==5'b0) ? 32'b0 : registerFile [a1];

assign rd2 = (a2==5'b0) ? 32'b0 : registerFile [a2];


always_ff @ (posedge clk)
begin
    if(we && a3 != 5'b0)
        registerFile[a3] <= wd;
end





endmodule
