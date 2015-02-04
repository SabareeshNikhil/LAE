Title "Untitled"

Controls {
}

Definitions {
	AnalyticalProfile "G2_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+17, Depth = 0.003)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G2_1_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+20, Depth = 0.0154)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G7_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+17, Depth = 0.003)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G7_1_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+20, Depth = 0.0154)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G8_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+17, Depth = 0.003)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G8_1_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+20, ValueAtDepth = 1e+20, Depth = 0.0154)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G6_Prof" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+17, ValueAtDepth = 1e+17, Depth = 0.0085)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G3_1_1_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Factor = 1)
	}
	AnalyticalProfile "G4_2_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+18, ValueAtDepth = 1e+18, Depth = 0.01)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G4_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+18, Depth = 0.0026)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G4_1_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 0.01)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G2_1_1_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0036)
		LateralFunction = Gauss(Factor = -1)
	}
	AnalyticalProfile "G5_2_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+18, ValueAtDepth = 1e+18, Depth = 0.01)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G5_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 1e+17, Depth = 0.0026)
		LateralFunction = Gauss(Length = 0)
	}
	AnalyticalProfile "G5_1_Prof" {
		Species = "BoronActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 4e+20, ValueAtDepth = 4e+20, Depth = 0.01)
		LateralFunction = Gauss(Length = 0)
	}
	Constant "Ssideldd" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+17
	}
	Constant "Dsideldd" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+17
	}
	Constant "HDsrc" {
		Species = "BoronActiveConcentration"
		Value = 4e+20
	}
	Constant "HDdrn" {
		Species = "BoronActiveConcentration"
		Value = 4e+20
	}
	Refinement "UnivMeshDef" {
		MaxElementSize = ( 0.001 0.001 0.001 )
		MinElementSize = ( 0.001 0.001 0.001 )
	}
	Refinement "OxMeshDef" {
		MaxElementSize = ( 0.001 6.7e-05 0.001 )
		MinElementSize = ( 0.001 6.7e-05 0.001 )
	}
	Refinement "IfaceMeshDef" {
		MaxElementSize = ( 0.001 5.7e-05 0.001 )
		MinElementSize = ( 0.001 5.7e-05 0.001 )
	}
	Refinement "SMeshDef" {
		MaxElementSize = ( 0.00015 0.001 0.001 )
		MinElementSize = ( 0.00015 0.001 0.001 )
	}
	Refinement "DMeshDef" {
		MaxElementSize = ( 0.00015 0.001 0.001 )
		MinElementSize = ( 0.00015 0.001 0.001 )
	}
	Refinement "SlddMeshDef" {
		MaxElementSize = ( 0.001 0.00015 0.001 )
		MinElementSize = ( 0.001 0.00015 0.001 )
	}
	Refinement "DlddMeshDef" {
		MaxElementSize = ( 0.001 0.00015 0.001 )
		MinElementSize = ( 0.001 0.00015 0.001 )
	}
	Refinement "BodyMeshDef" {
		MaxElementSize = ( 0.00025 0.00016666666666667 0.001 )
		MinElementSize = ( 0.00025 0.00016666666666667 0.001 )
	}
	Refinement "BodyVerticalMeshDef" {
		MaxElementSize = ( 0.00025 0.00016666666666667 0.001 )
		MinElementSize = ( 0.00025 0.00016666666666667 0.001 )
	}
}

