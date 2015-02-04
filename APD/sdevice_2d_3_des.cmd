Electrode {
    { Name="Cathode" voltage=10.0 Material="Gold" }
    *{ Name="cathode1" voltage=10.0 Material="Gold" }
    { Name="Anode" voltage=10 Material="Gold" }
   
}

*File {
*    Grid = "sde_2d_3_msh.tdr"
*    Plot = "sde_2d_3_des.tdr"
*    Output = "sde_2d_3_des.log"
*    Current = "sde_2d_3_des.plt"
*    Parameter = "../LAE/models.par"
*}

File{
	* input files:
	*Grid=	"hetero_msh.tdr"
	Grid=	"../LAE/sdemodel_msh.tdr"
	Parameter = "../LAE/models.par"
	
	* output files:
	Plot=	"../LAE/sde_dvs_des.tdr"
	Current="sde_des_opt.plt"
	* Output=	"../LAE/sde_des.log"
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
	OpticalGeneration (ComputeFromMonochromaticSource QuantumYield(StepFunction(EffectiveBandgap)))
	Excitation (

	    Intensity = 1e-4
	    Wavelength = 0.422
	    Window ("Window1") (
		Origin = (3.65 , 0)
		OriginAnchor = Center
		Line (Dx = 4.5)
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
                      Goal {Name="Anode" Value = 0.0}  
*                      Plot {Range=(0 1) Intervals=8} 
){
   Coupled (iterations=20) { Poisson Electron Hole}
}
}
