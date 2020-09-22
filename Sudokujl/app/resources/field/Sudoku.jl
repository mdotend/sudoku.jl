module Sudoku

include("draw.jl")
include("calc.jl")

Feld = zeros(Int8, 9, 9)
Feld = testFill()
#draw(Feld)
#println("#####################")

function solve()
    changed = true
    while changed
        changed = false
        changed, changedFeld = solvUniqPos(Feld)
        if changed
            global Feld = changedFeld
        else
            changed, changedFeld = solvBoxUniq(Feld)
            if changed
                global Feld = changedFeld
            else
                changed, changedFeld = solvRowUniq(Feld)
                if changed
                    global Feld = changedFeld
                else
                    changed, changedFeld = solvColUniq(Feld)
                    if changed
                        global Feld = changedFeld
                    else
                        #draw(getPossib(Feld))
                    end
                end
            end 
        end
    end
    #println("#####################")
    if 0 in Feld
        #println("Failed to solve the sudoku!\n")
        failed = true
    else
        failed = false
        #println("Solved the sudoku, way too easy...\n")
    end
    #draw(Feld)
    draw(Feld)
    return failed, Feld
end


end