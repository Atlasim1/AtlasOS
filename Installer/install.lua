-- yes i know this is fucking janky

print("Installing AtlasOS")
shell.run("mkdir .loginsystem")
shell.run("cd .loginsystem")
shell.run("wget https://raw.githubusercontent.com/Atlasim1/AtlasOS/main/Computer/.loginsystem/login.lua login.lua")
shell.run("wget https://raw.githubusercontent.com/Atlasim1/AtlasOS/main/Computer/.loginsystem/logout.lua logout.lua")
shell.run("cd ..")
shell.run("wget https://raw.githubusercontent.com/Atlasim1/AtlasOS/main/Computer/startup.lua startup.lua")
shell.run("mkdir AtlasOS")
shell.run("cd AtlasOS")
shell.run("wget https://raw.githubusercontent.com/Atlasim1/AtlasOS/main/Computer/AtlasOS/MainMenu.lua MainMenu.lua")
shell.run("cd ..")

-- dont worry, the jank gets worse
local userlist = fs.open(".loginsystem/userlist", "w")
userlist.write("user")
userlist.close()

local passfile = fs.open(".loginsystem/passlist", "w")
passfile.write("user - password")
passfile.close()

local diskkeyfile = fs.open(".loginsystem/validkeys", "w")
diskkeyfile.write("diskkey")
diskkeyfile.close()

