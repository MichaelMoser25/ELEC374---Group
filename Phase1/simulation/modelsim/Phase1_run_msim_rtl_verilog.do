transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/select_encode.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/register.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/Bus.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/ALU.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/CLA_4bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/CLA_32bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/shift_rotate_operations.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/logic_operations.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/NRdiv.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/BoothMul.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/pc_register.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/mux.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/Ram.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/con_ff.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/input_output_ports.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/Control_unit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/CPU.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1 {C:/intelFPGA_lite/18.1/Elec374/ELEC374---Group/Phase1/phase3_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  phase3_tb

add wave *
view structure
view signals
run 1000 ns
