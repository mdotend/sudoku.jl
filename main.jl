include("draw.jl")
include("calc.jl")
include("web.jl")

Feld = zeros(Int8, 9, 9)
Feld = testFill()
#draw(Feld)
#println("#####################")

changed = true
while Main.changed
    global changed = false
    global changed, changedFeld = solvUniqPos(Feld)
    if changed
        global Feld = changedFeld
    else
        global changed, changedFeld = solvBoxUniq(Feld)
        if changed
            global Feld = changedFeld
        else
            global changed, changedFeld = solvRowUniq(Feld)
            if changed
                global Feld = changedFeld
            else
                global changed, changedFeld = solvColUniq(Feld)
                if changed
                    global Feld = changedFeld
                else
                    draw(getPossib(Feld))
                end
            end
        end 
    end
end
#println("#####################")
if 0 in Feld
    println("Failed to solve the sudoku!\n")
else
    println("Solved the sudoku, way too easy...\n")
end
draw(Feld)