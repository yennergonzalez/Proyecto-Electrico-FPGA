module mux8x1_tree (A, B, C, D, E, F, G, H, S0, S1, S2, Out);
	// ports
	input A, B, C, D, E, F, G, H, S0, S1, S2;
	output Out;
	
	// muxes outputs
	wire mux1_out, mux2_out, mux3_out, mux4_out, mux5_out, mux6_out;
	
	// first tree level
	mux_2x1 mux1 (.A(A), .B(B), .S(S2), .Out(mux1_out));
	mux_2x1 mux2 (.A(C), .B(D), .S(S2), .Out(mux2_out));
	mux_2x1 mux3 (.A(E), .B(F), .S(S2), .Out(mux3_out));
	mux_2x1 mux4 (.A(G), .B(H), .S(S2), .Out(mux4_out));
	
	// second tree level
	mux_2x1 mux5 (.A(mux1_out), .B(mux2_out), .S(S1), .Out(mux5_out));
	mux_2x1 mux6 (.A(mux3_out), .B(mux4_out), .S(S1), .Out(mux6_out));
	
	// third tree level
	mux_2x1 mux7 (.A(mux5_out), .B(mux6_out), .S(S0), .Out(Out));
endmodule