using Genie.Router
using FieldController

route("/hello") do
  serve_static_file("welcome.html")
end

route("/",  FieldController.drawField)
route("/clear", FieldController.clearField)
route("/solve", FieldController.solve)
route("/next", FieldController.next)