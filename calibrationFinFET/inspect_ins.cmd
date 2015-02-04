load_library EXTRACT
#----------------------------------------------------------------------#

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

#set VTL 0.0
#set VTS 0.0

set Vdd      @<Vdd>@

set plot Cprime_prelims_@node|-1@.plt

set out_file [file rootname $plot]
puts "out_file = $out_file"
proj_load "$plot"
puts "proj_load = $plot"

cv_createDS iv "$out_file gate OuterVoltage" "$out_file source TotalCurrent"

cv_createWithFormula absiv  "fabs(<iv>+1.e-32)"  	A A A A
cv_createWithFormula sqrtiv "sqrt(<absiv>)"     	A A A A
cv_inv iv X
cv_inv iv Y

#if "@Type@" == "nMOS"
##set VTS [ cv_compute "vecvalx(tangent(<sqrtiv>,veczero(diff(<sqrtiv>)- vecmax(diff(<sqrtiv>)))),0.0)" A A A A ]
set VTS1 [ExtractVti Vti iv 1e-5]
#else
##set VTS [ cv_compute "vecvalx(tangent(<sqrtiv>,veczero(diff(<sqrtiv>)- vecmin(diff(<sqrtiv>)))),0.0)" A A A A ]
set VTS1 [ExtractVti Vti iv 1e-5]
#endif
set VTS      [ expr $VTS1*-1 ]
##set IOFF        [ cv_compute "vecvaly(<absiv>,0.0) * 1e9 / 1.0" A A A A ]
set IOFF        [ cv_compute "vecvaly(<absiv>,0.0) / 2.0" A A A A ]
##set IDSAT  [ cv_compute "vecvaly(<absiv>,@Vdd@*0.999) /2"  A A A A ]
set IDSAT  [ cv_compute "vecvaly(<absiv>,@Vdd@*-0.9999) /2"  A A A A ]

##set VTS   [ format "%.3lg" [ expr $VTS   ] ]
##set IOFF  [ format "%.3lg" [ expr $IOFF  ] ]
##set IDSAT  [ format "%.3lg" [ expr $IDSAT  ] ]
##
##puts  "S: Threshold   voltage VTS ( slope sqrt pentode )        = $VTS  Volts"
##puts  "S: Drain current at Vg=0.0V, Vd=0.7V                     = $IOFF nA/um"
##puts  "S: Drain current at Vg=0.7V, Vd=0.7V			= $IDSAT uA/um"
##
ft_scalar VTS      $VTS
ft_scalar IOFF     $IOFF
ft_scalar IDSAT     $IDSAT
##
#####endif
##exit
