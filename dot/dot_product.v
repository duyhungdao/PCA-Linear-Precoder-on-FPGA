module dot_product(reset,clk,x1,x2,y1,y2,o);
	input reset, clk;
	input [63:0] x1,x2,y1,y2;
	output reg [63:0] o;
	
	always @(posedge clk)
	begin
		if(reset == 1)
		begin
			o = x1*y1 + x2*y2;
		end
	end

endmodule 