Placements {
	AnalyticalProfile "G2_def" {
		Reference = "G2_Prof"
		ReferenceElement {
			Element = Line [(-0.0075 0.015) (0.0075 0.015)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G2_1_def" {
		Reference = "G2_1_Prof"
		ReferenceElement {
			Element = Line [(-0.0075 0.0154) (0.0075 0.0154)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G7_def" {
		Reference = "G7_Prof"
		ReferenceElement {
			Element = Line [(-0.0225 0.015) (-0.0075 0.015)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G7_1_def" {
		Reference = "G7_1_Prof"
		ReferenceElement {
			Element = Line [(-0.0225 0.0154) (-0.0075 0.0154)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G8_def" {
		Reference = "G8_Prof"
		ReferenceElement {
			Element = Line [(0.0075 0.015) (0.0225 0.015)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G8_1_def" {
		Reference = "G8_1_Prof"
		ReferenceElement {
			Element = Line [(0.0075 0.0154) (0.0225 0.0154)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G6_def" {
		Reference = "G6_Prof"
		ReferenceElement {
			Element = Line [(-0.0075 0.018) (0.0075 0.018)]
			Direction = positive
		}
		notevalline
		Replace
	}
	AnalyticalProfile "G3_1_1_def" {
		Reference = "G3_1_1_Prof"
		ReferenceElement {
			Element = Line [(-0.0225 0.024) (-0.0111 0.024)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G4_2_def" {
		Reference = "G4_2_Prof"
		ReferenceElement {
			Element = Line [(-0.0075 0.0265) (-0.0075 0.024)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G4_def" {
		Reference = "G4_Prof"
		ReferenceElement {
			Element = Line [(-0.0105 0.0265) (-0.0105 0.024)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G4_1_def" {
		Reference = "G4_1_Prof"
		ReferenceElement {
			Element = Line [(-0.0105 0.0265) (-0.0105 0.024)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G2_1_1_def" {
		Reference = "G2_1_1_Prof"
		ReferenceElement {
			Element = Line [(0.0111 0.024) (0.0225 0.024)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G5_2_def" {
		Reference = "G5_2_Prof"
		ReferenceElement {
			Element = Line [(0.0075 0.0265) (0.0075 0.024)]
			Direction = positive
		}
		notevalline
	}
	AnalyticalProfile "G5_def" {
		Reference = "G5_Prof"
		ReferenceElement {
			Element = Line [(0.0105 0.0265) (0.0105 0.024)]
			Direction = negative
		}
		notevalline
	}
	AnalyticalProfile "G5_1_def" {
		Reference = "G5_1_Prof"
		ReferenceElement {
			Element = Line [(0.0105 0.0265) (0.0105 0.024)]
			Direction = positive
		}
		notevalline
	}
	Constant "Ssideldd_Def" {
		Reference = "Ssideldd"
		EvaluateWindow {
			Element = Rectangle [(-0.0225 0.012) (-0.0075 0.024)]
		}
	}
	Constant "Dsideldd_Def" {
		Reference = "Dsideldd"
		EvaluateWindow {
			Element = Rectangle [(0.0225 0.012) (0.0075 0.024)]
		}
	}
	Constant "HDsrc_Def" {
		Reference = "HDsrc"
		EvaluateWindow {
			Element = Rectangle [(-0.0245 0.0265) (-0.0125 0.0415)]
		}
	}
	Constant "HDdrn_Def" {
		Reference = "HDdrn"
		EvaluateWindow {
			Element = Rectangle [(0.0245 0.0265) (0.0125 0.0415)]
		}
	}
	Refinement "Ref1" {
		Reference = "UnivMeshDef"
		RefineWindow = Rectangle [(-0.0245 0) (0.0245 0.0465)]
	}
	Refinement "Ref1_ox" {
		Reference = "OxMeshDef"
		RefineWindow = Rectangle [(-0.0075 0.0265) (0.0075 0.02717)]
	}
	Refinement "Ref1_Iface" {
		Reference = "IfaceMeshDef"
		RefineWindow = Rectangle [(-0.0075 0.0265) (0.0075 0.0255)]
	}
	Refinement "Ref1_S" {
		Reference = "SMeshDef"
		RefineWindow = Rectangle [(-0.0105 0.015) (-0.0045 0.0265)]
	}
	Refinement "Ref1_D" {
		Reference = "DMeshDef"
		RefineWindow = Rectangle [(0.0045 0.015) (0.0105 0.0265)]
	}
	Refinement "Ref1_Sldd" {
		Reference = "SlddMeshDef"
		RefineWindow = Rectangle [(-0.0225 0.015) (-0.0075 0.024)]
	}
	Refinement "Ref1_Dldd" {
		Reference = "DlddMeshDef"
		RefineWindow = Rectangle [(0.0225 0.015) (0.0075 0.024)]
	}
	Refinement "Ref1_Body" {
		Reference = "BodyMeshDef"
		RefineWindow = Rectangle [(-0.0225 0.015) (0.0225 0.024)]
	}
	Refinement "Ref1_BodyVertical" {
		Reference = "BodyVerticalMeshDef"
		RefineWindow = Rectangle [(-0.0075 0.0174) (0.0075 0.0264)]
	}
}

