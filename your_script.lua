
local pgmoon = require("pgmoon")
local pg = pgmoon.new({
    host = "postgres",
    port = "5432",
    database = "mydb",
    user = "postgres",
    password = "root"
  })

  local ok, err = pg:connect()


print("Successfully connected to PostgreSQL")

  local res, err = pg:query("SELECT 1")
  if res then
    print("Successfully executed test query.")
  else
    print("Failed to execute test query: " .. err)
  end

