defmodule ExOpcua.ParameterTypes.AnonymousIdentityToken do
  @moduledoc """
  	Defines the structure template and decodings/encodings for
  	the AnonymousIdentityToken ParameterType
    https://reference.opcfoundation.org/Core/Part4/v105/docs/7.40.3
  """
  alias ExOpcua.DataTypes.BuiltInDataTypes.OpcString
  alias ExOpcua.DataTypes.NodeId

  defstruct [:policy_id]

  @type t :: %__MODULE__{policy_id: String.t()}

  def serialize(%{policy_id: policy_id}) do
    <<
    	NodeId.serialize(%{encoding_mask: 1, namespace_idx: 0, identifier: 321})::binary,
    	1, #binary body,
    	OpcString.serialize(OpcString.serialize(policy_id))::binary ##Extension parameter needs size of the size...
    >>
  end
end