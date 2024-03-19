onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /csd_tb/reset_tb
add wave -noupdate /csd_tb/latch_tb
add wave -noupdate /csd_tb/data_tb
add wave -noupdate /csd_tb/DUT/bypass_s
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/bypass_gen_s
add wave -noupdate -expand -group LSB /csd_tb/DUT/generate_pe(0)/g_lsb/pe_lsb/bypass_gen_s
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/bypass_o
add wave -noupdate -expand -group MSB /csd_tb/DUT/generate_pe(7)/g_msb/pe_msb/bypass_gen_s
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/bypass_gen_s
add wave -noupdate -expand -group MIDDLE /csd_tb/DUT/generate_pe(4)/g_all/pe_i/bypass_gen_s
add wave -noupdate -divider Single
add wave -noupdate /csd_tb/DUT/generate_pe(1)/g_all/pe_i/bypass_gen_s
add wave -noupdate /csd_tb/DUT/generate_pe(2)/g_all/pe_i/bypass_gen_s
add wave -noupdate /csd_tb/DUT/generate_pe(3)/g_all/pe_i/bypass_gen_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0}
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
WaveRestoreZoom {90 ns} {120 ns}
