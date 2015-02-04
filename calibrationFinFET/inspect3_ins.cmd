## THIS IS A MACHINE GENERATED COMMAND FILE FOR INSPECT
load_library EXTRACT
proj_load  /home/users/psd/work/workdir/inverter/calibrationFinFET/Cprime_prelims_@node|-9@.plt Cprime_prelims_@node@
cv_createDS arbit2 {Cprime_prelims_@node@ gate OuterVoltage} {Cprime_prelims_@node@ drain TotalCurrent}
cv_createDS arbit3 {Cprime_prelims_@node@ drain TotalCurrent} {Cprime_prelims_@node@ gate OuterVoltage} 
#if "@Type@" == "pMOS"
cv_inv arbit2 X
cv_inv arbit2 Y
#else

#endif

ft_scalar SS [format %.3f [ExtractSS "SS" "arbit2" @V_for_ss@ ]]
