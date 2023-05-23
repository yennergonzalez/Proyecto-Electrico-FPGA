module demux1x2 (In, OutA ,OutB, S);
	input In, S;
	output reg OutA, OutB;
	
	always @(*) begin
		if (S) begin
			OutB = In;
			OutA = 0;
		end
		else begin
			OutA = In;
			OutB = 0;
		end
	end
endmodule