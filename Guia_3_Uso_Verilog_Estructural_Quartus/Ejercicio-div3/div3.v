module div3(A,B,C,D,Out);
	//module ports
	input A, B, C, D;
	output Out;
	
	// inverted inputs
	wire notA, notB, notC, notD;
	
	// output of ANDs between two inputs
	wire notAnotB, notCnotD, CandD, BandC, notAnotD, AandD, AnotC, notBD,BnotD;
	
	// output of each minterm
	wire min0, min3, min6, min9, minc, minf;
	
	// minterms OR-ed
	wire min03, min69, mincf, min0369;
	
	// inverters
	not(notA, A);
	not(notB, B);
	not(notC, C);
	not(notD, D);
	
	// ANDs between two inputs
	and(notAnotB, notA, notB);
	and(notCnotD, notC, notD);
	and(CandD, C, D);
	and(BandC, B, C);
	and(notAnotD, notA, notD);
	and(AandD, A, D);
	and(AnotC, A, notC);
	and(notBD, notB, D);
	and(BnotD, B, notD);
	
	// minterms
	and(min0, notAnotB, notCnotD);
	and(min3, notAnotB, CandD);
	and(min6, notAnotD, BandC);
	and(min9, AnotC, notBD);
	and(minc, AnotC, BnotD);
	and(minf, AandD, BandC);
	
	// minterms OR-ed
	or(min03, min0, min3);
	or(min69, min6, min9);
	or(mincf, minc, minf);
	or(min0369, min03, min69);
	
	// Output
	or(Out, min0369, mincf);
endmodule