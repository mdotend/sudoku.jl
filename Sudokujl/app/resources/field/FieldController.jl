module FieldController
  using Genie.Renderer.Html
  include("Sudoku.jl")
  using .Sudoku
  
  function drawField()
    failed, table = Sudoku.solve()
    html(:field, :drawField, table = table)
  end

  function clearField()
    table = zeros(Int8, 9, 9)
    html(:field, :drawField, table = table)
  end

  function solve()
    failed, table = Sudoku.solve()
    html(:field, :drawField, table = table, failed = failed)
  end

  function next()
    html("coming soon")
  end
end
