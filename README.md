## Digital Clock – Basys 3 (Verilog | AM/PM/24hr| HH:MM/MM:SS)

### Project Description

This project implements a 12-hour digital clock with AM/PM indication and 24-hour digital clock.

### Control Signals
- ena - enables the clock
- hrmin_or_minsec - selects whether to display HH:MM ( signal is high ) or MM:SS ( signal is low ) on seven segment display
- ctrl_12_or_24 - selects 12-hour clock ( signal is low ) or 24-hour clock ( signal is high )
- output pm signals indicates the AM ( pm is low ) / PM ( pm is high )
  
### Implementation Steps

1. Coded the digital clock in Verilog `clock.v`
   - 12-hour format  
   - AM/PM support
     
2. Coded the hours synchronizer for 12 and 24 hour clock `hoursync.v`
   
3. Coded the display mux for HH:MM/MM:SS display `displaymux.v`
   - hrmin_or_minsec controls the displayn unit
   - hrmin_or_minsec is high - HH:MM is displayed on seven segment
   - hrmin_or_minsec is low - MM:SS is displayed on seven segment

4. Designed a frequency divider `clkdiv.v`
   - Converted 100 MHz onboard clock to 1 Hz  

5. Verified the design using testbench `clocktb.v`
   - for simulation the count in clock divider is decreased for faster output
     
6. Created top file `top.v`
   - intergartes all files to implement on fpga
    
7. Created XDC constraints file  
   - Mapped 100 MHz clock  
   - Mapped 7-segment display pins  
   - Mapped reset to button
   - Mapped ctrl_12_or_24 to switch
   - Mapped hrmin_or_minsec to switch
   - Mapped pm to led
