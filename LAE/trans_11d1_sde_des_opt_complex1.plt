DF-ISE text

Info {
  version   = 1.0
  type      = xyplot
  datasets  = [
    "time"
    "Cathode OuterVoltage" "Cathode InnerVoltage" "Cathode QuasiFermiPotential" "Cathode DisplacementCurrent" "Cathode eCurrent"
    "Cathode hCurrent" "Cathode TotalCurrent" "Cathode Charge" "Anode OuterVoltage" "Anode InnerVoltage"
    "Anode QuasiFermiPotential" "Anode DisplacementCurrent" "Anode eCurrent" "Anode hCurrent" "Anode TotalCurrent"
    "Anode Charge" ]
  functions = [
    Time
    OuterVoltage InnerVoltage QuasiFermiPotential DisplacementCurrent eCurrent
    hCurrent TotalCurrent Charge OuterVoltage InnerVoltage
    QuasiFermiPotential DisplacementCurrent eCurrent hCurrent TotalCurrent
    Charge ]
}

Data {
}
