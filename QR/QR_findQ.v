`include "../dot/dot_product.v"
`include "../norm/norm.v"
module QR_findQ(clk,reset,A0,A1,A2,A3,Q0,Q1,Q2,Q3);
	input reset, clk;
	input [63:0]A0,A1,A2,A3;
	output reg [63:0]Q0,Q1,Q2,Q3;
	
	wire [63:0] dot1, dot2;
	reg [63:0] div;
	
	dot_product d1(reset,clk,A0,A2,A1,A3,dot1);
   dot_product d2(reset,clk,A0,A2,A0,A2,dot2);
	always @(posedge clk)
	begin
		Q0 = A0;
		Q2 = A2;
		
		div = dot1/dot2;
		
		Q1 = A1 - div*Q0;
		Q3 = A3 - div*Q2;
	   
		Q0 = Q0/norm1;
		Q2 = Q2/norm1;
		Q1 = Q1/norm2;
		Q2 = Q2/norm2;
	end
	
	wire [31:0] norm1, norm2;
	norm n1(clk,reset,Q0,Q2,norm1);
	norm n2(clk,reset,Q0,Q2,norm2);
	
	always @(posedge clk)
	begin

	end
	

endmodule