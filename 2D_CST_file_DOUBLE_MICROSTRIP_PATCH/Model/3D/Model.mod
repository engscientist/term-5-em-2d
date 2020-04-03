'# MWS Version: Version 2016.0 - Jan 22 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = MHz
'# time = ns
'# frequency range: fmin = 2110 fmax = 2360
'# created = '[VERSION]2016.0|25.0.2|20160122[/VERSION]


'@ use template: Antenna - Planar_5.cfg

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "MHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' optimize mesh settings for planar structures
With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With
' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)
MeshAdaption3D.SetAdaptionStrategy "Energy"
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "2110", "2360"
Dim sDefineAt As String
sDefineAt = "2110;2235;2360"
Dim sDefineAtName As String
sDefineAtName = "2110;2235;2360"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency zz_val
    .Create
End With
' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield ("& zz_name &")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .Frequency zz_val
    .ExportFarfieldSource "False"
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")

'@ define view: Start

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Plot.StoreView "Start", "0.866025 -0.17101 0.469846 0 0 0.939693 0.34202 0 -0.5 -0.296198 0.813798 0 0 0 0 1 1.47238 2.06432 -0.688106" 
Plot.StoreView2 "Start", "1 1 0 0 0 1 0 0" 
Plot.StoreView3 "Start", "0 0 0 1 0 0 0 1 0 50 -1"

'@ define material: FR4

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material 
     .Reset 
     .Name "FR4"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "MHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "4.2"
     .Mue "1"
     .Sigma "0"
     .TanD "0.015"
     .TanDFreq "1000"
     .TanDGiven "True"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMue "False"
     .ConstTanDModelOrderMue "1"
     .SetMagParametricConductivity "False"
     .DispModelEps "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMue "Nth Order"
     .MaximalOrderNthModelFitMue "10"
     .ErrorLimitNthModelFitMue "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMue "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ delete material: FR4

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Material.Delete "FR4"

'@ define material: Rogers RO4350B (loss free)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4350B (loss free)"
     .Folder ""
.FrqType "all" 
.Type "Normal" 
.SetMaterialUnit "GHz", "mm"
.Epsilon "3.48" 
.Mue "1.0" 
.Kappa "0.0" 
.TanD "0.0" 
.TanDFreq "0.0" 
.TanDGiven "False" 
.TanDModel "ConstTanD" 
.KappaM "0.0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstKappa" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "0.62" 
.SetActiveMaterial "all" 
.Colour "0.75", "0.95", "0.85" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ delete material: Rogers RO4350B (loss free)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Material.Delete "Rogers RO4350B (loss free)"

'@ define material: Rogers RO4350B (lossy)

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4350B (lossy)"
     .Folder ""
.FrqType "all" 
.Type "Normal" 
.SetMaterialUnit "GHz", "mm"
.Epsilon "3.48" 
.Mue "1.0" 
.Kappa "0.0" 
.TanD "0.0037" 
.TanDFreq "10.0" 
.TanDGiven "True" 
.TanDModel "ConstTanD" 
.KappaM "0.0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstKappa" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "0.62" 
.SetActiveMaterial "all" 
.Colour "0.94", "0.82", "0.76" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ define material: FR4

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material 
     .Reset 
     .Name "FR4"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "MHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "epsilonrelative"
     .Mue "1"
     .Sigma "0"
     .TanD "0.015"
     .TanDFreq "1000"
     .TanDGiven "True"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMue "False"
     .ConstTanDModelOrderMue "1"
     .SetMagParametricConductivity "False"
     .DispModelEps "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMue "Nth Order"
     .MaximalOrderNthModelFitMue "10"
     .ErrorLimitNthModelFitMue "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMue "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.941176", "0.819608", "0.760784" 
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

'@ define brick: component1:SUBSTRATE

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "SUBSTRATE" 
     .Component "component1" 
     .Material "FR4" 
     .Xrange "-(W+2*DeltaW)/2", "(W+2*DeltaW)/2" 
     .Yrange "-h/2", "h/2" 
     .Zrange "-(L+2*DeltaL)/2", "(L+2*DeltaL)/2" 
     .Create
End With

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:SUBSTRATE", "5"

'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"

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

'@ define brick: component1:PATCH

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "PATCH" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "-L/2", "L/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ clear picks

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.ClearAllPicks

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:SUBSTRATE", "3"

'@ define extrude: component1:GROUND PLANE

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Extrude 
     .Reset 
     .Name "GROUND PLANE" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Mode "Picks" 
     .Height "t" 
     .Twist "0.0" 
     .Taper "0.0" 
     .UsePicksForHeight "False" 
     .DeleteBaseFaceSolid "False" 
     .ClearPickedFace "True" 
     .Create 
