'# MWS Version: Version 2016.0 - Jan 22 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = MHz
'# time = ns
'# frequency range: fmin = 896 fmax = 936
'# created = '[VERSION]2016.0|25.0.2|20160122[/VERSION]


'@ use template: Antenna - Planar_2.cfg

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
Solver.FrequencyRange "896", "936"
Dim sDefineAt As String
sDefineAt = "896;916;936"
Dim sDefineAtName As String
sDefineAtName = "896;916;936"
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

'@ new component: component1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Component.New "component1"

'@ define brick: component1:substrate

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "substrate" 
     .Component "component1" 
     .Material "Rogers RO4350B (lossy)" 
     .Xrange "-L", "L" 
     .Yrange "-W", "W" 
     .Zrange "0", "h" 
     .Create
End With

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:substrate", "1"

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

'@ define extrude: component1:solid1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Extrude 
     .Reset 
     .Name "solid1" 
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
Pick.PickFaceFromId "component1:substrate", "2"

'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"

'@ define brick: component1:Patch Antenna

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "Patch Antenna" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-L/2", "L/2" 
     .Yrange "-W/2", "W/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ define brick: component1:subtractor

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "subtractor" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "L/2-d", "L/2" 
     .Yrange "-(Wf/2+g)", "Wf/2+g" 
     .Zrange "0", "t" 
     .Create
End With

'@ boolean subtract shapes: component1:Patch Antenna, component1:subtractor

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Subtract "component1:Patch Antenna", "component1:subtractor"

'@ define brick: component1:microstripline

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "microstripline" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "L/2-d", "L" 
     .Yrange "-Wf/2", "Wf/2" 
     .Zrange "0", "t" 
     .Create
End With

'@ boolean add shapes: component1:Patch Antenna, component1:microstripline

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Add "component1:Patch Antenna", "component1:microstripline"

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:Patch Antenna", "6"

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
     .TextMaxLimit "1" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "79.64", "79.64" 
     .Yrange "-1.15", "1.15" 
     .Zrange "-0.018", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0", "0.0" 
     .ZrangeAdd "0", "h+t" 
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

'@ delete port: port1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Port.Delete "1"

'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:Patch Antenna", "6"

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
     .Xrange "79.64", "79.64" 
     .Yrange "-1.15", "1.15" 
     .Zrange "-0.018", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "Wf/2+5*h", "Wf/2+5*h" 
     .ZrangeAdd "h", "5*h" 
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

'@ add parsweep parameter: Sequence 1:L

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "L", "69.64", "89.64", "10" 
End With

'@ edit parsweep parameter: Sequence 1:L

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "L" 
     .AddParameter_Linear "Sequence 1", "L", "85", "87", "10" 
End With

'@ delete parsweep sequence: Sequence 1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteSequence "Sequence 1" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:L

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "L", "85", "86", "10" 
End With

'@ edit parsweep parameter: Sequence 1:L

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "L" 
     .AddParameter_Linear "Sequence 1", "L", "85.62", "85.625", "3" 
End With


'@ delete parsweep parameter: Sequence 1:L

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "L" 
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


'@ add parsweep parameter: Sequence 1:W

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "W", "100.5", "102.5", "3" 
End With


'@ edit parsweep parameter: Sequence 1:W

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "W" 
     .AddParameter_Linear "Sequence 1", "W", "100.5", "102.5", "10" 
End With


'@ transform: translate component1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1" 
     .Vector "0", "0", "s1+s2+vesselheight" 
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
Pick.PickFaceFromId "component1:Patch Antenna_1", "19" 


'@ activate global coordinates

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.ActivateWCS "global"


'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"


'@ transform: translate component1:Patch Antenna_1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Patch Antenna_1" 
     .Vector "0", "0", "-(t+h)" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "False" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Transform "Shape", "Translate" 
End With 


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:solid1_1", "5" 


'@ align wcs with face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
WCS.AlignWCSWithSelected "Face"


'@ transform: translate component1:solid1_1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Transform 
     .Reset 
     .Name "component1:solid1_1" 
     .Vector "0", "0", "-(t+h)" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "False" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Transform "Shape", "Translate" 
End With 


'@ define material: skin

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material 
     .Reset 
     .Name "skin"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "MHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "skinepsilon"
     .Mue "1"
     .Sigma "0"
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
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "76" 
     .Create
End With 


