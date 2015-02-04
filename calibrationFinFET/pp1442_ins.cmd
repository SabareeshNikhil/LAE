load_library EXTRACT
proj_load  /home/users/sabareeshn/Desktop/calibrationFinFET/Cprime_prelims_1431.plt Cprime_prelims_1442
cv_createDS arbit2 {Cprime_prelims_1442 gate OuterVoltage} {Cprime_prelims_1442 drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_1442 drain TotalCurrent} {Cprime_prelims_1442 gate OuterVoltage} 


ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" 0.02 ]]

