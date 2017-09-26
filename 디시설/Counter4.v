`timescale 1ns/1ns

module Counter4 (Reset, Ck, Mode, Din, R_In, L_In, Out);
input Reset, Ck;
input [2:0] Mode;
input [3:0] Din;
input R_In, L_In;
output [3:0] Out;
wire [3:0] Out;

parameter LOAD = 3'b001, C_UP = 3'b010, C_DOWN = 3'b011, S_Right = 3'b100, S_Left = 3'b101, comp = 3'b110, swap = 3'b111;

reg [3:0] Register;

always @ (posedge Ck) begin
	if (Reset) //Synchronous Reset
	      Register <= 4'b0;
	else
	  case (Mode)  
	     LOAD: Register <= Din;
                          C_UP: Register <= Register + 1; //UP Counting
                          C_DOWN: Register <= Register - 1; //Down Counting
			  S_Right: Register <= {L_In, Register[3:1]};//right shift
			  S_Left: Register <= {Register[2:0], R_In};//Left shift
			  comp: Register <= ~Register; //1's complement of register contents
			  swap: Register <= {Register[1:0],Register[3:2]}; //swap right and left 2 bits
	     default: Register <= Register; 
	  endcase
end

assign Out = Register;

endmodule

