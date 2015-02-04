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


set Vdd      0.78

set plot Cprime_prelims_1435.plt

set out_file [file rootname $plot]
puts "out_file = $out_file"
proj_load "$plot"
puts "proj_load = $plot"

cv_createDS iv "$out_file gate OuterVoltage" "$out_file source TotalCurrent"

cv_createWithFormula absiv  "fabs(<iv>+1.e-32)"  	A A A A
cv_createWithFormula sqrtiv "sqrt(<absiv>)"     	A A A A

cv_inv iv X
cv_inv iv Y

set VTScl1 [ExtractVti Vti iv 1e-5]
set VTScl      [ expr $VTScl1*-1 ]

puts  "S: Threshold   voltage VTScl ( slope sqrt pentode )        = $VTScl  Volts"

ft_scalar VTScl      $VTScl

exit






