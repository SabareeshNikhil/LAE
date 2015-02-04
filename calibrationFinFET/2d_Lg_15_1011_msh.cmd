Title "Untitled"

Controls {
}

Definitions {
	Constant "ChannelRegion_1.0" {
		Species = "BoronActiveConcentration"
		Value = 1e+17
	}
	AnalyticalProfile "G2_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 2.5e-09)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G2_Prof_1" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G1_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G1_Prof_1" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Length = 0)
	}
	Constant "SourceRegion" {
		Species = "PhosphorusActiveConcentration"
		Value = 2e+20
	}
	Constant "DrainRegion" {
		Species = "PhosphorusActiveConcentration"
		Value = 2e+20
	}
	Refinement "UnivMeshDef" {
		MaxElementSize = ( 0.001 0.001 0.001 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "SourceExtMeshDef" {
		MaxElementSize = ( 0.0066666666666667 0.010333333333333 )
		MinElementSize = ( 0.0066666666666667 0.010333333333333 )
	}
	Refinement "DrainExtMeshDef" {
		MaxElementSize = ( 0.0066666666666667 0.010333333333333 )
		MinElementSize = ( 0.0066666666666667 0.010333333333333 )
	}
	Refinement "FinMeshDef" {
		MaxElementSize = ( 0.00020833333333333 0.0002 )
		MinElementSize = ( 0.00020833333333333 0.0002 )
	}
	Refinement "CFinMeshDef" {
		MaxElementSize = ( 0.0001875 0.0002 )
		MinElementSize = ( 0.0001875 0.0002 )
	}
	Refinement "Ch0MeshDef" {
		MaxElementSize = ( 0.0006 3e-05 )
		MinElementSize = ( 0.0006 3e-05 )
	}
	Refinement "Ch1MeshDef" {
		MaxElementSize = ( 0.0006 3e-05 )
		MinElementSize = ( 0.0006 3e-05 )
	}
	Refinement "BackOxideMeshDef" {
		MaxElementSize = ( 0.0005 4.4666666666667e-05 )
		MinElementSize = ( 0.0005 4.4666666666667e-05 )
	}
	Refinement "FntOxideMeshDef" {
		MaxElementSize = ( 0.0005 4.4666666666667e-05 )
		MinElementSize = ( 0.0005 4.4666666666667e-05 )
	}
	Refinement "BackGateChMeshDef" {
		MaxElementSize = ( 0.0005 0.0001875 )
		MinElementSize = ( 0.0005 1.5e-05 )
	}
	Refinement "FntGateChMeshDef" {
		MaxElementSize = ( 0.0005 0.0001875 )
		MinElementSize = ( 0.0005 1.5e-05 )
	}
	Refinement "GateMeshDef0" {
		MaxElementSize = ( 0.0015 0.009268 )
		MinElementSize = ( 0.0011538461538462 0.00662 )
	}
	Refinement "GateMeshDef2" {
		MaxElementSize = ( 0.0015 0.009268 )
		MinElementSize = ( 0.0011538461538462 0.00662 )
	}
}

Placements {
	Constant "ChDef_1.0" {
		Reference = "ChannelRegion_1.0"
		EvaluateWindow {
			Element = Rectangle [(0.1425 0.1475) (0.1575 0.1525)]
		}
	}
	AnalyticalProfile "G2_def" {
		Reference = "G2_Prof"
		ReferenceElement {
			Element = Line [(0.1389 0.1525) (0.1389 0.1475)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G2_def_1" {
		Reference = "G2_Prof_1"
		ReferenceElement {
			Element = Line [(0.1389 0.1525) (0.1389 0.1475)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G1_def" {
		Reference = "G1_Prof"
		ReferenceElement {
			Element = Line [(0.1611 0.1525) (0.1611 0.1475)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G1_def_1" {
		Reference = "G1_Prof_1"
		ReferenceElement {
			Element = Line [(0.1611 0.1525) (0.1611 0.1475)]
			Direction = negative
		}
		notevalline
	}
	Constant "SourceExtDef" {
		Reference = "SourceRegion"
		EvaluateWindow {
			Element = Rectangle [(0.1175 0.1345) (0.1375 0.1655)]
		}
	}
	Constant "DrainExtDef" {
		Reference = "DrainRegion"
		EvaluateWindow {
			Element = Rectangle [(0.1625 0.1345) (0.1825 0.1655)]
		}
	}
	Refinement "Ref1" {
		Reference = "UnivMeshDef"
		RefineWindow = Rectangle [(0 0) (0.3 0.3)]
	}
	Refinement "RefSrcExt" {
		Reference = "SourceExtMeshDef"
		RefineWindow = Rectangle [(0.1175 0.1345) (0.1375 0.1655)]
	}
	Refinement "RefDrnExt" {
		Reference = "DrainExtMeshDef"
		RefineWindow = Rectangle [(0.1625 0.1345) (0.1825 0.1655)]
	}
	Refinement "RefFin" {
		Reference = "FinMeshDef"
		RefineWindow = Rectangle [(0.1375 0.1475) (0.1625 0.1525)]
	}
	Refinement "CRefFin" {
		Reference = "CFinMeshDef"
		RefineWindow = Rectangle [(0.14249 0.1475) (0.15751 0.1525)]
	}
	Refinement "RefCh0" {
		Reference = "Ch0MeshDef"
		RefineWindow = Rectangle [(0.1425 0.1475) (0.1575 0.149166666667)]
	}
	Refinement "RefCh1" {
		Reference = "Ch1MeshDef"
		RefineWindow = Rectangle [(0.1425 0.150833333333) (0.1575 0.1525)]
	}
	Refinement "RefBackOxide" {
		Reference = "BackOxideMeshDef"
		RefineWindow = Rectangle [(0.14249 0.1525) (0.15751 0.15317)]
	}
	Refinement "RefFntOxide" {
		Reference = "FntOxideMeshDef"
		RefineWindow = Rectangle [(0.14249 0.14683) (0.15751 0.1475)]
	}
	Refinement "RefBackGateCh" {
		Reference = "BackGateChMeshDef"
		RefineWindow = Rectangle [(0.14249 0.1525) (0.15751 0.152607142857)]
	}
	Refinement "RefFntGateCh" {
		Reference = "FntGateChMeshDef"
		RefineWindow = Rectangle [(0.14249 0.147392857143) (0.15751 0.1475)]
	}
	Refinement "RefGate0" {
		Reference = "GateMeshDef0"
		RefineWindow = Rectangle [(0.1425 0.12683) (0.15751 0.14683)]
	}
	Refinement "RefGate2" {
		Reference = "GateMeshDef2"
		RefineWindow = Rectangle [(0.14249 0.1525) (0.1575 0.17317)]
	}
}

