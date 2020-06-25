############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
############## clock and reset define##################
set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports CLK_IN]
create_clock -period 20.000 [get_ports CLK_IN]

### XXX Why on earth do we need to do this, when CLK_IN on M22 is in fact a clock,
### and the same idiom works for the MEGA65 R2 board?
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {CLK_IN_IBUF}]

### XXX And for that matter, why do we need this, when it syntheses fine on the
### MEGA65 R2 board which also has an 100T part, with the same number of clocking
### resources.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clocks1/clock124mhz]

################ QSPI Flash ###############################3
set_property  -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[0]}]
set_property  -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[1]}]
set_property  -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[2]}]
set_property  -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {QspiDB[3]}]
set_property  -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports QspiCSn]
set_property PULLUP true [get_ports {qspidb[0]}]
set_property PULLUP true [get_ports {qspidb[1]}]
set_property PULLUP true [get_ports {qspidb[2]}]
set_property PULLUP true [get_ports {qspidb[3]}]


############## Switches and LEDs ##############
set_property PACKAGE_PIN H7 [get_ports btnCpuReset]
set_property IOSTANDARD LVCMOS33 [get_ports btnCpuReset]
set_property PACKAGE_PIN J8 [get_ports KEY1]
set_property IOSTANDARD LVCMOS33 [get_ports KEY1]
set_property PACKAGE_PIN J6 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property PACKAGE_PIN H6 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports led2]

############## SD Card Interface ##############
### XXX PGS Pin assignments are almost surely wrong
###         for the PMOD adapter we are using.
set_property PACKAGE_PIN H4 [get_ports sdReset]
set_property IOSTANDARD LVCMOS33 [get_ports sdReset]
set_property PACKAGE_PIN F4 [get_ports sdClock]
set_property IOSTANDARD LVCMOS33 [get_ports sdClock]
set_property PACKAGE_PIN A4 [get_ports sdMOSI]
set_property IOSTANDARD LVCMOS33 [get_ports sdMOSI]
set_property PACKAGE_PIN A5 [get_ports sdMISO]
set_property IOSTANDARD LVCMOS33 [get_ports sdMISO]

set_property PACKAGE_PIN J4 [get_ports sd2Reset]
set_property IOSTANDARD LVCMOS33 [get_ports sd2Reset]
set_property PACKAGE_PIN G4 [get_ports sd2Clock]
set_property IOSTANDARD LVCMOS33 [get_ports sd2Clock]
set_property PACKAGE_PIN B4 [get_ports sd2MOSI]
set_property IOSTANDARD LVCMOS33 [get_ports sd2MOSI]
set_property PACKAGE_PIN B5 [get_ports sd2MISO]
set_property IOSTANDARD LVCMOS33 [get_ports sd2MISO]


############## USB Serial interface ###########
set_property PACKAGE_PIN E3 [get_ports UART_TXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TXD]
set_property PACKAGE_PIN F3 [get_ports RsRx]
set_property IOSTANDARD LVCMOS33 [get_ports RsRx]


############## HDMIOUT define##################
set_property PACKAGE_PIN C4 [get_ports TMDS_clk_n]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_n]
set_property PACKAGE_PIN D4 [get_ports TMDS_clk_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_p]

set_property PACKAGE_PIN D1 [get_ports {TMDS_data_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[0]}]
set_property PACKAGE_PIN E1 [get_ports {TMDS_data_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[0]}]

set_property PACKAGE_PIN E2 [get_ports {TMDS_data_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[1]}]
set_property PACKAGE_PIN F2 [get_ports {TMDS_data_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[1]}]

set_property PACKAGE_PIN G1 [get_ports {TMDS_data_n[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_n[2]}]
set_property PACKAGE_PIN G2 [get_ports {TMDS_data_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_p[2]}]
