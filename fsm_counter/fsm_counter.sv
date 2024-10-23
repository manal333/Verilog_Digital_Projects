module fsm_counter
(
       input clk,reset,en,
       output [3:0] num_1,
       output [2:0] num_2,
       output reg f
);

reg [3:0] state_reg_1,state_next_1;
reg [2:0] state_reg_2,state_next_2;

localparam s0=0,s1=1,s2=2,s3=3,s4=4,
s5=5,s6=6,s7=7,s8=8,s9=9;
localparam s00=0,s10=1,s20=2,s30=3,s40=4,s50=5;


always @(posedge clk,posedge reset)
begin
    if(reset)
     begin
     state_reg_1 <= 0;
     state_reg_2 <= 0;
     end
   else 
begin
     state_reg_1 <= state_next_1;
     state_reg_2 <= state_next_2;
end

if((state_reg_2 == 5) && (state_reg_1 == 0))
 begin
 f <= 1;
end
 else 
begin
 f <= 0;
end
end

always @(*)
begin
    if(en)
begin
    case(state_reg_1)
    
     s0 : state_next_1 <= s1;
     s1 : state_next_1 <= s2;
     s2 : state_next_1 <= s3;
     s3 : state_next_1 <= s4;
     s4 : state_next_1 <= s5;
     s5 : state_next_1 <= s6;
     s6 : state_next_1 <= s7;
     s7 : state_next_1 <= s8;
     s8 : state_next_1 <= s9;
     s9 : state_next_1 <= s0;
     default : state_next_1 <= state_reg_1;
     endcase
end
    else
      begin
       state_next_1 <= state_reg_1;
       end

 if(state_next_1 == s0)
begin 
    case(state_reg_2)
    s00 : state_next_2 <= s10;
    s10 : state_next_2 <= s20;
    s20 : state_next_2 <= s30;
    s30 : state_next_2 <= s40;
    s40 : state_next_2 <= s50;
    s50 : state_next_2 <= s00;
    default : state_next_2 <= state_reg_2;
     endcase
end
   else
      begin
       state_next_2 <= state_reg_2;
       end
end



assign num_1 = state_reg_1;
assign num_2 = state_reg_2;

endmodule