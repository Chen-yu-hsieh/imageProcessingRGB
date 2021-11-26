@echo off
set xv_path=D:\\Xilinx2016.1\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 6776d0d4d7f84b90b534a8b5077e35cc -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L xbip_utils_v3_0_6 -L axi_utils_v2_0_2 -L xbip_pipe_v3_0_2 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_2 -L xbip_bram18k_v3_0_2 -L mult_gen_v12_0_11 -L floating_point_v7_0_12 -L xbip_dsp48_mult_v3_0_2 -L xbip_dsp48_multadd_v3_0_2 -L div_gen_v5_1_10 -L fifo_generator_v13_1_0 -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_behav xil_defaultlib.tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
