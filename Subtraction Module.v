module subtraction_module_8bit(
    input wire [07:0] A,
    input wire [07:0] B,
    output wire [07:0] Out,
    output wire Cout
);


	wire [7:0] X;
	reg [7:0] Y;
	wire borrow1, borrow2, borrow3, borrow4, borrow5, borrow6, borrow7;
	wire Overflow;
	subtractor sub0 (A[0],B[0],1'b0,X[0],borrow1);
	subtractor sub1 (A[1],B[1],borrow1,X[1],borrow2);
	subtractor sub2 (A[2],B[2],borrow2,X[2],borrow3);
	subtractor sub3 (A[3],B[3],borrow3,X[3],borrow4);
	subtractor sub4 (A[4],B[4],borrow4,X[4],borrow5);
	subtractor sub5 (A[5],B[5],borrow5,X[5],borrow6);
	subtractor sub6 (A[6],B[6],borrow6,X[6],borrow7);
	subtractor sub7 (A[7],B[7],borrow7,X[7],Cout);
	
	assign Overflow = Cout^borrow7;
	always @ ( * ) begin
		if (Overflow == 1)
			Y = 8'b0;
		else
			Y = X;
	end
	assign Out=Y;
endmodule

