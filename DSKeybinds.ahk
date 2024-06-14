#Requires AutoHotkey v2.0
#SingleInstance force

CoordMode "Mouse", "Window"

^+T::Run "netsh wlan connect ATT480"
^+R::Run "netsh wlan connect 1523_apollo"

!+d::ActivateOrOpen("ahk_exe DriverStation.exe", "C:\Program Files (x86)\FRC Driver Station\DriverStation.exe")

#HotIf WinActive("ahk_exe DriverStation.exe")
; Enable
!A:: 
{
    ClickOperation()
    Sleep 150
    ClickEnable()
}

Q::
{
    GotoTele()
}
W::
{
    GotoAuto()
}

!Q::
{
    GotoTele()
    Sleep 50
    ClickEnable()
}
!W::
{
    GotoAuto()
    Sleep 50
    ClickEnable()
}

1::ClickOperation()
2::ClickDiagnostics()
3::ClickSetup()
4::ClickUSB()
5::ClickPower()

^R::GotoRescan()

GotoRescan() {
    ClickUSB()
    Sleep 50
    Click 137, 277 ; Rescan
}

GotoTele()
{
    ClickOperation()
    Sleep 50
    ClickTele()
}
GotoAuto()
{
    ClickOperation()
    Sleep 50
    ClickAuto()
}

ClickTele() {
    Click 150, 50
}

ClickAuto() {
    Click 150, 75
}

ClickEnable() {
    Click 147, 225
}

ClickOperation() {
    Click 25, 50
}

ClickDiagnostics() {
    Click 25, 100
}

ClickSetup() {
    Click 25, 150
}

ClickUSB() {
    Click 25, 200
}

ClickPower() {
    Click 25, 250
}

ActivateOrOpen(Query, Path) {
    if WinExist(Query) {
        WinActivate ; Use the window found by WinExist.
    } else {
        Run Path
    }
}
