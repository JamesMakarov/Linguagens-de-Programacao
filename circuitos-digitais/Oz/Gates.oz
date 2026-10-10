functor
export
    NotGate
    AndGate
    NandGate
    OrGate
    XorGate
define
    % NOT gate
    local
        fun {NotLoop Xs}
            case Xs of X|Xr then (1-X)|{NotLoop Xr} [] nil then nil end
        end
    in
        fun {NotGate Xs} thread {NotLoop Xs} end end
    end

    % AND gate
    local
        fun {AndLoop Xs Ys}
            case Xs#Ys of (X|Xr)#(Y|Yr) then (X*Y)|{AndLoop Xr Yr} [] nil#nil then nil end
        end
    in
        fun {AndGate Xs Ys} thread {AndLoop Xs Ys} end end
    end

    % OR gate
    local
        fun {OrLoop Xs Ys}
            case Xs#Ys of (X|Xr)#(Y|Yr) then (X+Y-X*Y)|{OrLoop Xr Yr} [] nil#nil then nil end
        end
    in
        fun {OrGate Xs Ys} thread {OrLoop Xs Ys} end end
    end

    % XOR gate
    local
        fun {XorLoop Xs Ys}
            case Xs#Ys of (X|Xr)#(Y|Yr) then (X*(1-Y)+Y*(1-X)) | {XorLoop Xr Yr} [] nil#nil then nil end
        end
    in
        fun {XorGate Xs Ys} thread {XorLoop Xs Ys} end end
    end

    % NAND gate
    local
        fun {NandLoop Xs Ys}
            case Xs#Ys of (X|Xr)#(Y|Yr) then (1-X*Y)|{NandLoop Xr Yr} [] nil#nil then nil end
        end
    in
        fun {NandGate Xs Ys} thread {NandLoop Xs Ys} end end
    end
end