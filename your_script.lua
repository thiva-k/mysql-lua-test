local luasql = require("luasql.mysql")
os.execute("sleep 5")

-- Create MySQL connection
local env = assert(luasql.mysql())
local con = assert(env:connect("your_database", "your_user", "your_password", "mysql", 3306))

-- Query example (replace with your actual query)
local query = "SELECT VERSION() AS version"
local cur = assert(con:execute(query))

-- Fetch the results
local row = cur:fetch({}, "a")
if row then
    -- Print the result
    print("MySQL version:", row.version)
else
    print("No results found for query:", query)
end

-- Close the resources
cur:close()
con:close()
env:close()
