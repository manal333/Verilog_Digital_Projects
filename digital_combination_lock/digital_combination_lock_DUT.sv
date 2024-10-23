module digital_combination_lock_DUT();

//input [3:0] Password,
//input clk,reset,
//output reg Led_on,Lock

reg [3:0] Password;
reg reset,clk;
wire Led_on,Lock;

digital_combination_lock tb (Password,clk,reset,Led_on,Lock);

 always begin
        #5 clk = ~clk;  
    end

initial begin
clk = 0; reset = 0;
#10 reset = 1;
#10 reset = 0;
#10 Password = 4'b1001; 
#10 Password = 4'b1101; 
#10 Password = 4'b0111; 
#10 Password = 4'b0111; reset = 1;
#10 reset = 0; 
#10 Password = 4'b0000; 
end

endmodule
