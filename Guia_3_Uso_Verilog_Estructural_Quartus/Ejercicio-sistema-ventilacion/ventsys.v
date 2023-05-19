module ventsys (temp, gas, presence, manual, Out);
	// ports
	input temp, gas, presence, manual;
	output Out;
	
	// intermediate signals
	wire tempORgas, presenceANDtempORgas;
	or (tempORgas, temp, gas);
	and (presenceANDtempORgas, tempORgas, presence);
	
	// output
	or(Out, presenceANDtempORgas, manual);
endmodule