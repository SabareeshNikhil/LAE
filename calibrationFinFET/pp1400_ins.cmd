load_library EXTRACT
proj_load  /home/users/sabareeshn/Desktop/calibrationFinFET/Cprime_prelims_1388.plt Cprime_prelims_1400
cv_createDS arbit2 {Cprime_prelims_1400 gate OuterVoltage} {Cprime_prelims_1400 drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_1400 drain TotalCurrent} {Cprime_prelims_1400 gate OuterVoltage} 
cv_inv arbit2 X
cv_inv arbit2 Y

ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" 0.02 ]]

