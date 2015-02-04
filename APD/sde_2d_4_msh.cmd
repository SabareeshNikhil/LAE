Title "Untitled"

Controls {
}

Definitions {
	Constant "ConstantProfileDefinition_pSubstrate" {
		Species = "DopingConcentration"
		Value = -3e+17
	}
	Constant "ConstantProfileDefinition_nWell" {
		Species = "DopingConcentration"
		Value = 1e+15
	}
	Constant "ConstantProfileDefinition_n+Implant_1" {
		Species = "DopingConcentration"
		Value = 3e+18
	}
	Constant "ConstantProfileDefinition_n+Implant" {
		Species = "DopingConcentration"
		Value = 3e+18
	}
	Constant "ConstantProfileDefinition_p+Implant" {
		Species = "DopingConcentration"
		Value = -3e+18
	}
	Multibox "MultiboxDefinition_pSubstrate"
 {
		MaxElementSize = ( 2 0.2 0 )
		MinElementSize = ( 0.5 0.1 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_nWell"
 {
		MaxElementSize = ( 0.5 0.1 0 )
		MinElementSize = ( 0.1 0.05 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_n+Implant_1"
 {
		MaxElementSize = ( 0.1 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_n+Implant"
 {
		MaxElementSize = ( 0.1 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_p+Implant"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_1_1"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_1_2"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_1_3"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_1"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_2"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
	Multibox "MultiboxDefinition_STI_3"
 {
		MaxElementSize = ( 0.05 0.05 0 )
		MinElementSize = ( 0.01 0.01 0 )
		Ratio = ( 1.2 1.2 1 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_pSubstrate" {
		Reference = "ConstantProfileDefinition_pSubstrate"
		EvaluateWindow {
			Element = Rectangle [(0 0) (7 3)]
		}
	}
	Constant "ConstantProfilePlacement_nWell" {
		Reference = "ConstantProfileDefinition_nWell"
		EvaluateWindow {
			Element = Rectangle [(0.55 0) (6.45 1.6)]
		}
	}
	Constant "ConstantProfilePlacement_n+Implant_1" {
		Reference = "ConstantProfileDefinition_n+Implant_1"
		EvaluateWindow {
			Element = Rectangle [(0.55 0) (1.4 0.15)]
		}
	}
	Constant "ConstantProfilePlacement_n+Implant" {
		Reference = "ConstantProfileDefinition_n+Implant"
		EvaluateWindow {
			Element = Rectangle [(5.6 0) (6.45 0.15)]
		}
	}
	Constant "ConstantProfilePlacement_p+Implant" {
		Reference = "ConstantProfileDefinition_p+Implant"
		EvaluateWindow {
			Element = Rectangle [(2 0) (5 0.2)]
		}
	}
	Multibox "MultiboxPlacement_pSubstrate" {
		Reference = "MultiboxDefinition_pSubstrate"
		RefineWindow = Rectangle [(0 0) (7 3)]
	}
	Multibox "MultiboxPlacement_nWell" {
		Reference = "MultiboxDefinition_nWell"
		RefineWindow = Rectangle [(0.55 0) (6.45 1.6)]
	}
	Multibox "MultiboxPlacement_n+Implant_1" {
		Reference = "MultiboxDefinition_n+Implant_1"
		RefineWindow = Rectangle [(0.65 0) (1.05 0.2)]
	}
	Multibox "MultiboxPlacement_n+Implant" {
		Reference = "MultiboxDefinition_n+Implant"
		RefineWindow = Rectangle [(4.95 0) (5.35 0.2)]
	}
	Multibox "MultiboxPlacement_p+Implant" {
		Reference = "MultiboxDefinition_p+Implant"
		RefineWindow = Rectangle [(2.15 0) (4.85 0.25)]
	}
	Multibox "MultiboxPlacement_STI_1_1" {
		Reference = "MultiboxDefinition_STI_1_1"
		RefineWindow = Rectangle [(1.1 0) (1.3 0.48)]
	}
	Multibox "MultiboxPlacement_STI_1_2" {
		Reference = "MultiboxDefinition_STI_1_2"
		RefineWindow = Rectangle [(2.15 0) (2.35 0.48)]
	}
	Multibox "MultiboxPlacement_STI_1_3" {
		Reference = "MultiboxDefinition_STI_1_3"
		RefineWindow = Rectangle [(1.1 0.33) (2.35 0.53)]
	}
	Multibox "MultiboxPlacement_STI_1" {
		Reference = "MultiboxDefinition_STI_1"
		RefineWindow = Rectangle [(4.65 0) (4.85 0.48)]
	}
	Multibox "MultiboxPlacement_STI_2" {
		Reference = "MultiboxDefinition_STI_2"
		RefineWindow = Rectangle [(5.7 0) (5.9 0.48)]
	}
	Multibox "MultiboxPlacement_STI_3" {
		Reference = "MultiboxDefinition_STI_3"
		RefineWindow = Rectangle [(4.65 0.33) (5.9 0.53)]
	}
}

