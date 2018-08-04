#================ REQUIRED SETTINGS ==================
# The CGIPath is the URL to your Movable Type directory
CGIPath /mt/

# simply remove it or comment out the line by prepending a "#".
StaticWebPath /mt/mt-static


#================ DATABASE SETTINGS ==================
#   CHANGE setting below that refer to databases
#   you will be using.

##### MYSQL #####
ObjectDriver DBI::mysql
Database mt7-db
DBUser root
DBPassword root
DBHost mt7-db


#================ OPTION SETTINGS ==================
## Change setting to language that you want to using.
DefaultLanguage ja

## Debug Mode
DebugMode 1

## SSL Mode
SSLVerifyNone 1
