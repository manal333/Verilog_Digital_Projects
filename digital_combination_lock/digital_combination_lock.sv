module digital_combination_lock
(
       input [3:0] Password,
       input clk,reset,
       output reg Led_on,Lock
);

  reg Correct_Password = 4'b0000;
  reg [1:0]count;
  
  always @(posedge clk ,posedge reset )
  begin 
    if(reset)
    begin 
    count <= 2'b00;
    Led_on <= 0;
    Lock <= 0;
    end 
  
    else
    begin
    if(Password == Correct_Password)
    begin
    Led_on <= 1;
    Lock <= 0;
    end 
    else
    begin 
    Led_on <= 0;
    count <= count + 1;
    if(count >= 2'b11)
    begin 
    Lock <= 1;
    end
    end
    end
  
  end

endmodule 