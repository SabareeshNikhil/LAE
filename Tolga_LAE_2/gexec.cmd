# project name
name Tolga_LAE_2
# execution graph
job 4   -post { extract_vars "$wdir" n4_des.out 4 }  -o n4_des "sdevice pp4_des.cmd"
job 5   -post { extract_vars "$wdir" n5_des.out 5 }  -o n5_des "sdevice pp5_des.cmd"
check sdevice_des.cmd 1422307528
check sdevice.par 1421278900
check global_tooldb 1336087542
check gtree.dat 1422244123
# included files
