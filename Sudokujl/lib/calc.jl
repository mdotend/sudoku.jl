function checkBox(pFeld::Array,pStart1::Int8,pEnd1::Int8, pStart2::Int8, pEnd2::Int8)
    contains = []
    for i=pStart1:pEnd1
        for j=pStart2:pEnd2
            if pFeld[i,j]!=0
                push!(contains, pFeld[i,j])
            end
        end
    end
    return(contains)
end

function checkRow(pFeld::Array,pRow::Int8)
    contains = []
    for i=1:9
        if pFeld[pRow, i] != 0
            push!(contains, pFeld[pRow,i])
        end
    end
    return(contains)
end

function checkColumn(pFeld::Array,pCol::Int8)
    contains = []
    for i=1:9
        if pFeld[i, pCol] != 0
            push!(contains, pFeld[i, pCol])
        end
    end
    return(contains)
end

function possible(pFeld::Array, pVal::Int8, pRow::Int8, pCol::Int8)
    possible = true
    start1, end1, start2, end2 = getRange(pRow, pCol)
    if pVal in checkColumn(pFeld,pCol) || pVal in checkRow(pFeld, pRow) || pVal in checkBox(pFeld, start1, end1, start2, end2)
        possible = false
    end
    return(possible)
end

function getRange(pRow::Int8, pCol::Int8)
    start1::Int8=0
    end1::Int8=0
    start2::Int8=0
    end2::Int8=0
    if pRow/3<=1
        start1 = 1
        end1 = 3
    elseif pRow/3<=2
        start1 = 4
        end1 = 6
    else 
        start1 = 7
        end1 = 9
    end

    if pCol/3<=1
        start2 = 1
        end2 = 3
    elseif pCol/3<=2
        start2 = 4
        end2 = 6
    else 
        start2 = 7
        end2 = 9
    end
    return(start1, end1, start2, end2)
end

function solvUniqPos(pFeld::Array)
    touched = false
    for i::Int8=1:size(pFeld, 1)
        for j::Int8=1:size(pFeld, 2)
            if pFeld[i,j]==0 
                a = []
                for newNum::Int8=1:9
                    if possible(pFeld,newNum,i,j)
                        push!(a,newNum)
                    end
                end
                if length(a) == 1
                    #println("Feld ", i, "/",j, ": ", a[1])
                    pFeld[i,j] = a[1]
                    touched = true
                end
            end
        end
    end
    return touched, pFeld
end

function solvBoxUniq(pFeld::Array)
    touched = false
    for i::Int8=1:3
        for j::Int8=1:3
            start1, end1, start2, end2 = getRange(Int8(i*3),Int8(j*3))
            for newNum::Int8=1:9
                a = []
                box_contains = checkBox(pFeld, start1, end1, start2, end2)
                if (newNum in box_contains) == false
                    for box_i::Int8=start1:end1
                        for box_j::Int8=start2:end2
                            if pFeld[box_i, box_j]==0
                                if possible(pFeld,newNum,box_i,box_j)
                                    push!(a,[box_i, box_j])
                                end
                            end
                        end     
                    end
                    if length(a) == 1
                        #println("Feld ", a[1][1], "/",a[1][2], ": ", newNum)
                        pFeld[a[1][1], a[1][2]] = newNum
                        touched = true
                    end
                end
            end
        end
    end
    return touched, pFeld
end

function solvRowUniq(pFeld::Array)
    touched = false
    for i::Int8=1:9
        for newNum::Int8=1:9
            a = []
            row_contains = checkRow(pFeld,i)
            if (newNum in row_contains) == false
                    for j::Int8=1:9
                        if pFeld[i, j]==0
                            if possible(pFeld,newNum,i,j)
                                push!(a,[i, j])
                            end
                        end
                    end     
                if length(a) == 1
                    println("Feld ", a[1][1], "/",a[1][2], ": ", newNum)
                    pFeld[a[1][1], a[1][2]] = newNum
                    touched = true
                end
            end
        end
    end
    return touched, pFeld
end

function solvColUniq(pFeld::Array)
    touched = false
    for i::Int8=1:9
        for newNum::Int8=1:9
            a = []
            row_contains = checkColumn(pFeld,i)
            if (newNum in row_contains) == false
                    for j::Int8=1:9
                        if pFeld[j, i]==0
                            if possible(pFeld,newNum,j,i)
                                push!(a,[j, i])
                            end
                        end
                    end     
                if length(a) == 1
                    println("Feld ", a[1][1], "/",a[1][2], ": ", newNum)
                    pFeld[a[1][1], a[1][2]] = newNum
                    touched = true
                end
            end
        end
    end
    return touched, pFeld
end

function getPossib(pFeld::Array)
    meta = Array{Any}(undef,9,9)
    for i::Int8=1:size(pFeld, 1)
        for j::Int8=1:size(pFeld, 2)
            a = []
            if pFeld[i,j]==0 
                for newNum::Int8=1:9
                    if possible(pFeld,newNum,i,j)
                        push!(a,newNum)
                    end
                end
            else
                push!(a,pFeld[i,j])
            end
            meta[i,j] = a

        end
    end
    return meta
end