Electrode {
    { Name="SiContactLeft" voltage=0.0 Material="Titanium" }
    { Name="SiContactRight" voltage=0.0 Material="Titanium" }
    { Name="SiGeContact" voltage=-1.0 Material="Titanium" Resist=2940}
}

File {
    Grid = "n@node|-1@_msh.tdr"
    Parameter = "pp@node@_des.par"
    Plot = "@tdrdat@"
    Output = "@log@"
    Current = "n@node@_des.plt"
}

Plot {
    eDensity hDensity 
    eCurrent/Vector hCurrent/Vector
    Current/Vector ConductionCurrent/Vector DisplacementCurrent/Vector
    Potential SpaceCharge ElectricField/Vector
    eMobility/Element hMobility/Element 
    eVelocity/Vector hVelocity/Vector
    eDriftVelocity/Vector hDriftVelocity/Vector
    eSaturationVelocity hSaturationVelocity

    OpticalGeneration
    SRHRecombination
    SurfaceRecombination
    TotalRecombination
    eLifetime hLifetime        
    eAugerRecombination hAugerRecombination
    Band2Bandsdevice
    RadiativeRecombination

    ValenceBandEnergy
    ConductionBandEnergy
    ElectronAffinity
    EquilibriumPotential
    eQuasiFermi hQuasiFermi
    eGradQuasiFermi/Vector hGradQuasiFermi/Vector
    BuiltinPotential
    BandGap
    BandGapNarrowing EffectiveIntrinsicDensity
    EffectiveBandGap

    eTemperature
    hTemperature
    Temperature
    
    Doping
    BoronConcentration bMinus
    PhosphorusConcentration phPlus

    TotalHeat
    ThermalConductivity
    eTemperature hTemperature
    RecombinationHeat
    eJouleHeat hJouleHeat
    ThomsonHeat
    PeltierHeat
    Temperature
}

Physics {
    AreaFactor=20
    Fermi
    EffectiveIntrinsicDensity(NoFermi)
    Mobility (
        PhuMob ( Phosphorus )
        eHighFieldSaturation
        hHighFieldSaturation
    )       
    HeteroInterfaces
}

Physics (Material="Silicon") {
    EffectiveIntrinsicDensity( TableBGN )
    Recombination(SRH(DopingDependence))
}

Physics (Material="SiliconGermanium") {
    EffectiveIntrinsicDensity( TableBGN )
    MoleFraction(xFraction=0.25)
    Recombination(SRH(DopingDependence))
}

Physics (MaterialInterface="SiliconGermanium/Silicon") {
    eThermionic
    hThermionic
    Recombination(SurfaceSRH)
}

Physics (MaterialInterface="Silicon/Oxide"){
    Recombination(SurfaceSRH)
}

Physics (MaterialInterface="SiliconGermanium/Oxide"){
   Recombination(SurfaceSRH)
}

Math {

    RecomputeQFP

    Digits=5
    ErrReff(electron)=1.e10
    ErrReff(hole)=1.e10
    RelErrControl

    Method=pardiso
    Number_of_Threads=1
    Number_of_Solver_Threads=1

    WallClock
}

Solve {
    Poisson                                                                            
    Coupled (iterations = 100) { Poisson Electron Hole}                                                
    Quasistationary ( InitialStep=1e-1 MaxStep=0.1 MinStep=1e-9       
                      Increment=2 Decrement=2.0
                      Goal {Voltage=1.0 Name=SiGeContact}  
                      Plot {Range=(0 1) Intervals=8} ){
   Coupled (iterations=20) { Poisson Electron Hole}
}
}
