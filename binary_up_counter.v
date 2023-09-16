module binary_up_counter(data,load,clk,rstn,count);

input [3:0] data;
input load,clk,rstn;
output reg [3:0] count;

always@(posedge clk)

begin

if(~rstn)
count <= 4'd0;

else if(load)
count <= data;

else
count <= count+1'b1;

end

endmodule
