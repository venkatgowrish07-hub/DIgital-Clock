module hourssync(
    input [7:0]hh,
    input ctrl_12_or_24,
    input pm,
    output reg [7:0]hours
);
always @(*) begin 
    if (ctrl_12_or_24) begin 
        if(pm==1) begin
            if(hh == 8'h12)
                hours <= hh;
            else if (hh[3:0]+4'd2 >= 10)
                hours <= {hh[7:4] + 4'd2, hh[3:0]+4'd2-4'd10};
            else
                hours <= {hh[7:4]+4'd1,hh[3:0]+4'd2};
        end
        else if(pm==0 && hh==8'h12)
            hours<=8'h00;
        else hours <= hh;
    end
    else hours <= hh;
end
endmodule