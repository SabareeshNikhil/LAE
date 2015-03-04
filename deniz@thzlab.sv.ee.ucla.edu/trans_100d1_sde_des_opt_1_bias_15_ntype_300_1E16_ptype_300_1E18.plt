DF-ISE text

Info {
  version   = 1.0
  type      = xyplot
  datasets  = [
    "time"
    "ntype OuterVoltage" "ntype InnerVoltage" "ntype QuasiFermiPotential" "ntype DisplacementCurrent" "ntype eCurrent"
    "ntype hCurrent" "ntype TotalCurrent" "ntype Charge" "ptype OuterVoltage" "ptype InnerVoltage"
    "ptype QuasiFermiPotential" "ptype DisplacementCurrent" "ptype eCurrent" "ptype hCurrent" "ptype TotalCurrent"
    "ptype Charge" ]
  functions = [
    Time
    OuterVoltage InnerVoltage QuasiFermiPotential DisplacementCurrent eCurrent
    hCurrent TotalCurrent Charge OuterVoltage InnerVoltage
    QuasiFermiPotential DisplacementCurrent eCurrent hCurrent TotalCurrent
    Charge ]
}

Data {
}
