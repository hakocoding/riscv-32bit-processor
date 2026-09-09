module alu_decoder(
    input logic [1:0] aluOp,
    input logic [2:0] funct3,
    input logic op5,
    input logic funct7,
    output logic [2:0] aluControl

);


always_comb
begin

case(aluOp)


2'b00:
aluControl = 3'b000;

2'b01:
aluControl = 3'b001;


2'b10:begin

 case(funct3)
    3'b000: begin
        if({op5,funct7} == 2'b11)
            aluControl = 3'b001;
        else    
            aluControl = 3'b000;    
    end


    3'b010: aluControl = 3'b101;  
      

    3'b110: aluControl = 3'b010; 
         
    3'b111: aluControl = 3'b011; 
        
    default: aluControl = 3'b000;

    
 endcase
    

end

default: aluControl = 3'b000;

endcase
end


endmodule   