os.pullEvent = os.pullEventRaw -- Stop Terminate

-- Init Text
term.setTextColor(colors.yellow)
term.clear()
term.setCursorPos(1,1)
print("Login to AtlasOS")
term.setTextColor(colors.white)

-- Init Vars
local nologin = true

-- 
shell.setAlias("logout", "/.loginsystem/logout.lua")


-- Check if user is logged in
if fs.exists(".loginsystem/currentuser") then
    local curuser = fs.open(".loginsystem/currentuser", "r")
    print("Logged in as", curuser.read())
    curuser.close()
    sleep(2)
    shell.openTab("shell")
    nologin = false
end

-- Check for login file on disk
if fs.exists("disk/.loginkey") then
    loginkey = fs.open("disk/.loginkey", "r")
    if string.find(loginkey.read(), fs.open(".loginsystem/validkeys", "r").read()) ~= nil then -- If has valid Key
        if fs.exists("disk/autorun.lua") then -- If disk Has Autorun
            shell.openTab("shell")
            shell.run("disk/autorun.lua")
            
        else -- If disk does not have Autorun
            print("Logged in using Disk")
            shell.openTab("shell")
            nologin = false
        end
    end
end

-- Main Login Loop
while nologin do
    print("Username > ")
    local username = io.read()
    if string.find(username, fs.open(".loginsystem/userlist", "r").read()) ~= nil then
        print("Password > ")
        local password = io.read()
        if string.find(username .. " - " .. password, fs.open(".loginsystem/passlist", "r").read()) ~= nil then
            print("Welcome", username)
            sleep(2)
            shell.openTab("shell")
            local curuserfile = fs.open(".loginsystem/currentuser", "w")
            curuserfile.write(username)
            curuserfile.close()
            nologin = false
            
        else
            print("Incorrect Password")
        end
    else
        print("Incorrect Username")
    end    
end
local curuserfile = fs.open(".loginsystem/currentuser", "w")
_CURRENT_USER = curuserfile.read()
curuserfile.close()

shell.run("./AtlasOS/MainMenu.lua")