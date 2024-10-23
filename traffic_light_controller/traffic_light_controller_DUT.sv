module traffic_light_controller_DUT();

//input N_Sensor,S_Sensor,E_Sensor,W_Sensor,
//input clk,reset,NS_pedestrian_button,EW_pedestrian_button,
//output reg[2:0] NS_direction,EW_direction,
//output reg NS_pedestrian_Signal,EW_pedestrian_Signal
reg N_Sensor,S_Sensor,E_Sensor,W_Sensor;
reg [2:0] NS_direction,EW_direction;
reg reset,clk,NS_pedestrian_button,EW_pedestrian_button;
wire NS_pedestrian_Signal,EW_pedestrian_Signal;

traffic_light_controller tb (N_Sensor,S_Sensor,E_Sensor,W_Sensor,clk,reset,NS_pedestrian_button,EW_pedestrian_button,
NS_direction,EW_direction,NS_pedestrian_Signal,EW_pedestrian_Signal);

 always begin
        #5 clk = ~clk;  
    end

initial begin
clk = 0; reset = 0;NS_pedestrian_button = 0;EW_pedestrian_button = 0;
#10
reset = 1;
#10
reset = 0;N_Sensor = 1;S_Sensor = 1;E_Sensor = 1;W_Sensor = 1;
#100 reset = 0;NS_pedestrian_button = 0;EW_pedestrian_button = 0;
#100 
#100
#100

NS_pedestrian_button = 1;EW_pedestrian_button = 1;
#200;
reset = 1;
#10
reset = 0;N_Sensor = 0;S_Sensor = 0;E_Sensor = 1;W_Sensor = 1;
#100 reset = 0;NS_pedestrian_button = 0;EW_pedestrian_button = 0;
#100 
#100
#100

NS_pedestrian_button = 1;EW_pedestrian_button = 1;
#200;
reset = 1;
#10
reset = 0;N_Sensor = 1;S_Sensor = 1;E_Sensor = 0;W_Sensor = 0;
#100 reset = 0;NS_pedestrian_button = 0;EW_pedestrian_button = 0;
#100 
#100
#100

NS_pedestrian_button = 1;EW_pedestrian_button = 1;
#200;
#100 reset = 0;NS_pedestrian_button = 0;EW_pedestrian_button = 0;
end

endmodule