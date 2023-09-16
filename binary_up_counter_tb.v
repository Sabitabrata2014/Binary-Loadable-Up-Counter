`timescale 1ns / 1ps

module binary_up_counter_tb;

reg [3:0] data;
reg load,clk,rstn;
wire [3:0] count;

parameter CYCLE = 10;

binary_up_counter DUT(data,load,clk,rstn,count);

always

begin

#(CYCLE/2); clk = 1'b0;
#(CYCLE/2); clk = 1'b1;

end

task reset_t;

begin

@(negedge clk);
rstn = 1'b0;
@(negedge clk);
rstn = 1'b1;

end

endtask

task load_t(input l, input [3:0] d);

begin

@(negedge clk);
load = l;
data = d;

end

endtask

initial

begin

reset_t;

#100;

load_t(1'b1,4'd13);
load_t(1'b0,4'd13);

#150;

reset_t;

#100;

load_t(1'b1,4'd8);
load_t(1'b0,4'd8);

#200;



end

endmodule

