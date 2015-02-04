set ProjectName "QE_Extraction"
 set CurveName "IV"

 proj_load sde_des.plt $ProjectName

cv_createDS $CurveName "$ProjectName SiGeContact OuterVoltage" "$ProjectName SiGeContact TotalCurrent" y
cv_abs $CurveName y
set check [expr {@xsimax@-0.400}]

set GR @genrate@

set I_0V [cv_compute "vecvaly(<$CurveName>,-0)" A A A A ]
set QE_0V [expr {$I_0V/(4.8e-13*1.6023e-19*$GR)}]

set I_500mV [cv_compute "vecvaly(<$CurveName>,-0.5)" A A A A]
set QE_500mV [expr {$I_500mV/(4.8e-13*1.6023e-19*$GR)}]

set I_1V [cv_compute "vecvaly(<$CurveName>,-1)" A A A A ]
set QE_1V [expr {$I_1V/(4.8e-13*1.6023e-19*$GR)}]

set I_1500mV [cv_compute "vecvaly(<$CurveName>,-1.5)" A A A A]
set QE_1500mV [expr {$I_1500mV/(4.8e-13*1.6023e-19*$GR)}]

set I_2V [cv_compute "vecvaly(<$CurveName>,-2)" A A A A ]
set QE_2V [expr {$I_2V/(4.8e-13*1.6023e-19*$GR)}]

puts "$check [format %.3e $QE_0V] [format %.3e $QE_500mV] [format %.3e $QE_1V] [format %.3e $QE_1500mV] [format %.3e $QE_2V]"
