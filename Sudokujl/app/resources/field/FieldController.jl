module FieldController
  using Genie.Renderer.Html
  include("Sudoku.jl")
  using .Sudoku
  
  function drawField()
    failed, table = Sudoku.solve()
    html(:field, :drawField, table = table, failed = failed)
  end
end
