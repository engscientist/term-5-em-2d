MWS Result File Version 20150206
size=i:22

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:RefSpectrum_pw.sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:World.fid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:model.gex

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.fmm

type=s:FOLDER
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\Plane wave
files=s:plw.sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:HFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\H-Field\h-field (f=10) [pw]
files=s:h-field (f=10)_pw.m3d
ylabel=s:h-field (f=10) [pw]

type=s:SURFACECURRENT
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Surface Current\surface current (f=10) [pw]
files=s:h-field (f=10)_pw.m3d
ylabel=s:h-field (f=10) [pw]

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\e-field (f=10) [pw]
files=s:e-field (f=10)_pw.m3d
ylabel=s:e-field (f=10) [pw]

type=s:HFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\H-Field\h-field (f=5.5) [pw]
files=s:h-field (f=5.5)_pw.m3d
ylabel=s:h-field (f=5.5) [pw]

type=s:SURFACECURRENT
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Surface Current\surface current (f=5.5) [pw]
files=s:h-field (f=5.5)_pw.m3d
ylabel=s:h-field (f=5.5) [pw]

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\e-field (f=5.5) [pw]
files=s:e-field (f=5.5)_pw.m3d
ylabel=s:e-field (f=5.5) [pw]

type=s:HFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\H-Field\h-field (f=1) [pw]
files=s:h-field (f=1)_pw.m3d
ylabel=s:h-field (f=1) [pw]

type=s:SURFACECURRENT
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Surface Current\surface current (f=1) [pw]
files=s:h-field (f=1)_pw.m3d
ylabel=s:h-field (f=1) [pw]

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\e-field (f=1) [pw]
files=s:e-field (f=1)_pw.m3d
ylabel=s:e-field (f=1) [pw]

type=s:XYSIGNAL2
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Energy\Energy [pw]
files=s:pw.eng
xlabel=s:Time / ns
title=s:Field Energy / dB

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\Plane wave
files=s:plw.sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:XYSIGNAL2
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Energy\Energy [pw]
files=s:pw.eng
xlabel=s:Time / ns
title=s:Field Energy / dB

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL2
subtype=s:user
problemclass=s:Low Frequency:4:3
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default_lf.sig
xlabel=s:Time / ns
title=s:Excitation: default

type=s:XYSIGNAL2
subtype=s:user
problemclass=s:High Frequency:0:0
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default.sig
xlabel=s:Time / ns
title=s:Excitation: default

