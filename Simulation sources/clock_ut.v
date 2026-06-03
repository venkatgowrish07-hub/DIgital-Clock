module topmodule(
    input clk,
    input reset,
    input ena,
    input ctrl_12_or_24,
    output pm,
    output [7:0] seconds,
    output [7:0] minutes,
    output [7:0] hours
);

wire clk1hz;
wire [7:0]hh;

clkDivider clkdiv (clk1hz,clk,reset);
clock cl(clk,reset,clk1hz,ena,pm,seconds,minutes,hh);
hourssync hsy(hh,ctrl_12_or_24,pm,hours);

endmodule
