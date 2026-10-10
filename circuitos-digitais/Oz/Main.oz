functor
import 
    Browser(browse:Browse)
    Circuits(
        halfAdder:      HalfAdder
        halfSubtractor: HalfSubtractor
        fullAdder:      FullAdder
        fullSubtractor: FullSubtractor
    ) at 'Circuits.ozf'
define
    Xs Ys Cin Bin
    
    HA_S HA_C
    HS_D HS_B
    FA_S FA_C
    FS_D FS_B

    Xs  = [0 1 0 1]
    Ys  = [0 0 1 1]
    Cin = [0 0 0 0]
    Bin = [0 0 0 0]

    HA_S#HA_C = {HalfAdder Xs Ys}
    HS_D#HS_B = {HalfSubtractor Xs Ys}
    FA_S#FA_C = {FullAdder Xs Ys Cin}
    FS_D#FS_B = {FullSubtractor Xs Ys Bin}

    {Browse Xs}
    {Browse Ys}
    {Browse Cin}

    {Browse HA_S}
    {Browse HA_C}

    {Browse HS_D}
    {Browse HS_B}

    {Browse FA_S}
    {Browse FA_C}

    {Browse FS_D}
    {Browse FS_B}
end