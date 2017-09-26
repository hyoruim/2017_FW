`timescale 1ns/1ns

module Counter4_Tb;

parameter tlimit = 400;
parameter ckPeriod = 7;

reg Reset = 1'b1, Ck = 1'b0;
reg [2:0] Mode = 3'b000;
reg [3:0] Din = 4'b0000;
reg R_In = 1'b0;
reg L_In = 1'b0;
wire [3:0] Out;

Counter4 U1 (Reset, Ck, Mode, Din, R_In, L_In, Out);

initial #tlimit $stop;   
initial #10 Reset = 1'b0; 
always #ckPeriod Ck = ~Ck;

always @(negedge Ck) begin
         Mode = $random; R_In = $random; L_In = $random; Din = $random;
end

integer result;
always @(posedge Ck) begin
    if (!Reset) begin
           result = $fopen ("result.txt");
           $fwrite (result, "time = %d, Mode = %b, R_In = %b, L_In = %b, Din = %b,  ", 
                           $time, Mode, R_In, L_In, Din);
           #2;
           $fdisplay (result, "Out = %b", Out);
    end
end

endmodule