End With

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:SUBSTRATE", "5"

'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define brick: component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/12", "W/12" 
     .Yrange "-L/2-DeltaL", "-L/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ boolean add shapes: component1:PATCH, component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Add "component1:PATCH", "component1:solid1"

'@ pick edge

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickEdgeFromId "component1:PATCH", "4", "4"

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
     .Orientation "zmin" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-3.6566843923705", "3.6566843923705" 
     .Yrange "0.793", "0.793" 
     .Zrange "17.820913285697", "17.820913285697" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "h+2*t", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

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

'@ delete shape: component1:PATCH

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Delete "component1:PATCH"

'@ delete port: port1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Port.Delete "1"

'@ define brick: component1:PATCH ANTENNA

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "PATCH ANTENNA" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-W/2", "W/2" 
     .Yrange "-L/2", "L/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ define brick: component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-Wf/2", "Wf/2" 
     .Yrange "-L/2-DeltaL", "-L/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ boolean add shapes: component1:PATCH ANTENNA, component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Add "component1:PATCH ANTENNA", "component1:solid1"

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:PATCH ANTENNA", "3"

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
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-1.0970053177112", "1.0970053177112" 
     .Yrange "0.775", "0.793" 
     .Zrange "18.542729177355", "18.542729177355" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "t+h", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ set parametersweep options

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
    .SetSimulationType "Transient" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ delete parsweep sequence: Sequence 2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 2" 
End With

'@ add parsweep parameter: Sequence 1:factorWf

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Stepwidth "Sequence 1", "factorWf", "2", "20", "1" 
End With

'@ edit parsweep parameter: Sequence 1:factorWf

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "factorWf" 
     .AddParameter_Stepwidth "Sequence 1", "factorWf", "14", "34", "2" 
End With

'@ delete parsweep parameter: Sequence 1:factorWf

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "factorWf" 
End With

'@ add parsweep parameter: Sequence 1:alpha

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "alpha", "135", "150", "4" 
End With

'@ add parsweep sequence: Sequence 2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 2" 
End With

'@ delete parsweep parameter: Sequence 1:alpha

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "alpha" 
End With

'@ add parsweep parameter: Sequence 1:c

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "c", "0.135", "0.15", "4" 
End With

'@ add parsweep parameter: Sequence 2:f

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Stepwidth "Sequence 2", "f", "2120", "2350", "10" 
End With

'@ edit parsweep parameter: Sequence 2:f

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 2", "f" 
     .AddParameter_Linear "Sequence 2", "f", "2120", "2350", "3" 
End With

'@ transform: translate component1:PATCH ANTENNA

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1:PATCH ANTENNA" 
     .Vector "0", "0", "th+t" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Translate" 
End With

'@ transform: translate component1:SUBSTRATE

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1:SUBSTRATE" 
     .Vector "0", "0", "th+2*t+h" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Translate" 
End With

'@ transform: translate component1:GROUND PLANE

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1:GROUND PLANE" 
     .Vector "0", "0", "th+3*t+2*h" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Translate" 
End With

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:PATCH ANTENNA", "7"

'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define material: BLOOD

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material 
     .Reset 
     .Name "BLOOD"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "MHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "epsilon"
     .Mue "mu"
     .Sigma "sigma"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMue "False"
     .ConstTanDModelOrderMue "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMue "Nth Order"
     .MaximalOrderNthModelFitMue "10"
     .ErrorLimitNthModelFitMue "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMue "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "1", "0", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define brick: component1:BLOOD

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "BLOOD" 
     .Component "component1" 
     .Material "BLOOD" 
     .Xrange "-di/2", "di/2" 
     .Yrange "-(L+DeltaL)/2", "(L+DeltaL)/2" 
     .Zrange "th/2-di/2", "th/2+di/2" 
     .Create
End With

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:PATCH ANTENNA_1", "3"

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
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "-1.5671504538731", "1.5671504538731" 
     .Yrange "40.793", "40.811" 
     .Zrange "18.542729177355", "18.542729177355" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "t+h" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ delete parsweep sequence: Sequence 2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 2" 
End With

'@ delete shape: component1:BLOOD

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Delete "component1:BLOOD"

'@ define brick: component1:BLOOD

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "BLOOD" 
     .Component "component1" 
     .Material "BLOOD" 
     .Xrange "-wi/2", "wi/2" 
     .Yrange "-(L+DeltaL)/2", "(L+DeltaL)/2" 
     .Zrange "th/2-di/2", "th/2+di/2" 
     .Create
End With

