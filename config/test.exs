import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ipMajor, IpMajor.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ipmajor_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ipMajor, IpMajorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "JmH0z1J4368QM6t5Wfe8TD8gfXFNIvKdF7cbSy5Dp6VZpXz3f8CHxclrMsb0GGX3",
  server: false

# In test we don't send emails.
config :ipMajor, IpMajor.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
