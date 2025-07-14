--use :so to run
local y = "async fn main() {"
local function_name = y:match("fn%s+([%w_]+)%s*%(")
print(function_name)
