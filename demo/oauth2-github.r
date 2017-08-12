library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
# my app is jtLeekR.  used homepage above and callbac url above
#
#    Replace your key and secret below.
myapp <- oauth_app("jtLeekR",
  key = "8c3edd35e0257d3dd744",
  secret = "45fa2953a3f42d83e94a40f6ef87801695877636")
# key replaced and secret replaced 
#
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
## req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
## stop_for_status(req)
## content(req)
