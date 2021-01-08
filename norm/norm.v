//////////////////////////////////////////////////////////////////////
// Group: Dao Duy Hung - Nguyen Trong Nhat
// Module: get norm of a vector 2 dimension
//////////////////////////////////////////////////////////////////////

`include "../norm/sq.v"
`include "../norm/sqrt.v"
module norm(clk,reset,x1,x2,n);
	input clk,reset;
	
	input [63:0] x1,x2;
	output wire [31:0]n;
	
	wire [31:0] n2;
	wire [31:0] n1;
	sq sq1(clk,reset,x1,x2,n1);
	sqrt sqrt1(clk,reset,n1,n2);
	
endmodule
 