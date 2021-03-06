# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.cache/wt [current_project]
set_property parent.project_path C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_repo_paths c:/Users/USER/Desktop/ImageProcessingRGB [current_project]
add_files -quiet c:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/ip/outputBuffer/outputBuffer.dcp
set_property used_in_implementation false [get_files c:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/ip/outputBuffer/outputBuffer.dcp]
add_files -quiet c:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/ip/div_gen_0/div_gen_0.dcp
set_property used_in_implementation false [get_files c:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/ip/div_gen_0/div_gen_0.dcp]
read_verilog -library xil_defaultlib {
  C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/new/LineBuffer.v
  C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/new/RGB2Gray.v
  C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/new/ImageControl.v
  C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/new/conv.v
  C:/Users/USER/Desktop/ImageProcessingRGB/ImageProcessingRGB.srcs/sources_1/new/ImageProcessTop.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top imageProcessTop -part xc7z020clg484-1


write_checkpoint -force -noxdef imageProcessTop.dcp

catch { report_utilization -file imageProcessTop_utilization_synth.rpt -pb imageProcessTop_utilization_synth.pb }
