functor
export 
    HalfAdder
    HalfSubtractor
    FullAdder
    FullSubtractor
import
    Gates(
        notGate: NotGate
        andGate: AndGate
        orGate:  OrGate
        xorGate: XorGate
        nandGate: NandGate
    ) at 'Gates.ozf'
define 

    % half adder
    fun {HalfAdder Xs Ys}
        S = {XorGate Xs Ys}
        C = {AndGate Xs Ys}
    in 
        S#C
    end

    % half subtractor
    fun {HalfSubtractor Xs Ys}
        D = {XorGate Xs Ys}
        NotXs = {NotGate Xs}
        B = {AndGate NotXs Ys}
    in 
        D#B
    end

    % full adder
    fun {FullAdder Xs Ys Cin}
        S1C1 = {HalfAdder Xs Ys}
        S1   = S1C1.1
        C1   = S1C1.2

        SC2 = {HalfAdder S1 Cin}
        S    = SC2.1
        C2   = SC2.2

        Cout = {OrGate C1 C2}
    in
        S#Cout
    end

    % full subtractor
    fun {FullSubtractor Xs Ys Bin}
        D1 = {XorGate Xs Ys}
        Inter1 = {NotGate Xs}
        B1 = {AndGate Inter1 Ys}

        D = {XorGate D1 Bin}
        Inter2 = {NotGate D1}
        B2 = {AndGate Inter2 Bin}

        Bout = {OrGate B1 B2}
    in
        D#Bout
    end

end