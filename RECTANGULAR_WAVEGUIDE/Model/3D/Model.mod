'# MWS Version: Version 2016.0 - Jan 22 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = GHz
'# time = s
'# frequency range: fmin = 8.2 fmax = 10.25
'# created = '[VERSION]2016.0|25.0.2|20160122[/VERSION]


'@ define material: Copper (annealed)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
     .FrqType "static" 
     .Type "Normal" 
     .SetMaterialUnit "Hz", "mm" 
     .Epsilon "1" 
     .Mue "1.0" 
     .Kappa "5.8e+007" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .KappaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstTanD" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .DispersiveFittingSchemeEps "Nth Order" 
     .DispersiveFittingSchemeMue "Nth Order" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMue "False" 
     .FrqType "all" 
     .Type "Lossy metal" 
     .SetMaterialUnit "GHz", "mm" 
     .Mue "1.0" 
     .Kappa "5.8e+007" 
     .Rho "8930.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "401.0" 
     .HeatCapacity "0.39" 
     .MetabolicRate "0" 
     .BloodFlow "0" 
     .VoxelConvection "0" 
     .MechanicsType "Isotropic" 
     .YoungsModulus "120" 
     .PoissonsRatio "0.33" 
     .ThermalExpansionRate "17" 
     .Colour "1", "1", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ new component: component1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Component.New "component1"

'@ define brick: component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-a/2-t", "a/2+t" 
     .Yrange "-b/2-t", "b/2+t" 
     .Zrange "-l/2", "l/2" 
     .Create
End With

'@ define view: DEFAULTVIEW

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Plot.StoreView "DEFAULTVIEW", "0.866025 -0.17101 0.469846 0 0 0.939693 0.34202 0 -0.5 -0.296198 0.813798 0 0 0 0 1 4.20896 0.359928 -0.147109" 
Plot.StoreView2 "DEFAULTVIEW", "1 1 0 0 0 1 0 0" 
Plot.StoreView3 "DEFAULTVIEW", "0 0 0 1 0 0 0 1 0 50 -1"

'@ define brick: component1:solid2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-a/2", "a/2" 
     .Yrange "-b/2", "b/2" 
     .Zrange "-l/2", "l/2" 
     .Create
End With

'@ boolean subtract shapes: component1:solid1, component1:solid2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Subtract "component1:solid1", "component1:solid2" 

'@ define brick: component1:solid2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-a/2", "a/2" 
     .Yrange "-b/2", "b/2" 
     .Zrange "-l/2", "l/2" 
     .Create
End With


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:solid1", "7" 


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:solid2", "1" 


'@ define port: 1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.79", "11.79" 
     .Yrange "-5.985", "5.985" 
     .Zrange "20", "20" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With 


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:solid2", "2" 


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:solid1", "8" 


'@ define port: 2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.79", "11.79" 
     .Yrange "-5.985", "5.985" 
     .Zrange "-20", "-20" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With 


'@ define frequency range

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solver.FrequencyRange "8.2", "10.25" 


'@ define time domain solver parameters

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With


'@ define units

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Units 
     .Geometry "mm" 
     .Frequency "GHz" 
     .Time "s" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "Siemens" 
     .Capacitance "PikoF" 
     .Inductance "NanoH" 
End With 


'@ define monitor: e-field (f=10)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


'@ define monitor: h-field (f=10)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


'@ define monitor: e-field (f=8.2)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=8.2)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "8.2" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


'@ define monitor: h-field (f=8.2)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=8.2)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "8.2" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


'@ define monitor: e-field (f=10.25)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10.25)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "10.25" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


'@ define monitor: h-field (f=10.25)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10.25)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "10.25" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.79", "11.79", "-5.985", "5.985", "-20", "20" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With 


