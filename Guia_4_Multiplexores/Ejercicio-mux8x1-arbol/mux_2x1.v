module mux_2x1 (A, B, S, Out);
	input A, B, S;
	output Out;
		
	assign Out = ((~S & A) | (S & B));
	
endmodule