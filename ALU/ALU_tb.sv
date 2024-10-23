module ALU_tb;
logic [7:0] t_result, t_A , t_B;
logic t_C_out , t_Zero , t_Negative;
logic [1:0] t_control;

ALU   A1( t_A , t_B , t_control , t_C_out , t_Zero , t_Negative , t_result );

initial begin

t_control = 0;t_A = 1;t_B = 2; 
#10 t_control = 1; t_A = 5 ; t_B = 3;
#10 t_control = 2 ;t_A = 3 ; t_B = 2;
#10 t_control = 3 ;t_A = 3 ; t_B = 2;


end

initial begin 
$monitor("t_control = %d  t_A = %d  t_B = %d   t_resalt = %d",t_control,t_A,t_B,t_result);

end

endmodule 