module main_decoder(

input logic [6:0] op,

output logic [1:0] immSrc,
output logic [1:0] aluOp ,
output logic aluSrc,
output logic regWrite,
output logic memWrite,
output logic resultSrc,
output logic branch


);

always_comb
begin  

case(op)

7'b0000011: begin
    regWrite = 1;
    immSrc = 2'b00;
    aluSrc = 1;
    memWrite = 0;
    resultSrc = 1;
    branch = 0;
    aluOp = 2'b00;

end
            7'b0100011: begin
                regWrite  = 1'b0;
                immSrc    = 2'b01;
                aluSrc    = 1'b1;
                memWrite  = 1'b1;
                resultSrc = 1'b0; 
                branch    = 1'b0;
                aluOp     = 2'b00;
            end

            7'b0110011: begin
                regWrite  = 1'b1;
                immSrc    = 2'b00; 
                aluSrc    = 1'b0;
                memWrite  = 1'b0;
                resultSrc = 1'b0;
                branch    = 1'b0;
                aluOp     = 2'b10;
            end

    
            7'b1100011: begin
                regWrite  = 1'b0;
                immSrc    = 2'b10;
                aluSrc    = 1'b0;
                memWrite  = 1'b0;
                resultSrc = 1'b0; 
                branch    = 1'b1;
                aluOp     = 2'b01;
            end

            7'b0010011: begin
                regWrite  = 1'b1;
                immSrc    = 2'b00;
                aluSrc    = 1'b1;
                memWrite  = 1'b0;
                resultSrc = 1'b0; 
                branch    = 1'b0;
                aluOp     = 2'b10;
            end


            default: begin
                regWrite  = 1'b0;
                immSrc    = 2'b00;
                aluSrc    = 1'b0;
                memWrite  = 1'b0;
                resultSrc = 1'b0;
                branch    = 1'b0;
                aluOp     = 2'b00;
            end



endcase
    
end




endmodule