module ALU_tb;  

    reg [7:0] A, B;  
    reg [2:0] ALU_Sel;  
    wire [7:0] Out;  
    wire  Cout;  

    alu_8_bit tb ( .A(A), .B(B),  .ALU_Sel(ALU_Sel), .Out(Out), .Cout(Cout));
    assign Cout=0;
    initial 
	begin  
	//S$monitor("A=%b B=%b ALU_Sel=%b Out=%b Cout=%b ", A, B, ALU_Sel, Out, Cout);
        // Test Case 1: Addition (A + B)
        A = 8'b00001100;  // 12
        B = 8'b00000101;  // 5
        ALU_Sel = 3'b000; // Addition
        #10;

        // Test Case 2: Subtraction (A - B)
        A = 8'b00001100;  // 12
        B = 8'b00000101;  // 5
        ALU_Sel = 3'b001; // Subtraction
        #10;

        // Test Case 3: AND Operation
        A = 8'b11001100;
        B = 8'b10101010;
        ALU_Sel = 3'b010; // AND
        #10;

        // Test Case 4: OR Operation
        A = 8'b11001100;
        B = 8'b10101010;
        ALU_Sel = 3'b011; // OR
        #10;

        // Test Case 5: XOR Operation
        ALU_Sel = 3'b100; // XOR
        #10;

        // Test Case 6: Multiplication
        A = 8'b00001100;  // 12
        B = 8'b00000101;  // 5
        ALU_Sel = 3'b101; // Multiplication
        #10;

        // Test Case 7: Right Shift
	A = 8'b00001100;
        ALU_Sel = 3'b110; // Right Shift
        #10;

        // Test Case 8: Left Shift
        ALU_Sel = 3'b111; // Left Shift
        #10;
    end  
endmodule
