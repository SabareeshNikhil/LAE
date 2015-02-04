DF-ISE text

Info {
  version   = 1.0
  type      = xyplot
  datasets  = [
    "time"
    "cathode OuterVoltage" "cathode InnerVoltage" "cathode QuasiFermiPotential" "cathode DisplacementCurrent" "cathode eCurrent"
    "cathode hCurrent" "cathode TotalCurrent" "cathode Charge" "anode OuterVoltage" "anode InnerVoltage"
    "anode QuasiFermiPotential" "anode DisplacementCurrent" "anode eCurrent" "anode hCurrent" "anode TotalCurrent"
    "anode Charge" "RaytracePhoton Input" "RaytracePhoton Escaped" "RaytracePhoton StoppedMinInt" "RaytracePhoton StoppedDepth"
    "RaytracePhoton AbsorbedBulk" "RaytracePhoton AbsorbedBC" "RaytracePower Input" "RaytracePower Escaped" "RaytracePower StoppedMinInt"
    "RaytracePower StoppedDepth" "RaytracePower AbsorbedBulk" "RaytracePower AbsorbedBC" "RaytraceFraction Escaped" "RaytraceFraction StoppedMinInt"
    "RaytraceFraction StoppedDepth" "RaytraceFraction AbsorbedBulk" "RaytraceFraction AbsorbedBC" "RaytraceInterfaceFlux R(n+/STI)" "RaytraceInterfaceFlux T(n+/STI)"
    "RaytraceInterfaceFlux A(n+/STI)" "RaytraceInterfaceFlux R(STI/n+)" "RaytraceInterfaceFlux T(STI/n+)" "RaytraceInterfaceFlux A(STI/n+)" "RaytraceInterfaceFlux R(p+/STI)"
    "RaytraceInterfaceFlux T(p+/STI)" "RaytraceInterfaceFlux A(p+/STI)" "RaytraceInterfaceFlux R(STI/p+)" "RaytraceInterfaceFlux T(STI/p+)" "RaytraceInterfaceFlux A(STI/p+)"
    "RaytraceInterfaceFlux R(p_substrate_1/STI)" "RaytraceInterfaceFlux T(p_substrate_1/STI)" "RaytraceInterfaceFlux A(p_substrate_1/STI)" "RaytraceInterfaceFlux R(STI/p_substrate_1)" "RaytraceInterfaceFlux T(STI/p_substrate_1)"
    "RaytraceInterfaceFlux A(STI/p_substrate_1)" "RaytraceInterfaceFlux R(p_substrate_2/STI)" "RaytraceInterfaceFlux T(p_substrate_2/STI)" "RaytraceInterfaceFlux A(p_substrate_2/STI)" "RaytraceInterfaceFlux R(STI/p_substrate_2)"
    "RaytraceInterfaceFlux T(STI/p_substrate_2)" "RaytraceInterfaceFlux A(STI/p_substrate_2)" "RaytraceInterfaceFlux R(STI_right/n_well)" "RaytraceInterfaceFlux T(STI_right/n_well)" "RaytraceInterfaceFlux A(STI_right/n_well)"
    "RaytraceInterfaceFlux R(n_well/STI_right)" "RaytraceInterfaceFlux T(n_well/STI_right)" "RaytraceInterfaceFlux A(n_well/STI_right)" "RaytraceInterfaceFlux R(STI_right/n+)" "RaytraceInterfaceFlux T(STI_right/n+)"
    "RaytraceInterfaceFlux A(STI_right/n+)" "RaytraceInterfaceFlux R(n+/STI_right)" "RaytraceInterfaceFlux T(n+/STI_right)" "RaytraceInterfaceFlux A(n+/STI_right)" "RaytraceInterfaceFlux R(STI_right/p_substrate)"
    "RaytraceInterfaceFlux T(STI_right/p_substrate)" "RaytraceInterfaceFlux A(STI_right/p_substrate)" "RaytraceInterfaceFlux R(p_substrate/STI_right)" "RaytraceInterfaceFlux T(p_substrate/STI_right)" "RaytraceInterfaceFlux A(p_substrate/STI_right)" ]
  functions = [
    Time
    OuterVoltage InnerVoltage QuasiFermiPotential DisplacementCurrent eCurrent
    hCurrent TotalCurrent Charge OuterVoltage InnerVoltage
    QuasiFermiPotential DisplacementCurrent eCurrent hCurrent TotalCurrent
    Charge Input Escaped StoppedMinInten StoppedDepth
    AbsorbedBulk AbsorbedBC Input Escaped StoppedMinInten
    StoppedDepth AbsorbedBulk AbsorbedBC Escaped StoppedMinInten
    StoppedDepth AbsorbedBulk AbsorbedBC Reflection Transmission
    Absorption Reflection Transmission Absorption Reflection
    Transmission Absorption Reflection Transmission Absorption
    Reflection Transmission Absorption Reflection Transmission
    Absorption Reflection Transmission Absorption Reflection
    Transmission Absorption Reflection Transmission Absorption
    Reflection Transmission Absorption Reflection Transmission
    Absorption Reflection Transmission Absorption Reflection
    Transmission Absorption Reflection Transmission Absorption ]
}

