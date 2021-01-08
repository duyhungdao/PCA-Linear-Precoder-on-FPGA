//////////////////////////////////////////////////////////////////////////////////
// Group: Dao Duy Hung - Nguyen Trong Nhat
// Module: Inverse Matrix 4x4
//
//////////////////////////////////////////////////////////////////////////////////
`include "../QR/QR_findQ.v"
`include "../Inversematrix/inverse_matrix.v"
module QR_decomposition(clk,reset,A0,A1,A2,A3,Q0,Q1,Q2,Q3,R0,R1,R2,R3);
	input reset, clk;
	input [63:0] A0,A1,A2,A3;
	output wire [63:0] Q0,Q1,Q2,Q3;
	output wire [63:0] R0,R1,R2,R3;
	
	QR_findQ Qfind1(clk,reset,A0,A1,A2,A3,Q0,Q1,Q2,Q3);
	wire [63:0] inv1, inv2, inv3, inv0;

	inverse_matrix(clk,reset,Q0,Q1,Q2,Q3,inv0,inv1,inv2,inv3);
	
	mul_matrix mm1(clk,reset,inv0,inv1,inv2,inv3,A0,A1,A2,A3,R0,R1,R2,R3);
endmodule


