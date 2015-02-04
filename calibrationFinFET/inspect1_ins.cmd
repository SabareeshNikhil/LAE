
### Header ###################################################################

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

### Evaluation of Dessis simulation ##########################################

#set EPSOXNEW 3.9

proj_load "n@node|-3@_nonlocal.plt" qmnonloc

puts "proj_load = n@node|-3@_nonlocal.plt"


# Charge centroid for high bias
cv_createDS qmdist "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance"
##cv_write txt /home/users/smittal/trigate/thinfin_new/qcMonteCarlo/qmdist@node@_txt.txt qmdist

#if "@Type@" == "nMOS"
cv_createDS qmdens "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) eDensity"
#else
##cv_createDS qmdens "qmnonloc Pos(0,-@<W/2.>@) Distance" "qmnonloc Pos(0,-@<W/2.>@) hDensity"
cv_createDS qmdens "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "qmnonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) hDensity"
##cv_write txt /home/users/smittal/trigate/thinfin_new/qcMonteCarlo/qmdens@node@_txt.txt qmdens
#endif
cv_createWithFormula qmnenn "integr(<qmdens>)" 0.0 @<W/2000.>@
##cv_write txt /home/users/smittal/trigate/thinfin_new/qcMonteCarlo/qmnenn@node@_txt.txt qmnenn
cv_createWithFormula qmzaehl "integr(<qmdens>*<qmdist>)" 0.0 @<W/2000.>@
##cv_write txt /home/users/smittal/trigate/thinfin_new/qcMonteCarlo/qmz@node@_txt.txt qmzaehl


# xqm is computed from the high bias curve
set xqm  [ cv_compute "vecmax(<qmzaehl>)/vecmax(<qmnenn>) *1.e3" A A A A ]


proj_load "n@node|-1@_nonlocal.plt" nonloc

puts "proj_load = n@node|-1@_nonlocal.plt"

# Charge centroid for high bias
cv_createDS dist "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance"
#if "@Type@" == "nMOS"
cv_createDS dens "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) eDensity"
#else
cv_createDS dens "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) Distance" "nonloc Pos(0.15,@<0.15-(W/2000.) - (tox/2000.)>@) hDensity"
#endif
cv_createWithFormula nenn "integr(<dens>)" 0.0 @<W/2000.>@
cv_createWithFormula zaehl "integr(<dens>*<dist>)" 0.0 @<W/2000.>@


# xcl is computed from the high bias curve
set xcl  [ cv_compute "vecmax(<zaehl>)/vecmax(<nenn>) *1.e3" A A A A ]

# extract the computed values to the GENESISe family table
##set epsnew [expr @<tox*1.e3>@/(@<tox*1.e3>@/3.9+($xqm-$xcl)/15.8)]
set epsnew [expr @<tox>@/(@<tox>@/3.9+($xqm-$xcl)/11.7)]

ft_scalar EPSOXNEW [ format %.3f $epsnew ]
ft_scalar xqm [ format %.3f $xqm ]
ft_scalar xcl [ format %.3f $xcl ]

puts  "New oxide epsilon  = $epsnew"
puts  "\n"

exit
