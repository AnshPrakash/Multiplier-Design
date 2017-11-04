## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
#Bank = 34, Pin name = ,					Sch name = CLK100MHZ
#		set_property PACKAGE_PIN W5 [get_ports CLK]
#		set_property IOSTANDARD LVCMOS33 [get_ports CLK]
#		create_clock -period 10.000 -name sys_clk_pin -waveform 0.000 5.000 -add [get_ports CLK]

# Switches

set_property PACKAGE_PIN V17 [get_ports in1[0]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[0]]

set_property PACKAGE_PIN V16 [get_ports in1[1]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[1]]

set_property PACKAGE_PIN W16 [get_ports in1[2]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[2]]

set_property PACKAGE_PIN W17 [get_ports in1[3]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[3]]

set_property PACKAGE_PIN W15 [get_ports in1[4]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[4]]

set_property PACKAGE_PIN V15 [get_ports in1[5]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[5]]

set_property PACKAGE_PIN W14 [get_ports in1[6]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[6]]

set_property PACKAGE_PIN W13 [get_ports in1[7]]
set_property IOSTANDARD LVCMOS33 [get_ports in1[7]]

set_property PACKAGE_PIN V2 [get_ports in2[0]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[0]]

set_property PACKAGE_PIN T3 [get_ports in2[1]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[1]]

set_property PACKAGE_PIN T2 [get_ports in2[2]
set_property IOSTANDARD LVCMOS33 [get_ports in2[2]]

set_property PACKAGE_PIN R3 [get_ports in2[3]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[3]]

set_property PACKAGE_PIN W2 [get_ports in2[4]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[4]]

set_property PACKAGE_PIN V1 [get_ports in2[5]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[5]]


set_property PACKAGE_PIN T1 [get_ports in2[6]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[6]]


set_property PACKAGE_PIN R2 [get_ports in2[7]]
set_property IOSTANDARD LVCMOS33 [get_ports in2[7]]

#LEDs
set_property PACKAGE_PIN U16 [product[0]]
set_property IOSTANDARD LVCMOS33 [product[0]]

set_property PACKAGE_PIN E19 [product[1]]
set_property IOSTANDARD LVCMOS33 [product[1]]

set_property PACKAGE_PIN U19 [product[2]]
set_property IOSTANDARD LVCMOS33 [product[2]]

set_property PACKAGE_PIN V19 [product[3]]
set_property IOSTANDARD LVCMOS33 [product[3]]

set_property PACKAGE_PIN W18 [product[4]]
set_property IOSTANDARD LVCMOS33 [product[4]]

set_property PACKAGE_PIN U15 [product[5]]
set_property IOSTANDARD LVCMOS33 [product[5]]

set_property PACKAGE_PIN U14 [product[6]]
set_property IOSTANDARD LVCMOS33 [product[6]]

set_property PACKAGE_PIN V14 [product[7]]
set_property IOSTANDARD LVCMOS33 [product[7]]

set_property PACKAGE_PIN V13 [product[8]]
set_property IOSTANDARD LVCMOS33 [product[8]]

set_property PACKAGE_PIN V3 [product[9]]
set_property IOSTANDARD LVCMOS33 [product[9]]

set_property PACKAGE_PIN W3 [product[10]]
set_property IOSTANDARD LVCMOS33 [product[10]]

set_property PACKAGE_PIN U3 [product[11]]
set_property IOSTANDARD LVCMOS33 [product[11]]

set_property PACKAGE_PIN P3 [product[12]]
set_property IOSTANDARD LVCMOS33 [product[12]]

set_property PACKAGE_PIN N3 [product[13]]
set_property IOSTANDARD LVCMOS33 [product[13]]

set_property PACKAGE_PIN P1 [product[14]]
set_property IOSTANDARD LVCMOS33 [product[14]]

set_property PACKAGE_PIN L1 [product[15]]
set_property IOSTANDARD LVCMOS33 [product[15]]

#7 segment display
#anodes
set_property PACKAGE_PIN U2 [get_ports anode[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports anode[0]]

set_property PACKAGE_PIN U4 [get_ports anode[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports anode[1]]

set_property PACKAGE_PIN V4 [get_ports anode[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports anode[2]]

set_property PACKAGE_PIN W4 [get_ports anode[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports anode[3]]

#cathodes
set_property PACKAGE_PIN W7 [get_ports cathode[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[0]]

set_property PACKAGE_PIN W6 [get_ports cathode[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[1]]

set_property PACKAGE_PIN U8 [get_ports cathode[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[2]]

set_property PACKAGE_PIN V8 [get_ports cathode[3]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[3]]

set_property PACKAGE_PIN U5 [get_ports cathode[4]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[4]]

set_property PACKAGE_PIN V5 [get_ports cathode[5]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[5]]

set_property PACKAGE_PIN U7 [get_ports cathode[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports cathode[6]]

#PushButtons

set_property PACKAGE_PIN T17 [get_ports multiplier_select[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports multiplier_select[1]]

set_property PACKAGE_PIN U18 [get_ports display_button]					
set_property IOSTANDARD LVCMOS33 [get_ports display_button]

set_property PACKAGE_PIN W19 [get_ports multiplier_select[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports multiplier_select[0]]

# Others (BITSTREAM, CONFIG)
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]


