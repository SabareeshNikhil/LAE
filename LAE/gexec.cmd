# project name
name LAE
# execution graph
job 14   -post { extract_vars "$wdir" n14_des.out 14 }  -o n14_des "sdevice pp14_des.cmd"
job 10   -post { extract_vars "$wdir" n10_des.out 10 }  -o n10_des "sdevice pp10_des.cmd"
job 11   -post { extract_vars "$wdir" n11_des.out 11 }  -o n11_des "sdevice pp11_des.cmd"
job 20   -post { extract_vars "$wdir" n20_des.out 20 }  -o n20_des "sdevice pp20_des.cmd"
job 6   -post { extract_vars "$wdir" n6_des.out 6 }  -o n6_des "sdevice pp6_des.cmd"
job 13   -post { extract_vars "$wdir" n13_des.out 13 }  -o n13_des "sdevice pp13_des.cmd"
job 7   -post { extract_vars "$wdir" n7_des.out 7 }  -o n7_des "sdevice pp7_des.cmd"
job 16   -post { extract_vars "$wdir" n16_des.out 16 }  -o n16_des "sdevice pp16_des.cmd"
job 19   -post { extract_vars "$wdir" n19_des.out 19 }  -o n19_des "sdevice pp19_des.cmd"
job 17   -post { extract_vars "$wdir" n17_des.out 17 }  -o n17_des "sdevice pp17_des.cmd"
job 4   -post { extract_vars "$wdir" n4_des.out 4 }  -o n4_des "sdevice pp4_des.cmd"
job 5   -post { extract_vars "$wdir" n5_des.out 5 }  -o n5_des "sdevice pp5_des.cmd"
job 15   -post { extract_vars "$wdir" n15_des.out 15 }  -o n15_des "sdevice pp15_des.cmd"
job 12   -post { extract_vars "$wdir" n12_des.out 12 }  -o n12_des "sdevice pp12_des.cmd"
check sdevice_des.cmd 1421440892
check sdevice.par 1418412935
check sdevice1_des.cmd 1422302495
check sdevice2_des.cmd 1422485790
check global_tooldb 1336087542
check gtree.dat 1422485735
check sdevice11_des.cmd 1421275277
check sdevice3_des.cmd 1421273019
# included files
