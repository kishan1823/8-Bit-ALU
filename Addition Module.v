
module addition_module_8bit(
    input wire [07:0] A,
    input wire [07:0] B,
    output wire [7:0] Out,
    output wire Carry
);
	 
	wire [7:0] X;
	reg [7:0] Y;
	wire carry1, carry2, carry3, carry4, carry5, carry6, carry7;
	wire Overflow;
	
	full_adder fa0 (A[0], B[0], 1'b0, X[0], carry1);
	full_adder fa1 (A[1], B[1], carry1, X[1], carry2);
	full_adder fa2 (A[2], B[2], carry2, X[2], carry3);
	full_adder fa3 (A[3], B[3], carry3, X[3], carry4);
	full_adder fa4 (A[4], B[4], carry4, X[4], carry5);
	full_adder fa5 (A[5], B[5], carry5, X[5], carry6);
	full_adder fa6 (A[6], B[6], carry6, X[6], carry7);
	full_adder fa7 (A[7], B[7], carry7, X[7], Carry);
	
	assign Overflow = Carry^carry7;
	always @ ( * ) begin
		if (Overflow == 1)
			Y = 8'b0;
		else
			Y = X;
	end
	assign Out= Y;
endmodule
	
