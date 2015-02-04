

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



proj_load "n1127_nonlocal.plt" qmnonloc

puts "proj_load = n1127_nonlocal.plt"


cv_createDS qmdist "qmnonloc Pos(0.15,0.147165) Distance" "qmnonloc Pos(0.15,0.147165) Distance"

cv_createDS qmdens "qmnonloc Pos(0.15,0.147165) Distance" "qmnonloc Pos(0.15,0.147165) hDensity"
cv_createWithFormula qmnenn "integr(<qmdens>)" 0.0 0.0025
cv_createWithFormula qmzaehl "integr(<qmdens>*<qmdist>)" 0.0 0.0025


set xqm  [ cv_compute "vecmax(<qmzaehl>)/vecmax(<qmnenn>) *1.e3" A A A A ]


proj_load "n1130_nonlocal.plt" nonloc

puts "proj_load = n1130_nonlocal.plt"

cv_createDS dist "nonloc Pos(0.15,0.147165) Distance" "nonloc Pos(0.15,0.147165) Distance"
cv_createDS dens "nonloc Pos(0.15,0.147165) Distance" "nonloc Pos(0.15,0.147165) hDensity"
cv_createWithFormula nenn "integr(<dens>)" 0.0 0.0025
cv_createWithFormula zaehl "integr(<dens>*<dist>)" 0.0 0.0025


set xcl  [ cv_compute "vecmax(<zaehl>)/vecmax(<nenn>) *1.e3" A A A A ]

set epsnew [expr 0.67/(0.67/3.9+($xqm-$xcl)/11.7)]

ft_scalar EPSOXNEW [ format %.3f $epsnew ]
ft_scalar xqm [ format %.3f $xqm ]
ft_scalar xcl [ format %.3f $xcl ]

puts  "New oxide epsilon  = $epsnew"
puts  "\n"

exit