'@ define brick: component1:solid2

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "skin" 
     .Xrange "-L", "L" 
     .Yrange "-W", "W" 
     .Zrange "s2", "s2+vesselheight" 
     .Create
End With


'@ define material: blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material
     .Reset
     .Name "blood"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "1"
     .Mue "1"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .ConstTanDModelOrderEps "1"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .ConstTanDModelOrderMue "1"
     .DispModelEps "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "3"
     .ErrorLimitNthModelFitEps "0.01"
     .DispersiveFittingSchemeMue "Nth Order"
     .AddDispersionFittingValueEps "0.1", "76.8182454443825", "221.641134494173", "1.0"
     .AddDispersionFittingValueEps "0.2", "68.4738432550289", "115.059990632458", "1.0"
     .AddDispersionFittingValueEps "0.3", "65.6502510183341", "78.8589515742776", "1.0"
     .AddDispersionFittingValueEps "0.4", "64.1828321718796", "60.6489945539656", "1.0"
     .AddDispersionFittingValueEps "0.422222222222222", "63.9438618885212", "57.7730434712015", "1.0"
     .AddDispersionFittingValueEps "0.5", "63.2572475542198", "49.7333267655039", "1.0"
     .AddDispersionFittingValueEps "0.6", "62.6027643145963", "42.5001241802731", "1.0"
     .AddDispersionFittingValueEps "0.7", "62.1030699559808", "37.3865932409505", "1.0"
     .AddDispersionFittingValueEps "0.744444444444444", "61.9142639813766", "35.5731389635495", "1.0"
     .AddDispersionFittingValueEps "0.8", "61.6997719763589", "33.6053481035262", "1.0"
     .AddDispersionFittingValueEps "0.9", "61.3602871921475", "30.7161644656542", "1.0"
     .AddDispersionFittingValueEps "1.06666666666667", "60.8862780821185", "27.206610582395", "1.0"
     .AddDispersionFittingValueEps "1.38888888888889", "60.1510807057843", "23.0953297030954", "1.0"
     .AddDispersionFittingValueEps "1.71111111111111", "59.5320763343363", "20.8376504484609", "1.0"
     .AddDispersionFittingValueEps "2.03333333333333", "58.9648498262843", "19.545237054196", "1.0"
     .AddDispersionFittingValueEps "2.35555555555556", "58.4208755792015", "18.8129113591261", "1.0"
     .AddDispersionFittingValueEps "2.67777777777778", "57.8860468115685", "18.4294319222186", "1.0"
     .AddDispersionFittingValueEps "3", "57.3529593274927", "18.273895781352", "1.0"
     .UseGeneralDispersionEps "True"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "1060"
     .ThermalType "Normal"
     .ThermalConductivity "0.51"
     .HeatCapacity "3.824"
     .MetabolicRate "0"
     .BloodFlow "1e+006"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "1", "0", "0" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "False" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With 


'@ delete material: blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Material.Delete "blood"


'@ define material: blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Material 
     .Reset 
     .Name "blood"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "MHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "ns"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "waterepsilon"
     .Mue "watermu"
     .Sigma "watersigma"
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
     .Transparency "76" 
     .Create
End With 


'@ define brick: component1:blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "blood" 
     .Component "component1" 
     .Material "blood" 
     .Xrange "-L", "L" 
     .Yrange "-W", "W" 
     .Zrange "s2+(vesselheight - intheight)/2", "s2+(vesselheight - intheight)/2 + intheight" 
     .Create
End With


'@ boolean subtract shapes: component1:solid2, component1:blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Solid.Subtract "component1:solid2", "component1:blood" 

'@ define brick: component1:blood

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With Brick
     .Reset 
     .Name "blood" 
     .Component "component1" 
     .Material "blood" 
     .Xrange "-L", "L" 
     .Yrange "-W", "W" 
     .Zrange "s2+(vesselheight-intheight)/2", "s2+(vesselheight+intheight)/2" 
     .Create
End With


'@ clear picks

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.ClearAllPicks 


'@ pick face

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Pick.PickFaceFromId "component1:Patch Antenna_1", "6" 


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
     .Xrange "85.6225", "85.6225" 
     .Yrange "-1.15", "1.15" 
     .Zrange "-28.45", "-28.432" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "Wf/2+5*h", "Wf/2+5*h" 
     .ZrangeAdd "h", "5*h" 
     .SingleEnded "False" 
     .Create 
End With 


