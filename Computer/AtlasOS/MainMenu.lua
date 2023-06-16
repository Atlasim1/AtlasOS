term.setTextColor(colors.yellow)
term.clear()
term.setCursorPos(1,1)
print("AtlasOS 1.0 Logged in as ", _CURRENT_USER)
while true do
    print("Open Program (Type shell for shell)")
    shell.run("fg" .. io.read())