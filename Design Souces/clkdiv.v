module clkDivider(clkout,clk,reset);
input clk,reset;
output reg clkout;
reg [25:0] count;
always @(posedge clk )
 begin
    if(reset==1) begin
        count<=0;
        clkout<=0;
    end
  else if (count==49999999) 
        begin
            count<=0;
            clkout<=~clkout;
        end
    else 
        count<=count + 1;
 end
endmodule
