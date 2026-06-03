module clock(
    input clk,
    input reset,
    input clk1hz,
    input ena,
    output reg pm,
    output reg [7:0] seconds,
    output reg [7:0] minutes,
    output reg [7:0] hours
);
    initial begin
        seconds = 8'h00;
        minutes = 8'h00;
        hours   = 8'h12;
        pm = 1'b0;
    end
 
    always @(posedge clk1hz or posedge reset) begin
 
        if (reset) begin
            seconds <= 8'h00;
            minutes <= 8'h00;
            hours   <= 8'h12;
            pm      <= 0;
        end
        else if (ena) begin
 
            // seconds
            if (seconds == 8'h59) begin
                seconds <= 8'h00;
 
                // minutes
                if (minutes == 8'h59) begin
                    minutes <= 8'h00;
 
                    // hours (BCD, 12-hour format)
                    if (hours == 8'h11) begin
                        hours <= 8'h12;
                        pm <= ~pm;          // toggle AM/PM at 11->12
                    end
                    else if (hours == 8'h12) begin
                        hours <= 8'h01;     // wrap 12 -> 01
                    end
                    else begin
                        if (hours[3:0] == 4'd9)
                            hours <= {hours[7:4] + 4'd1, 4'd0};
                        else
                            hours <= hours + 8'd1;
                    end
 
                end
                else begin
                    // BCD increment minutes
                    if (minutes[3:0] == 4'd9)
                        minutes <= {minutes[7:4] + 4'd1, 4'd0};
                    else
                        minutes <= minutes + 8'd1;
                end
 
            end
            else begin
                // BCD increment seconds
                if (seconds[3:0] == 4'd9)
                    seconds <= {seconds[7:4] + 4'd1, 4'd0};
                else
                    seconds <= seconds + 8'd1;
            end
 
        end
    end
endmodule
 
