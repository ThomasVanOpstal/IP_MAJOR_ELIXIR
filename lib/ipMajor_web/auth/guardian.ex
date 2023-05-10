defmodule IpMajorWeb.Auth.Guardian do
  use Guardian, otp_app: :ipMajor
  alias IpMajor.Contexts.{Profiles, UserContext}

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => id}) do
    case UserContext.get_user(id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :no_id_provided}
  end

  def authenticate(username, password) do
    case UserContext.get_user_by_username(username) do
      nil -> {:error, :unauthored}
      user ->
        case validate_password(password, user.password) do
          true ->  {:ok}#create_token(user)
          false -> {:error, :unauthorized}
        end
    end
  end
  defp validate_password(password, hash_password) do
    Bcrypt.verify_pass(password, hash_password)
  end

  # defp create_token(account) do
  #   {:ok, token, _claims} = encode_and_sign(user)
  #   {:ok, account, token}
  # end

end
