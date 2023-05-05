defmodule IpMajorWeb.LoginLive.Index do
    use IpMajorWeb, :live_view
    alias IpMajor.Contexts.{Profiles, UserContext}
    alias IpMajor.{Profile, User}
    alias IpMajor.Repo
  
    @impl true
    def mount(_param, _session, socket) do
      {:ok, socket}
    end  

    defp list_profiles do
      Profiles.list_profiles()
    end
    
  end
  