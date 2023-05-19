module div6(A, B, C, D, Out);
	// ports
	input A, B, C, D;
	output Out;
	
	// internal submodule outputs
	wire Out2, Out3;
	
	// divisor instances
	div2 divisor2 (.A(A), .B(B), .C(C), .D(D), .Out(Out2));
	div3 divisor3 (.A(A), .B(B), .C(C), .D(D), .Out(Out3));
	
	// output
	and(Out, Out2, Out3);

endmodule