module topmodule(
    input clk,
    input reset,
    input ena,
    input ctrl_12_or_24,
    input hrmin_or_minsec,
    output pm,
    output [3:0] an,
    output [6:0] seg
);

wire clk1hz;
wire [7:0]hh;
wire [7:0] seconds;
wire [7:0] minutes;
wire [7:0] hours;

clkDivider clkdiv (clk1hz,clk,reset);
clock cl(clk,reset,clk1hz,ena,pm,seconds,minutes,hh);
hourssync hsy(hh,ctrl_12_or_24,pm,hours);
displaymux dimu(an,seg,hrmin_or_minsec,hours,minutes,seconds,clk);

endmodule