
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]




##7 segment display
set_property PACKAGE_PIN W7 [get_ports {segment[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[6]}]
set_property PACKAGE_PIN W6 [get_ports {segment[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[5]}]
set_property PACKAGE_PIN U8 [get_ports {segment[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[4]}]
set_property PACKAGE_PIN V8 [get_ports {segment[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[3]}]
set_property PACKAGE_PIN U5 [get_ports {segment[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[2]}]
set_property PACKAGE_PIN V5 [get_ports {segment[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[1]}]
set_property PACKAGE_PIN U7 [get_ports {segment[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[0]}]





##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {scan_output[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_output[0]}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {scan_output[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_output[1]}]
#Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {scan_output[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_output[2]}]
#Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {scan_output[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_output[3]}]
#Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {scan_got[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_got[0]}]
set_property PULLDOWN true [get_ports {scan_got[0]}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {scan_got[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_got[1]}]
set_property PULLDOWN true [get_ports {scan_got[1]}]
#Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {scan_got[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_got[2]}]
set_property PULLDOWN true [get_ports {scan_got[2]}]
#Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports {scan_got[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {scan_got[3]}]
set_property PULLDOWN true [get_ports {scan_got[3]}]



set_property IOSTANDARD LVCMOS33 [get_ports {select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {select[0]}]
set_property PACKAGE_PIN U2 [get_ports {select[3]}]
set_property PACKAGE_PIN U4 [get_ports {select[2]}]
set_property PACKAGE_PIN V4 [get_ports {select[1]}]
set_property PACKAGE_PIN W4 [get_ports {select[0]}]


set_property PACKAGE_PIN V7 [get_ports {segment[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment[7]}]


set_property PACKAGE_PIN V17 [get_ports clear]
set_property IOSTANDARD LVCMOS33 [get_ports clear]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clear_IBUF]



set_property IOSTANDARD LVCMOS33 [get_ports {state_on_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {state_on_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {state_on_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {state_on_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BCDa_on_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {opcode_on_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {opcode_on_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {opcode_on_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {opcode_on_LED[0]}]


set_property PACKAGE_PIN L1 [get_ports {state_on_LED[3]}]
set_property PACKAGE_PIN P1 [get_ports {state_on_LED[2]}]
set_property PACKAGE_PIN N3 [get_ports {state_on_LED[1]}]
set_property PACKAGE_PIN P3 [get_ports {state_on_LED[0]}]
set_property PACKAGE_PIN U3 [get_ports {BCDa_on_LED[7]}]
set_property PACKAGE_PIN W3 [get_ports {BCDa_on_LED[6]}]
set_property PACKAGE_PIN V3 [get_ports {BCDa_on_LED[5]}]
set_property PACKAGE_PIN V13 [get_ports {BCDa_on_LED[4]}]
set_property PACKAGE_PIN V14 [get_ports {BCDa_on_LED[3]}]
set_property PACKAGE_PIN U14 [get_ports {BCDa_on_LED[2]}]
set_property PACKAGE_PIN U15 [get_ports {BCDa_on_LED[1]}]
set_property PACKAGE_PIN W18 [get_ports {BCDa_on_LED[0]}]
set_property PACKAGE_PIN V19 [get_ports {opcode_on_LED[3]}]
set_property PACKAGE_PIN U19 [get_ports {opcode_on_LED[2]}]
set_property PACKAGE_PIN E19 [get_ports {opcode_on_LED[1]}]
set_property PACKAGE_PIN U16 [get_ports {opcode_on_LED[0]}]
