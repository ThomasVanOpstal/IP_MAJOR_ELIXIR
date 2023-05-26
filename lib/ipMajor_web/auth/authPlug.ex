defmodule IpMajorWeb.Auth.AuthPlug do
  import Plug.Conn
  alias IpMajor.Server
  @behaviour Plug

  def init(_opts), do: []

  def call(conn, _opts)do
    case Server.lookup(:user, :token) do
      {:ok, token} ->
        conn |> assign(:token , token)
      _ ->
        conn
  end
end
end

  #def call(conn, _opts) do
   # case :ets.info(:user) do
    #  :undefined ->
     #   :ets.new(:user, [:named_table, :public, :set, :protected])
      #_ ->
      #  case :ets.lookup(:user, :token) do
      #    [{_, token}] ->
       #     conn |> assign(:token, token)
       #   _ ->
        #    conn
         # end
    #end
  #end
#end
