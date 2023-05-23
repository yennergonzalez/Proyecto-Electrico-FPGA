module demux1x8(In, OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH, S);
	input In;
	input [2:0] S;
	output OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH;
	
	wire inDemux1, inDemux2, inDemux3, inDemux4, inDemux5, inDemux6, inDemux7;
	
	// first demux tree level
	demux1x2 demux1 (.In(In), .OutA(inDemux2), .OutB(inDemux3), .S(S[2]));
	
	// second demux tree level
	demux1x2 demux2 (.In(inDemux2), .OutA(inDemux4), .OutB(inDemux5), .S(S[1]));
	demux1x2 demux3 (.In(inDemux3), .OutA(inDemux6), .OutB(inDemux7), .S(S[1]));
	
	// third demux tree level
	demux1x2 demux4 (.In(inDemux4), .OutA(OutA), .OutB(OutB), .S(S[0]));
	demux1x2 demux5 (.In(inDemux5), .OutA(OutC), .OutB(OutD), .S(S[0]));
	demux1x2 demux6 (.In(inDemux6), .OutA(OutE), .OutB(OutF), .S(S[0]));
	demux1x2 demux7 (.In(inDemux7), .OutA(OutG), .OutB(OutH), .S(S[0]));
endmodule