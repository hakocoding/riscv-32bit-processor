module alu(
    input logic [31:0] A, 
    input logic [31:0] B, 
    input logic [1:0] cntrl,
    output logic [31:0] result, 
    output logic zero

);

always_comb begin 
    
    case (cntrl)

        2'b00: result = A + B;
        2'b01: result = A - B;
        2'b11: result = A | B; 
        2'b10: result = A & B;
        default: result = 32'b0; 
    endcase    

    
end

assign zero = (result == 32'b0) ? 1'b1 : 1'b0;



endmodule