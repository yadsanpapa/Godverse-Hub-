-- Yadsan_Hub | Life Together RP Edition
-- Roblox Studio LocalScript
-- Place this file in StarterPlayer > StarterPlayerScripts.
-- Designed for your own Roblox experience; it is not an executor script.

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("Yadsan_Hub")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "Yadsan_Hub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(280, 330)
main.Position = UDim2.new(0.5, -140, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(13, 10, 22)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(160, 80, 255)
stroke.Thickness = 1.6
stroke.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 62)
header.BackgroundColor3 = Color3.fromRGB(30, 17, 49)
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -55, 0, 30)
title.Position = UDim2.fromOffset(14, 7)
title.BackgroundTransparency = 1
title.Text = "YADSAN_HUB"
title.TextColor3 = Color3.fromRGB(211, 174, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 19
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -55, 0, 17)
subtitle.Position = UDim2.fromOffset(15, 36)
subtitle.BackgroundTransparency = 1
subtitle.Text = "LIFE TOGETHER RP"
subtitle.TextColor3 = Color3.fromRGB(170, 145, 195)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -40, 0, 14)
close.BackgroundColor3 = Color3.fromRGB(80, 35, 110)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.Parent = header
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 25)
status.Position = UDim2.fromOffset(12, 72)
status.BackgroundTransparency = 1
status.Text = "Choose a roleplay message"
status.TextColor3 = Color3.fromRGB(190, 170, 210)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.Parent = main

local buttonArea = Instance.new("Frame")
buttonArea.Size = UDim2.new(1, -24, 1, -112)
buttonArea.Position = UDim2.fromOffset(12, 102)
buttonArea.BackgroundTransparency = 1
buttonArea.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = buttonArea

local messages = {
    {"👋  Say Hello", "Hello! How are you today?"},
    {"🏡  Invite Home", "Would you like to come over to my house?"},
    {"🚗  Go for a Drive", "Who wants to go for a drive?"},
    {"🛍️  Shopping", "Let's go shopping together!"},
    {"🍕  Food Time", "Anyone hungry? Let's get some food!"},
    {"💜  Make Friends", "Hi! Would you like to be friends?"},
}

local function sendMessage(message)
    local channels = TextChatService:FindFirstChild("TextChannels")
    local general = channels and channels:FindFirstChild("RBXGeneral")

    if general then
        local ok, err = pcall(function()
            general:SendAsync(message)
        end)
        if ok then
            status.Text = "Message sent!"
        else
            status.Text = "Chat unavailable or blocked."
            warn("Yadsan_Hub chat error:", err)
        end
    else
        status.Text = "Default chat channel not found."
    end
end

for index, item in ipairs(messages) do
    local button = Instance.new("TextButton")
    button.Name = "RPButton" .. index
    button.Size = UDim2.new(1, 0, 0, 32)
    button.BackgroundColor3 = Color3.fromRGB(39, 24, 57)
    button.BorderSizePixel = 0
    button.Text = item[1]
    button.TextColor3 = Color3.fromRGB(232, 220, 255)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.AutoButtonColor = true
    button.LayoutOrder = index
    button.Parent = buttonArea

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button

    button.Activated:Connect(function()
        sendMessage(item[2])
    end)
end

close.Activated:Connect(function()
    gui:Destroy()
end)

-- Small reopen button, shown after the main panel is closed.
-- The close button removes the panel; this toggle remains available.
local reopen = Instance.new("TextButton")
reopen.Name = "ReopenYadsanHub"
reopen.Size = UDim2.fromOffset(112, 34)
reopen.Position = UDim2.new(0, 16, 0.5, 0)
reopen.BackgroundColor3 = Color3.fromRGB(55, 25, 85)
reopen.Text = "YADSAN_HUB"
reopen.TextColor3 = Color3.fromRGB(225, 205, 255)
reopen.Font = Enum.Font.GothamBold
reopen.TextSize = 12
reopen.Visible = false
reopen.Parent = gui
Instance.new("UICorner", reopen).CornerRadius = UDim.new(0, 9)

close.Activated:Connect(function()
    main.Visible = false
    reopen.Visible = true
end)

reopen.Activated:Connect(function()
    main.Visible = true
    reopen.Visible = false
end)
