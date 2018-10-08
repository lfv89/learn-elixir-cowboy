defmodule CowboyHandler do
  def init(_type, req, _opts) do
    {:ok, req, :nostate}
  end

  def handle(request, state) do
    { :ok, reply } = :cowboy_req.reply(
      200, [{"content-type", "text/html"}], "<h1>Hello, World!</h1>", request
    )
    {:ok, reply, state}
  end

  def terminate(_reason, _request, _state), do: :ok
end

# inside iex -S mix
#
# dispatch_config = :cowboy_router.compile([
#   { :_,
#     [
#       {:_, CowboyHandler, []},
#     ]
#   }
# ])
#
# or, in other words...
# dispatch_config = :cowboy_router.compile([hostname, path_list])

# :cowboy.start_http(:http, 100,[{:port, 8080}],[{ :env, [{:dispatch, dispatch_config}]}])
