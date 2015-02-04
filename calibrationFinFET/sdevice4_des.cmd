#==================================================
#  dessis.tpl
#
#  for use with run_dessis.tel
#==================================================


File {
	Grid      = "2d_Lg_15_@node|-9@_msh.tdr"
	Plot      = "2d_Lg_15_@node@.dat"
	Current   = "2d_Lg_15_@node@.plt"
	Output    = "2d_Lg_15_@node@.log"
	Parameter = "@parameter@"
	Load=  "Vd_@node|-2@_des.sav"
	MonteCarloOut = "n@node@_mc"
}

Electrode{
	{ Name="source"    Voltage=0.0 }
	{ Name="drain"     Voltage=0.0 }
	{ name=gate voltage=0.0 workfunction=@<WF+ VTS - VTScl >@}
        
	##{ Name="substrate"     Voltage=0.0 }
}


MonteCarlo {
  HighKModus = 0
  WithFermiDiracScreening
# #if "@ChannelDirection@" == "110"
  ChannelDirection = (1 1 0)
  Normal2OxideDirection = (-1 1 0)
# #else
#  ChannelDirection = (1 0 0)
#  Normal2OxideDirection = (0 0 1)
# #endif
   xGe = 000
# #if @MobStress@ == 1
#  MCStrain = (@Exx@,@Eyy@,@Ezz@,@Eyz@,@Exz@,@Exy@)
# #else
#  MCStrain = (0.0000,0.0000,0.000,0.0000,0.0000,0.0000)
# #endif
  CurrentErrorBar = 2.5
  MinCurrentComput = 8
  DrainContact = @ndrain@ # No. of drain contact in .grd (count from 0)
  SelfConsistent(FrozenQF)
#  Window = Rectangle[ (-0.5,-0.2) (0.5, 0.2) ] # picasso -compat
#  Window = Rectangle[ (@<0.15-(0.015/2)-0.025>@,@<0.15-((W/1.e3)/2)-0.00067-0.005>@) (@<0.15+(0.015/2)+0.025>@,@<0.15+((W/1.e3)/2)+0.00067+0.005>@) ] # picasso -compat
  Window = Rectangle[ (@<0.15-(L/2000)-0.025>@,@<0.15-((W/1.e3)/2)-0.00067-0.005>@) (@<0.15+(L/2000)+0.025>@,@<0.15+((W/1.e3)/2)+0.00067+0.005>@) ] # picasso -compat
# #if @< VDRAIN>0.1 || VDRAIN<-0.1 >@
#  FinalTime = @<(16.0e-6*L/0.2)/100*30>@
FinalTime = @<(16.0e-6*0.015/0.2)/100*30>@
# #else
#  FinalTime = @<(16.0e-6*L/0.2)/100*2>@
# #endif
  Plot { Range=(0,@<16.0e-6*0.015/0.2>@) intervals = 100 }
}

plot {
        MCField/Vector
        eMCDensity hMCDensity
        eMCEnergy hMCEnergy
        eMCVelocity/Vector hMCVelocity/Vector
        eMCAvalanche hMCAvalanche
        eMCCurrent/Vector hMCCurrent/Vector
        ElectricField/Vector
        *--Density and Currents, etc
	eDensity hDensity
	TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
	eMobility hMobility
	*eVelocity hVelocity
	eQuasiFermi hQuasiFermi

	*--Temperature 
	* eTemperature Temperature * hTemperature

	*--Fields and charges
	ElectricField/Vector Potential SpaceCharge

	*--Doping Profiles
	Doping DonorConcentration AcceptorConcentration

	*--Generation/Recombination
	SRH Band2Band * Auger
	* AvalancheGeneration eAvalancheGeneration hAvalancheGeneration

	*--Driving forces
	*eGradQuasiFermi/Vector hGradQuasiFermi/Vector
	*eEparallel hEparallel eENormal hENormal

	*--Band structure/Composition
	*BandGap 
	*BandGapNarrowing
	*Affinity
	ConductionBand ValenceBand
	*eQuantumPotential
     }


Physics{
        Mobility (DopingDep 
        EnormalDependence 
	eHighFieldsaturation( GradQuasiFermi )
	hHighFieldsaturation( GradQuasiFermi )
        )
        EffectiveIntrinsicDensity ( BandgapNarrowing (OldSlotBoom) )
        Recombination(
        SRH( DopingDep Tunneling(Hurkx) )
        #Band2Band
	)           
}



Math {
   Method=blocked
   Submethod=pardiso
   Digits=6
   Extrapolate
   Derivatives
   Iterations=20
   Notdamped=50
   NumberOfSolverThreads=4
}

solve {
         coupled {poisson hole }
         montecarlo
         plot(fileprefix="n@node@_mc" overwrite) 
}



