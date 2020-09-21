module FieldController
  using Genie.Renderer.Html
  using Sudoku 
  
  function drawField()
    html(:field, :drawField, field = Sudoku.solve())
  end
end