Data {
      0.00000000000000E+00
      3.00000000000000E+01   3.00000000000004E+01   0.00000000000000E+00   0.00000000000000E+00   4.04287827224292E-14
     -3.99413240212498E-14   4.87458701179405E-16  -3.86583904582984E-14   3.00000000000000E+01   3.00000000000000E+01
      0.00000000000000E+00   0.00000000000000E+00   7.84419672043479E-13  -7.84907013435574E-13  -4.87341392094511E-16
      3.86583904582991E-14   1.20129895103880E+07   6.72875564359308E+06   3.46207287459887E+04   0.00000000000000E+00
      5.24961313804888E+06   0.00000000000000E+00   5.65486677646164E-12   3.16742278872217E-12   1.62969932333071E-14
      0.00000000000000E+00   2.47114699450615E-12   0.00000000000000E+00   5.60123326318942E-01   2.88194114512887E-03
      0.00000000000000E+00   4.36994732535927E-01   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   1.85950832259501E+04   1.19838741037123E+05   1.15455946960130E-11   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   1.06657126622773E+04   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   2.30273361155187E+02   1.48406623137066E+03   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00
      3.00000000000000E+01   3.00000000000004E+01   0.00000000000000E+00   0.00000000000000E+00  -7.87781071524480E-13
     -1.92092881541893E-13  -9.79873953066373E-13  -3.86583559236798E-14   3.00000000000000E+01   3.00000000000000E+01
      0.00000000000000E+00   0.00000000000000E+00   8.80348745034534E-13   9.92804821720281E-14   9.79629227206562E-13
      3.86583559236759E-14   1.20129895103880E+07   5.88880415487675E+06   4.47946895466066E+04   0.00000000000000E+00
      6.07939066596460E+06   0.00000000000000E+00   5.65486677646164E-12   2.77203296812221E-12   2.10861752155845E-14
      0.00000000000000E+00   2.86174763312383E-12   0.00000000000000E+00   4.90203054767053E-01   3.72885446273564E-03
      0.00000000000000E+00   5.06068090770209E-01   0.00000000000000E+00   4.53848924400159E+01   1.80784303016659E+03
     -2.05749630955610E-13   4.62446388281619E+04   2.17702936425875E+05   1.50842651809598E-11   5.40049654683358E+04
      0.00000000000000E+00   0.00000000000000E+00   3.57601285691734E+03   2.30460063868841E+04  -2.95563787264824E-12
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   5.26808829737343E+03   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   3.01346687706445E+03   1.20057872313266E+05
      1.33370975490132E-11   8.89750148060138E+02   2.49199934676816E+03   1.79278329767824E-13   0.00000000000000E+00
      0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00   0.00000000000000E+00
}
