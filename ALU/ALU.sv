module ALU(input logic [7:0] A,B,input logic [1:0] control,output logic C_out,Zero,Negative,output logic [7:0] Reselt);
always_comb
begin
case(control[1:0])

0 : {C_out,Reselt} = A + B+control[0];
1 : Reselt = A - B;
2 : Reselt = A & B;
3 : Reselt = A | B;
default : Reselt = 0;
endcase
end
assign Zero = ~(|Reselt);
assign Negative = Reselt[7];

endmodule
