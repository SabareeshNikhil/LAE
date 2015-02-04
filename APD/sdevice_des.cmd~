Electrode {
    { Name="cathode" voltage=30.0 Material="Gold" resist = 9e-6 }
    { Name="anode" voltage=30 Material="Gold" resist = 1.1e-6 }
   
}

File {
    Grid = "sde_msh.tdr"
    Plot = "sde_des.tdr"
    Parameter = "sdevice.par"
    Output = "sde_des.log"
    Current = "sde_des.plt"
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

    SRHRecombination
    SurfaceRecombination
    TotalRecombination
    eLifetime hLifetime        
    eAugerRecombination hAugerRecombination AvalancheGeneration
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



Math {

    Extrapolate
    Derivatives
    Avalderivatives
    RecomputeQFP

    Digits=5
    ErrReff(electron)=1.e10
    ErrReff(hole)=1.e10
    RelErrControl

    Method=ParDiSo

    StackSize = 6000000

    WallClock
}

Physics {

    AreaFactor = 20
    Temperature = 77
    Hydrodynamic
    Thermionic
    Recombination(SRH (TempDependence) Auger Avalanche(GradQuasiFermi) SurfaceSRH)
    Fermi
    EffectiveIntrinsicDensity(NoFermi)
    Mobility (
        PhuMob
        eHighFieldSaturation
        hHighFieldSaturation
    )       
    HeteroInterfaces
     	    
}



Physics (Material="Silicon") {
    EffectiveIntrinsicDensity( TableBGN )
    Recombination(SRH(DopingDependence) SurfaceSRH)
}

Physics (MaterialInterface="Silicon/Oxide"){
    Recombination(SurfaceSRH)
}



Solve {

    Poisson                                                                            
    Coupled (iterations = 40) { Poisson Electron Hole}                                                
    Quasistationary ( InitialStep=1e-2 MaxStep=0.01 MinStep=1e-20       
                      Increment=1.2 Decrement=1.2
                      Goal {Name="anode" Value = 0.0}  
                      Plot {Range=(0 1) Intervals=8} 
){
   Coupled (iterations=20) { Poisson Electron Hole}
}
}

