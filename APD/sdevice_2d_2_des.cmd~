Electrode {
    { Name="cathode" voltage=30.0 Material="Gold" }
    { Name="cathode1" voltage=30.0 Material="Gold" }
    { Name="anode" voltage=30 Material="Gold" }
   
}

File {
    Grid = "sde_2d_2_msh.tdr"
    Plot = "sde_2d_2_des.tdr"
    Output = "sde_2d_2_des.log"
    Current = "sde_2d_2_des.plt"
    Parameter = "../LAE/models.par"
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
*    eJouleHeat hJouleHeat
*    ThomsonHeat
*    PeltierHeat
    Temperature

    OpticalIntensity
    OpticalGeneration
}

Physics {

    AreaFactor = 4
    Temperature = 77
    Hydrodynamic
    Thermionic
    Recombination(SRH (TempDependence) Auger Avalanche (GradQuasiFermi) SurfaceSRH)
    Fermi
    EffectiveIntrinsicDensity(NoFermi)
    Mobility (
        PhuMob
        eHighFieldSaturation
        hHighFieldSaturation
    )       
    HeteroInterfaces
    Optics (
	
	ComplexRefractiveIndex(WavelengthDep (real imag) TemperatureDep (real))
	OpticalGeneration (ComputeFromMonochromaticSource QuantumYield (StepFunction(EffectiveBandgap)))
	Excitation (

	    Intensity = 1e-4
	    Wavelength = 0.422
	    Window ("Window1") (
		Origin = (3.15 , 0)
		OriginAnchor = Center
		Line (Dx = 3.5)
		 )
	)
	
   	OpticalSolver (
		TMM (
		    PropagationDirection = Refractive
       		    LayerStackExtraction ( WindowName = "Window1")
      		  )
  	    )
    )
	    
}

Physics (Material="Silicon") {
    EffectiveIntrinsicDensity( TableBGN )
    Recombination(SRH(DopingDependence) SurfaceSRH)
}

Physics (MaterialInterface="Silicon/Oxide"){
    Recombination(SurfaceSRH)
}



Math {

    Extrapolate
    Derivatives
    Avalderivatives
    RecomputeQFP

    Digits=5
    ErrReff(electron)=1.e20
    ErrReff(hole)=1.e20
    RelErrControl

    Method=ParDiSo


    WallClock
}

Solve {
    Optics
    Poisson                                                                            
    Coupled (iterations = 40) { Poisson Electron Hole}                                                
    Quasistationary ( InitialStep=1e-2 MaxStep=0.003 MinStep=1e-12      
                      Increment = 1.5 Decrement=1.5
                      Goal {Name="anode" Value = 0.0}  
*                      Plot {Range=(0 1) Intervals=8} 
){
   Coupled (iterations=20) { Poisson Electron Hole}
}
}
