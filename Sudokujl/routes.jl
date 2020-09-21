using Genie.Router
using FieldController

route("/") do
  serve_static_file("welcome.html")
end

route("/solve",  FieldController.drawField)