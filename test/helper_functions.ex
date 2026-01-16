defmodule ExOpcua.Test.HelperFunctions do
  def test_security() do
    client_private_key = File.read!("/Users/KalebB/exopcua_certs_key.der")
    client_pub_cert = File.read!("/Users/KalebB/exopcua_certs.der")

    server_public_key =
      File.read!(
        "/Users/KalebB/.prosysopc/prosys-opc-ua-simulation-server/PKI/CA/private/SimulationServer@SA-C4HT60D4DK_2048.der"
      )

    ExOpcua.SecurityProfile.new(
      :sign_encrypt,
      :basic256_Sha256,
      server_public_key,
      client_private_key,
      client_pub_cert
    )
  end
end
