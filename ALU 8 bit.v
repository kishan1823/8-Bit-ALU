module alu_8_bit (
	input wire [7:0] A,
	input wire [7:0] B,
	input wire [2:0] ALU_Sel,
	output reg [7:0] Out,
	output reg Cout
);
	wire [7:0] outand, outsub;
	wire Coutand, Coutsub;
	addition_module_8bit add ( A, B, outand, Coutand);
	subtraction_module_8bit  sub ( A, B, outsub, Coutsub);
	always @(*) begin
	    case (ALU_Sel)
	        3'b000: {Out, Cout} = {outand, Coutand}; 
	        3'b001: {Out, Cout} = {outsub, Coutsub}; 
	        3'b010: Out = A & B;
	        3'b011: Out = A | B;
	        3'b100: Out = A ^ B;
	        3'b101: Out = A * B;
	        3'b110: Out = A >> 1;
	        3'b111: Out = A << 1;
	    endcase
	end
endmodule
