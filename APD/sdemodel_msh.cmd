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
		Value = 3.01e+17
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
			Element = Polyhedron { Polygon [ (3 0 0) (3 3 0) (3 3 0) (3 0 0)] Polygon [ (3 3 0) (0 3 0) (3 3 0)] Polygon [ (0 0 0) (3 0 0) (3 0 0)]}
		}
	}
	Constant "ConstantProfilePlacement_nWell" {
		Reference = "ConstantProfileDefinition_nWell"
		EvaluateWindow {
			Element = Polyhedron { Polygon [ (2.5 0 0) (2.5 1.6 0) (2.5 1.6 0) (2.5 0 0)] Polygon [ (2.5 1.6 0) (0 1.6 0) (2.5 1.6 0)] Polygon [ (0 0 0) (2.5 0 0) (2.5 0 0)]}
		}
	}
	Constant "ConstantProfilePlacement_n+Implant" {
		Reference = "ConstantProfileDefinition_n+Implant"
		EvaluateWindow {
			Element = Polyhedron { Polygon [ (2.45 0 0) (2.45 0.15 0) (2.45 0.15 0) (2.45 0 0)] Polygon [ (2.45 0.15 0) (1.6 0.15 0) (1.6 0.15 0) (2.45 0.15 0)] Polygon [ (1.6 0.15 0) (1.6 0 0) (1.6 0 0) (1.6 0.15 0)] Polygon [ (1.6 0 0) (2.45 0 0) (2.45 0 0) (1.6 0 0)]}
		}
	}
	Constant "ConstantProfilePlacement_p+Implant" {
		Reference = "ConstantProfileDefinition_p+Implant"
		EvaluateWindow {
			Element = Polyhedron { Polygon [ (1 0 0) (1 0.2 0) (1 0.2 0) (1 0 0)] Polygon [ (1 0.2 0) (0 0.2 0) (1 0.2 0)] Polygon [ (0 0 0) (1 0 0) (1 0 0)]}
		}
	}
	Multibox "MultiboxPlacement_pSubstrate" {
		Reference = "MultiboxDefinition_pSubstrate"
		RefineWindow = Cuboid [(-3 0 -3) (3 3 3)]
	}
	Multibox "MultiboxPlacement_nWell" {
		Reference = "MultiboxDefinition_nWell"
		RefineWindow = Cuboid [(-2.5 0 -2.5) (2.5 1.6 2.5)]
	}
	Multibox "MultiboxPlacement_n+Implant" {
		Reference = "MultiboxDefinition_n+Implant"
		RefineWindow = Cuboid [(-2.55 0 -2.55) (2.55 0.2 2.55)]
	}
	Multibox "MultiboxPlacement_p+Implant" {
		Reference = "MultiboxDefinition_p+Implant"
		RefineWindow = Cuboid [(-1.1 0 -1.1) (1.1 0.25 1.1)]
	}
	Multibox "MultiboxPlacement_STI_1" {
		Reference = "MultiboxDefinition_STI_1"
		RefineWindow = Cuboid [(-1.1 0 -1.1) (1.1 0.48 1.1)]
	}
	Multibox "MultiboxPlacement_STI_2" {
		Reference = "MultiboxDefinition_STI_2"
		RefineWindow = Cuboid [(-1.7 0 -1.7) (1.7 0.48 1.7)]
	}
	Multibox "MultiboxPlacement_STI_3" {
		Reference = "MultiboxDefinition_STI_3"
		RefineWindow = Cuboid [(-1.7 0.33 -1.7) (1.7 0.53 1.7)]
	}
}

