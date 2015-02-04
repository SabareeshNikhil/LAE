Title ""

Controls {
}

Definitions {
	Constant "n_doping_definition" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+17
	}
	Refinement "RefinementDefinition_n" {
		MaxElementSize = ( 0.05 0.005 0.5 )
		MinElementSize = ( 0.05 0.001 0.1 )
	}
}

Placements {
	Constant "n_doping_placement" {
		Reference = "n_doping_definition"
		EvaluateWindow {
			Element = region ["n_region"]
		}
	}
	Refinement "RefinementPlacement_n" {
		Reference = "RefinementDefinition_n"
		RefineWindow = region ["n_region"]
	}
}

