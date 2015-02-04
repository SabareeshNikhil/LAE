DF-ISE text

Info {
  version   = 1.0
  type      = xyplot
  datasets  = [
    "time"
    "gate OuterVoltage" "gate InnerVoltage" "gate QuasiFermiPotential" "gate DisplacementCurrent" "gate eCurrent"
    "gate hCurrent" "gate TotalCurrent" "gate Charge" "source OuterVoltage" "source InnerVoltage"
    "source QuasiFermiPotential" "source DisplacementCurrent" "source eCurrent" "source hCurrent" "source TotalCurrent"
    "source Charge" "drain OuterVoltage" "drain InnerVoltage" "drain QuasiFermiPotential" "drain DisplacementCurrent"
    "drain eCurrent" "drain hCurrent" "drain TotalCurrent" "drain Charge" ]
  functions = [
    Time
    OuterVoltage InnerVoltage QuasiFermiPotential DisplacementCurrent eCurrent
    hCurrent TotalCurrent Charge OuterVoltage InnerVoltage
    QuasiFermiPotential DisplacementCurrent eCurrent hCurrent TotalCurrent
    Charge OuterVoltage InnerVoltage QuasiFermiPotential DisplacementCurrent
    eCurrent hCurrent TotalCurrent Charge ]
}

Data {
      0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00  -2.19552353092711E-16   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00  -5.54062823307095E-08  -1.68170681770430E-28  -5.54062823307095E-08
      1.02398234833840E-16   5.00000000000000E-02   5.00000000000000E-02   0.00000000000000E+00   0.00000000000000E+00
      5.54062825997224E-08  -3.49045679053739E-28   5.54062825997224E-08   1.20143095523610E-16
}
