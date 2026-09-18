##CLOCK
set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

##SWITCHES
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports j];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports k];

##BUTTON (RESET)
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports reset];

##LEDs
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports q];
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports qn];

##CONFIGURATION
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]