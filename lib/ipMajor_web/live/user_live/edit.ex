defmodule IpMajorWeb.UserLive.Edit do
  use IpMajorWeb, :live_view
  alias IpMajor.Contexts.{ProfileContext, UserContext}
  alias IpMajor.{Profile, User}

  def mount(%{"id" => id}, _session, socket) do
    if(connected?(socket)) do
      UserContext.subscribe
    end
    user = IpMajor.Contexts.UserContext.get_user!(id)
    {:ok, assign(socket, :user, user)}
  end
end
