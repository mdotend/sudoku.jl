function draw(A)
    for i=1:size(A, 1)
        for j=1:size(A, 2)
            print(A[i,j], " ")
            if j%3==0 && j != 9
                print("|")
            end
        end
        print("\n")
        if i%3==0 && i != 9
            println("-------------------")
        end
    end
end

function testFill()
    #A = Int8[[0,0,2,0,0,4,0,0,0] [0,8,0,0,1,0,0,0,2]    [0,4,6,3,2,7,1,0,0] [4,6,3,2,0,0,0,0,0] [0,2,0,0,6,0,0,9,0,] [0,7,0,0,0,5,6,2,3] [0,0,8,1,3,2,5,6,0]    [2,0,0,0,7,0,0,3,0]   [0,0,0,9,0,0,2,0,0]]
    A = Int8[[0,0,8,0,0,1,0,0,0] [0,0,0,3,0,0,4,0,6]    [0,0,0,0,2,0,0,3,0] [5,0,3,0,0,7,0,0,0] [0,0,0,9,0,0,0,6,8] [8,2,0,0,6,0,7,0,0] [0,0,2,0,0,4,0,7,0]    [0,0,0,0,0,0,0,0,1]   [9,0,0,5,8,0,0,0,0]]
    return (A)
end