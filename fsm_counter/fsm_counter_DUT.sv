module fsm_counter_DUT();

//input clk,reset,en,
//output [3:0] num_1,
//output [2:0] num_2,
//output reg f
reg clk,reset,en;
reg [3:0] num_1;
reg [2:0] num_2;
wire f;

fsm_counter  m0(clk,reset,en,num_1,num_2,f);

always begin
        #5 clk = ~clk;  
    end

initial begin
clk = 0; reset = 0;
#10 reset = 1;
#10 reset = 0;en = 1;
#50
#10 num_1 = 0;num_2 = 5;
#10;
end

endmodule