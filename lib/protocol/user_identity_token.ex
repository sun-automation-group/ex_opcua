defmodule ExOpcua.Protocol.UserIdentityToken do
	alias ExOpcua.ParameterTypes.AnonymousIdentityToken
  @moduledoc """
  	Defines the mechanisms for generating user identity tokens. 
  	Details on these tokens can be found in their respective ParameterTypes or in the docs
  	https://reference.opcfoundation.org/Core/Part4/v105/docs/7.40
  """

  def new(token, params \\ [])
  def new(%{policy_id: policy_id, user_token_type: :anonymous,}, _) do
  	%AnonymousIdentityToken{policy_id: policy_id}
  end

  def serialize(%AnonymousIdentityToken{} = t), do: AnonymousIdentityToken.serialize(t)
end