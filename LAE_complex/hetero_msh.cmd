Title "Untitled"

Controls {
}

Definitions {
	Constant "ConstantProfileDefinition_3" {
		Species = "BoronActiveConcentration"
		Value = 5e+15
	}
	Constant "ConstantProfileDefinition_1" {
		Species = "BoronActiveConcentration"
		Value = 1e+19
	}
	Constant "ConstantProfileDefinition_2" {
		Species = "ArsenicActiveConcentration"
		Value = 1e+15
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = ( 1 0.04 )
		MinElementSize = ( 0.5 0.02 )
		RefineFunction = MaxTransDiff(Variable = "DopingConcentration",Value = 1)
	}
	Refinement "RefinementDefinition_2" {
		MaxElementSize = ( 2 0.5 )
		MinElementSize = ( 0.5 0.04 )
		RefineFunction = MaxTransDiff(Variable = "DopingConcentration",Value = 1)
	}
	Refinement "RefinementDefinition_4" {
		MaxElementSize = ( 1 0.04 )
		MinElementSize = ( 0.5 0.02 )
		RefineFunction = MaxTransDiff(Variable = "DopingConcentration",Value = 1)
	}
	Refinement "RefinementDefinition_3" {
		MaxElementSize = ( 0.4 0.1 )
		MinElementSize = ( 0.1 0.04 )
		RefineFunction = MaxTransDiff(Variable = "DopingConcentration",Value = 1)
	}
}

Placements {
	Constant "ConstantProfilePlacement_1" {
		Reference = "ConstantProfileDefinition_1"
		EvaluateWindow {
			Element = region ["p_region"]
		}
	}
	Constant "ConstantProfilePlacement_2" {
		Reference = "ConstantProfileDefinition_2"
		EvaluateWindow {
			Element = region ["n_region"]
		}
	}
	Constant "ConstantProfilePlacement_3" {
		Reference = "ConstantProfileDefinition_3"
		EvaluateWindow {
			Element = region ["Subs_region"]
		}
	}
	Constant "ConstantProfilePlacement_4" {
		Reference = "ConstantProfileDefinition_2"
		EvaluateWindow {
			Element = material ["AlGaAs"]
		}
	}
	Refinement "RefinementPlacement_2" {
		Reference = "RefinementDefinition_2"
		RefineWindow = region ["p_region"]
	}
	Refinement "RefinementPlacement_3" {
		Reference = "RefinementDefinition_3"
		RefineWindow = region ["n_region"]
	}
	Refinement "RefinementPlacement_4" {
		Reference = "RefinementDefinition_4"
		RefineWindow = Rectangle [(30 14.3) (40 14.7)]
	}
	Refinement "RefinementPlacement_5" {
		Reference = "RefinementDefinition_3"
		RefineWindow = material ["AlGaAs"]
	}
}

