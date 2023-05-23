module sevensegdemux8x1 (In, S, Seg0, Seg1, Seg2, Seg3, Seg4, Seg5, Seg6, SegDP);
//wire demuxA, demuxB, demuxC, demuxD, demuxE, demuxF, demuxG, demuxH;
input In;
input [2:0] S;

output Seg0, Seg1, Seg2, Seg3, Seg4, Seg5, Seg6, SegDP;
wire OutA, OutB, OutC, OutD, OutE, OutF, OutG, OutH;
wire notOutA, notOutB, notOutC, notOutD, notOutE, notOutF, notOutG, notOutH;

demux1x8 demux (.In(In), .OutA(OutA), .OutB(OutB), .OutC(OutC), .OutD(OutD), .OutE(OutE), .OutF(OutF), .OutG(OutG), .OutH(OutH), .S(S));
assign notOutA = ~OutA;
assign notOutB = ~OutB;
assign notOutC = ~OutC;
assign notOutD = ~OutD;
assign notOutE = ~OutE;
assign notOutF = ~OutF;
assign notOutG = ~OutG;
assign notOutH = ~OutH;

mux_2x1 muxSeg0 (.A(1'b1), .B(notOutA), .S(OutA), .Out(Seg0));
mux_2x1 muxSeg1 (.A(1'b1), .B(notOutB), .S(OutB), .Out(Seg1));
mux_2x1 muxSeg2 (.A(1'b1), .B(notOutC), .S(OutC), .Out(Seg2));
mux_2x1 muxSeg3 (.A(1'b1), .B(notOutD), .S(OutD), .Out(Seg3));
mux_2x1 muxSeg4 (.A(1'b1), .B(notOutE), .S(OutE), .Out(Seg4));
mux_2x1 muxSeg5 (.A(1'b1), .B(notOutF), .S(OutF), .Out(Seg5));
mux_2x1 muxSeg6 (.A(1'b1), .B(notOutG), .S(OutG), .Out(Seg6));
mux_2x1 muxSegDP (.A(1'b1), .B(notOutH), .S(OutH), .Out(SegDP));
endmodule