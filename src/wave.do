onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /csd_tb/reset_tb
add wave -noupdate /csd_tb/latch_tb
add wave -noupdate /csd_tb/data_tb
add wave -noupdate /csd_tb/data_sign_tb
add wave -noupdate /csd_tb/data_magn_tb
add wave -noupdate /csd_tb/DUT/bypass_s
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/bypass_i
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/prev_bit_i
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/curr_bit_i
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/next_bit_i
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/sign_o
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/magn_o
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/bypass_o
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/bypass_gen_s
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/bypass_i
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/prev_bit_i
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/curr_bit_i
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/next_bit_i
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/sign_o
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/magn_o
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/bypass_o
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/bypass_gen_s
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/bypass_i
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/prev_bit_i
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/curr_bit_i
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/next_bit_i
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/sign_o
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/magn_o
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/bypass_o
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/bypass_gen_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {103740 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 411
configure wave -valuecolwidth 51
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {68600 ps} {154380 ps}
