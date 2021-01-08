
//////////////////////////////////////////////////////////////////////////////////
// Group: Dao Duy Hung - Nguyen Trong Nhat
// Module: Inverse Matrix 4x4
//
//////////////////////////////////////////////////////////////////////////////////
module inverse_matrix(clk,reset,inv_0,inv_1,inv_2,inv_3,inp_0,inp_1,inp_2,inp_3);

//input declaration
input clk, reset;

//reg declaration
reg [63:0]A[3:0];	//Input matrix A
reg [63:0]I[3:0];	//Identity matrix I
reg [63:0]mult;	//constant for multiplication

//integer declaration
integer i;
input [63:0] inp_0, inp_1, inp_2, inp_3;
output reg [63:0] inv_0,inv_1,inv_2,inv_3;




//at posedge of clk the outputs will be generated
always @ (posedge clk)
begin
	if(reset==1'b1)
	begin
	   //Assign input to reg A
		A[0]= inp_0;
		A[1]= inp_1;
		A[2]= inp_2;
		A[3]= inp_3;

		I[0]=16'b1;
		I[1]=16'b0;
		
		I[2]=16'b0;
		I[3]=16'b1;
		
		// Input matrix has form ---- A[0] A[1]----------
		// -------------------------- A[2] A[3]----------
		// First collumn equal to 1 0 
		// divide row1 for A[0]
		mult=A[0];

		A[0]=(A[0]/mult);
		A[1]=(A[1]/mult);
		
		I[0]=(I[0]/mult);
		I[1]=(I[1]/mult);
		
		// row2 = row2 - A[2] * row1

		mult=A[2];

		A[2]=A[2]-(A[0]*mult);
		A[3]=A[3]-(A[1]*mult);

		I[2]=I[2]-(I[0]*mult);
		I[3]=I[3]-(I[1]*mult);

		//second collumn
		mult=A[3];
		A[2]=(A[2]/mult);
		A[3]=(A[3]/mult);
		
		I[2]=(I[2]/mult);
		I[3]=(I[3]/mult);
		
		//rref
		mult=A[1];
		A[0]=A[0]-(mult*A[2]);
		A[1]=A[1]-(mult*A[3]);
		
		I[0]=I[0]-(mult*I[2]);
		I[1]=I[1]-(mult*I[3]);
		
		//inv = the matrix I of the left
		inv_0 = I[0];
		inv_1 = I[1];
		inv_2 = I[2];
		inv_3 = I[3];
	end
	
	else
	begin
		inv_0 <= 0;
		inv_1 <= 0;
		inv_2 <= 0;
		inv_3 <= 0;
	end
end

endmodule
//End of code