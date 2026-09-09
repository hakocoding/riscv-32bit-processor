module extender(
input logic [31:7] instruction,
input logic [1:0] immSrc,
output logic [31:0] immOut


);


always_comb

begin 
case(immSrc)

//I instruction caseleri
2'b00: immOut= {{20{instruction[31]}}, instruction[31:20]};

//S case
2'b01: immOut= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

//B case
2'b10: immOut= {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
//J case
2'b11: immOut= {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};




endcase

end



endmodule