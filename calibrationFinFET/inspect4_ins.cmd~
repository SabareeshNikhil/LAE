
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

set VDRAIN  @<Vdd>@

set plot @plot@

set out_file [file rootname $plot]
puts "out_file = $out_file"
proj_load "$plot"
puts "proj_load = $plot"

cv_createDS iv "$out_file gate OuterVoltage" "$out_file source TotalCurrent"

cv_createWithFormula absiv  "fabs(<iv>+1.e-32)"  	A A A A
cv_createWithFormula sqrtiv "sqrt(<absiv>)"     	A A A A

#if @< @<Vdd>@==0.05 || @<Vdd>@==-0.05 >@


#if "@Type@" == "nMOS"
set VTL1     [ cv_compute "vecvalx(tangent(<absiv>,veczero(diff(<absiv>) - vecmax(diff(<absiv>)))),0.0)" A A A A ]
set VTL_3D      [ expr $VTL1+0.5*$VDRAIN ]
#else
set VTL1     [ cv_compute "vecvalx(tangent(<absiv>,veczero(diff(<absiv>) - vecmin(diff(<absiv>)))),0.0)" A A A A ]
set VTL_3D      [ expr $VTL1-0.5*$VDRAIN ]
#endif
set IDLIN_3D  [ cv_compute "vecvaly(<absiv>,@Vdrain@*0.999) * 1e6"  A A A A ]

set VTL_3D  [ format "%.3lg" [ expr $VTL_3D  ] ]
set IDLIN_3D  [ format "%.3lg" [ expr $IDLIN_3D  ] ]


puts  "S: Threshold   voltage VTL ( slope triode)         = $VTL_3D  Volts"
puts  "S: Drain current at Vg=0.78V, Vd=0.05V			= $IDLIN_3D uA/um"

ft_scalar VTL_3D      $VTL_3D
ft_scalar IDLIN_3D     $IDLIN_3D

#else


#if "@Type@" == "nMOS"
set VTS_3D [ cv_compute "vecvalx(tangent(<sqrtiv>,veczero(diff(<sqrtiv>)- vecmax(diff(<sqrtiv>)))),0.0)" A A A A ]
#else
set VTS_3D [ cv_compute "vecvalx(tangent(<sqrtiv>,veczero(diff(<sqrtiv>)- vecmin(diff(<sqrtiv>)))),0.0)" A A A A ]
#endif
set IOFF_3D        [ cv_compute "vecvaly(<absiv>,0.0) * 1e9 / 1.0" A A A A ]
set IDSAT_3D  [ cv_compute "vecvaly(<absiv>,@Vdrain@*0.999) * 1e6"  A A A A ]

set VTS_3D   [ format "%.3lg" [ expr $VTS_3D   ] ]
set IOFF_3D  [ format "%.3lg" [ expr $IOFF_3D  ] ]
set IDSAT_3D  [ format "%.3lg" [ expr $IDSAT_3D  ] ]

puts  "S: Threshold   voltage VTS ( slope sqrt pentode )        = $VTS_3D  Volts"
puts  "S: Drain current at Vg=0.0V, Vd=0.78V                     = $IOFF_3D nA/um"
puts  "S: Drain current at Vg=0.78V, Vd=0.78V			= $IDSAT_3D uA/um"

ft_scalar VTS_3D      $VTS_3D
ft_scalar IOFF_3D     $IOFF_3D
ft_scalar IDSAT_3D     $IDSAT_3D

#endif
exit






