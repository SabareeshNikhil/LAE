load_library EXTRACT

set DATE [exec date]
set WORK [exec pwd]
puts " "
puts "--------------------------------------------------- "
puts "   INSPECT variable extraction: "
puts "--------------------------------------------------- "
puts " "
puts "Date      : $DATE "
puts "Directory : $WORK "
puts " "


set Vdd      0.7

set plot Cprime_prelims_1111.plt

set out_file [file rootname $plot]
puts "out_file = $out_file"
proj_load "$plot"
puts "proj_load = $plot"

cv_createDS iv "$out_file gate OuterVoltage" "$out_file source TotalCurrent"

cv_createWithFormula absiv  "fabs(<iv>+1.e-32)"  	A A A A
cv_createWithFormula sqrtiv "sqrt(<absiv>)"     	A A A A
cv_inv iv X
cv_inv iv Y

set VTS1 [ExtractVti Vti iv 1e-5]
set VTS      [ expr $VTS1*-1 ]
set IOFF        [ cv_compute "vecvaly(<absiv>,0.0) / 2.0" A A A A ]
set IDSAT  [ cv_compute "vecvaly(<absiv>,0.7*-0.9999) /2"  A A A A ]

ft_scalar VTS      $VTS
ft_scalar IOFF     $IOFF
ft_scalar IDSAT     $IDSAT

