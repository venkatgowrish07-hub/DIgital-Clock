module displaymux(an,seg,hrmin_or_minsec,hours,minutes,seconds,clk);
input clk,
input hrmin_or_minsec;
input [7:0] hours,minutes,seconds;
output reg [3:0] an;
output [6:0]seg;

reg [3:0] digit;

reg [19:0]refresh = 0;
reg [1:0]sel;

always @(posedge clk) begin
    refresh <= refresh + 1;
    sel <= refresh[19:18];
end

always @(*) 
    case(hrmin_or_minsec)
        0:case(sel)
            2'b00:begin an<=4'b1110; digit<=seconds[3:0]; end
            2'b01:begin an<=4'b1101; digit<=seconds[7:4]; end
            2'b10:begin an<=4'b1011; digit<=minutes[3:0]; end
            2'b11:begin an<=4'b0111; digit<=minutes[7:4]; end
            default:begin an<=4'b1110; digit<=4'b0000; end
        endcase
        1:case(sel)
            2'b00:begin an<=4'b1110; digit<=minutes[3:0]; end
            2'b01:begin an<=4'b1101; digit<=minutes[7:4]; end
            2'b10:begin an<=4'b1011; digit<=hours[3:0]; end
            2'b11:begin an<=4'b0111; digit<=hours[7:4]; end
            default:begin an<=4'b1110; digit<=4'b0000; end
        endcase
    endcase
segment se(seg,digit);
endmodule