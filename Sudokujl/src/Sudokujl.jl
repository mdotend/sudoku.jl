module Sudokujl

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = Sudokujl))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = Sudokujl.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
