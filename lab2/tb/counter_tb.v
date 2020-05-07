`timescale 1ns / 1ps
module counter_tb(

    );

localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = (1000 / CLK_FREQ_MHZ) / 2;


reg          clk100_i;
reg [9:0]   sw_i;
wire [9:0]   ledr_o;
wire [1:0]   key_i;
wire [6:0]   hex1_o;
wire [6:0]   hex0_o;

counter TEST (
    .sw_i     (sw_i    ),
    .ledr_o   (ledr_o  ),
    .clk100_i (clk100_i),
    .key_i    (key_i   ),
    .hex1_o   (hex1_o  ),
    .hex0_o   (hex0_o  )
);

assign key_i[1] = 0; 
assign key_i[0] = 1; 

initial begin
    clk100_i = 1'b1;
    forever begin
        #CLK_SEMIPERIOD clk100_i=~clk100_i;
    end
end

initial begin
    sw_i[9:0] = 10'b0000000000;
    repeat(20)begin
        #(CLK_SEMIPERIOD - 1);
        sw_i[9:0] = $random();
    end
end

endmodule