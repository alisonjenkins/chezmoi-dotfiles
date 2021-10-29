local hasnavigator, navigator = pcall(require, "navigator")

if not hasnavigator or navigator == true then
    return
end

navigator.setup()
