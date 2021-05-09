$Notes = New-Object -TypeName psobject -Property @{
    REST    = 0
    GbelowC = 196
    A       = 220
    Asharp  = 233
    B       = 247
    C       = 262
    Csharp  = 277
    D       = 294
    Dsharp  = 311
    E       = 330
    F       = 349
    Fsharp  = 370
    G       = 392
    Gsharp  = 415
    AA      = 440
    AAsharp = 466
    BB      = 493
    CC      = 523
    CCsharp = 554
    DD      = 587
    DDsharp = 622
    EE      = 659
    FF      = 698
    FFsharp = 740
    GG      = 784
    GGsharp = 830
    }
 
$Duration = New-Object -TypeName psobject -Property @{
    WHOLE     = 1600
    HALF      = 800
    QUARTER   = 400
    EIGHTH    = 200
    SIXTEENTH = 100
    }
 
[console]::Beep($Note.E4, $Duration.Quarter)
[console]::Beep($Note.F4, $Duration.Eighth)
[console]::Beep($Note.G4, $Duration.Quarter)
[console]::Beep($Note.C5, $Duration.Half)
[console]::Beep($Note.D4, $Duration.Quarter)
[console]::Beep($Note.E4, $Duration.Eighth)
[console]::Beep($Note.F4, $Duration.DottedHalf)
[console]::Beep($Note.G4, $Duration.Quarter)
[console]::Beep($Note.A4, $Duration.Eighth)
[console]::Beep($Note.B4, $Duration.Quarter)
[console]::Beep($Note.F5, $Duration.Half)
[console]::Beep($Note.A4, $Duration.Quarter)
[console]::Beep($Note.B4, $Duration.Eighth)
[console]::Beep($Note.C5, $Duration.Quarter)
[console]::Beep($Note.D5, $Duration.Quarter)
[console]::Beep($Note.E5, $Duration.Quarter)
[console]::Beep($Note.E4, $Duration.Quarter)
[console]::Beep($Note.F4, $Duration.Eighth)
[console]::Beep($Note.G4, $Duration.Quarter)
[console]::Beep($Note.C5, $Duration.Half)
[console]::Beep($Note.D5, $Duration.DottedHalf)
[console]::Beep($Note.E5, $Duration.Eighth)
[console]::Beep($Note.F5, $Duration.DottedHalf)
[console]::Beep($Note.G4, $Duration.Quarter)
[console]::Beep($Note.G4, $Duration.DottedEighth)
[console]::Beep($Note.E5, $Duration.Quarter)
[console]::Beep($Note.D5, $Duration.Quarter)
[console]::Beep($Note.G4, $Duration.Eighth)
[console]::Beep($Note.E5, $Duration.Quarter)
[console]::Beep($Note.D5, $Duration.Quarter)
[console]::Beep($Note.G4, $Duration.Eighth)
[console]::Beep($Note.E5, $Duration.Quarter)
[console]::Beep($Note.D5, $Duration.Quarter)
[console]::Beep($Note.G4, $Duration.Eighth)
[console]::Beep($Note.E5, $Duration.Quarter)
[console]::Beep($Note.D5, $Duration.Quarter)
[console]::Beep($Note.G4, $Duration.Eighth)
[console]::Beep($Note.F5, $Duration.Quarter)
[console]::Beep($Note.E5, $Duration.Eighth)
[console]::Beep($Note.D5, $Duration.Eighth)
[console]::Beep($Note.C5, $Duration.Whole) 
