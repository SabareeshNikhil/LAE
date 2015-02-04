load_library EXTRACT
proj_load  /home/users/psd/work/workdir/inverter/calibrationFinFET/Cprime_prelims_1079.plt Cprime_prelims_1091
cv_createDS arbit2 {Cprime_prelims_1091 gate OuterVoltage} {Cprime_prelims_1091 drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_1091 drain TotalCurrent} {Cprime_prelims_1091 gate OuterVoltage} 
cv_inv arbit2 X
cv_inv arbit2 Y

ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" 0.02 ]]

