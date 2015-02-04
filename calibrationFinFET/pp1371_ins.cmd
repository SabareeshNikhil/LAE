load_library EXTRACT
proj_load  /home/users/psd/work/workdir/inverter/calibrationFinFET/Cprime_prelims_1359.plt Cprime_prelims_1371
cv_createDS arbit2 {Cprime_prelims_1371 gate OuterVoltage} {Cprime_prelims_1371 drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_1371 drain TotalCurrent} {Cprime_prelims_1371 gate OuterVoltage} 


ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" 0.02 ]]

