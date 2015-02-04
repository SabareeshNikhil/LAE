load_library EXTRACT
proj_load  /home/users/psd/work/workdir/inverter/calibrationFinFET/Cprime_prelims_1031.plt Cprime_prelims_1043
cv_createDS arbit2 {Cprime_prelims_1043 gate OuterVoltage} {Cprime_prelims_1043 drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_1043 drain TotalCurrent} {Cprime_prelims_1043 gate OuterVoltage} 


ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" 0.02 ]]

