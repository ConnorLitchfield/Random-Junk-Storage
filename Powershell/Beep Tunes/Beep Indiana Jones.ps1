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
