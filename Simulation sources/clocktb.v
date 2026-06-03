module clock_tb;

reg clk , reset , ena , ctrl_12_or_24 ;
wire pm ;
wire [7:0] hh , mm , ss ;

topmodule cl(clk,reset,ena,ctrl_12_or_24,pm,ss,mm,hh);

initial begin
    clk=0;reset=0;ena=0;ctrl_12_or_24=0;
end
always #1 clk = ~clk;
initial begin
    #5 reset = 1 ;
    #5 reset = 0 ;
    #5 ena=1;
    #2000000 ctrl_12_or_24=1;
    #2000000 $finish ;
end
initial begin
    $dumpfile("clock.vcd");
    $dumpvars(0, clock_tb);
end

endmodule