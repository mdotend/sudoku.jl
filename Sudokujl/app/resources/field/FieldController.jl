module FieldController
  using Genie.Renderer.Html
  using Sudoku 
  
  function drawField()
    failed, field = Sudoku.solve()
    html(:field, :drawField, field = field, failed = failed)
  end
end
