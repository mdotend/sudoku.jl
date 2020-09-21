using Genie, Genie.Router, Genie.Renderer.Json

route("/") do 
    json("Hello there, welcome to Genie")
end

up(8080, async = false)