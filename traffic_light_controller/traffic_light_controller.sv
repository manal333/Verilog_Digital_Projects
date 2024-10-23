module traffic_light_controller
(
       input N_Sensor,S_Sensor,E_Sensor,W_Sensor,
       input clk,reset,NS_pedestrian_button,EW_pedestrian_button,
       output reg[2:0] NS_direction,EW_direction,
       output reg NS_pedestrian_Signal,EW_pedestrian_Signal
);
reg [1:0]state;
reg [3:0]timer;

//states

localparam NS_GREEN  = 2'b00;
localparam NS_YELLOW = 2'b01;
localparam EW_GREEN  = 2'b10;
localparam EW_YELLOW = 2'b11;

always @(posedge clk or posedge reset)
begin
  if (reset)
  begin
  state <= NS_GREEN;
  timer <= 4'b0000;
  end

else 
begin
 case (state)
 
 //====case zero===
 
  NS_GREEN: begin
  NS_direction <= 3'b001;  
  EW_direction <= 3'b100;
  timer <= timer + 1;
  //check if there are cars in NS direction --> if no skip green
  if (timer >= 10 || (N_Sensor == 0 && S_Sensor == 0)) 
begin  
   state <= NS_YELLOW;
   timer <= 4'b0000;
end
   end

 //====case one===

   NS_YELLOW: begin
   NS_direction <= 3'b010;  
   EW_direction <= 3'b100;
   timer <= timer + 1;
   if (timer >= 10)
begin  
   state <= EW_GREEN;
   timer <= 4'b0000;
end
   end

 //====case two===

   EW_GREEN: begin
   NS_direction <= 3'b100;  
   EW_direction <= 3'b001;
   timer <= timer + 1;
   
 //check if there are cars in EW direction --> if no skip green
   
   if (timer >= 10 || (E_Sensor == 0 && W_Sensor == 0)) 
begin
   state <= EW_YELLOW;
   timer <= 4'b0000;
end
   end

 //====case three===

   EW_YELLOW: begin
   NS_direction <= 3'b100;  
   EW_direction <= 3'b010;
   timer <= timer + 1;
   if (timer >= 10) 
begin
   state <= NS_GREEN;
   timer <= 4'b0000;
end
   end
   endcase
 
 //check pedestrian button 
 
   if (NS_pedestrian_button && state == EW_GREEN) 
begin
   NS_pedestrian_Signal <= 1; 
end
   else
begin
   NS_pedestrian_Signal <= 0; 
end


if (EW_pedestrian_button && state == NS_GREEN)
begin
    EW_pedestrian_Signal <= 1;  
end 
  else 
begin
  EW_pedestrian_Signal <= 0; 
end
  end
  
  
end



endmodule
