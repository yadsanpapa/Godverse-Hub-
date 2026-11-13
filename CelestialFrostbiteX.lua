-- Static deobfuscation of the code provided in the conversation.
-- Formatting damage in the pasted identifiers/links was repaired.
-- Behavior and apparent runtime bugs are intentionally preserved.
-- Roblox-specific; review it before running.
-- It posts a chat banner and attempts to set a fixed bio.
-- Net is a game-provided module whose internals were not supplied.
-- Apparent bugs (the CellPadding type and undefined notify) are preserved.

print("[Frostbite X] Loading FULL Re-Sizer...")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer
local codeFont = Enum.Font.Code
local boldFont = Enum.Font.GothamBold
local forcedBio = "Celestial Syndicate On Top 🔱 Vicious Is My Son"
local function getPlayerLabel()
    local displayName = player.DisplayName
    local username = player.Name
    if displayName and displayName ~= "" and displayName ~= username then
        return string.upper(displayName) .. " (@" .. username .. ")"
    end
    return string.upper(username)
end
local function broadcastBannerLine(message)
    pcall(function()
        if TextChatService then
            TextChatService:DisplaySystemMessage(message)
        end
    end)
    pcall(function()
        StarterGui:SetCore(
            "ChatMakeSystemMessage",
            { Text = message, Color = Color3.fromRGB(100, 180, 255), Font = Enum.Font.Code }
        )
    end)
    pcall(function()
        local legacyChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if legacyChatEvents then
            local sendChatMessageRemote = legacyChatEvents:FindFirstChild("SayMessageRequest")
            if sendChatMessageRemote then
                sendChatMessageRemote:FireServer(message, "All")
            end
        end
    end)
end
local function announceExecution()
    local playerLabel = getPlayerLabel()
    local bannerLines = {
        "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬",
        "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★",
        "       ✦ FE Frostbite X ✦",
        "        SIZE  RE-SIZER",
        "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★",
        "(!)(!)(*)(*)  EXECUTED BY  (!)(!)(*)(*)",
        "         ⟫ " .. playerLabel .. " ⟪",
        "(!)(!)(*)(*)  LOADED ✓  (!)(!)(*)(*)",
        "▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬",
    }
    task.spawn(function()
        for bannerIndex, bannerLine in ipairs(bannerLines) do
            broadcastBannerLine(bannerLine)
            task.wait(0.35)
        end
    end)
end
announceExecution()
pcall(function()
    StarterGui:SetCore(
        "SendNotification",
        { Title = "Celestial Frostbite X Re-Size", Text = "Loaded by " .. getPlayerLabel(), Duration = 5 }
    )
end)
local cachedNet
local function getNet()
    if cachedNet then
        return cachedNet
    end
    local requireSucceeded, loadedNet = pcall(function()
        local modulesFolder = ReplicatedStorage:WaitForChild("Modules", 5)
        if not modulesFolder then
            return
        end
        local coreFolder = modulesFolder:WaitForChild("Core", 5)
        if not coreFolder then
            return
        end
        local netModule = coreFolder:WaitForChild("Net", 5)
        if not netModule then
            return
        end
        return require(netModule)
    end)
    if requireSucceeded and loadedNet then
        cachedNet = loadedNet
    end
    return cachedNet
end
local bioStatusListeners = {}
local function setBioStatus(status)
    for statusListenerIndex, statusListener in ipairs(bioStatusListeners) do
        pcall(statusListener, status)
    end
end
local function setBio(maxAttempts)
    maxAttempts = maxAttempts or 5
    local net = getNet()
    if not net or not net.send then
        return
    end
    for attempt = 1, maxAttempts do
        local elapsed = 0
        while (not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")) and elapsed < 10 do
            task.wait(0.5)
            elapsed = elapsed + 0.5
        end
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Individual calls are protected, but their success is not checked.
            setBioStatus("setting")
            pcall(function()
                net.send("_I7", forcedBio)
            end)
            task.wait(0.15)
            for bioEventIndex, bioEventName in ipairs({
                "roleplay_bio",
                "set_bio",
                "bio",
                "setBio",
                "set_about",
                "about",
            }) do
                pcall(function()
                    net.send(bioEventName, forcedBio)
                end)
                task.wait(0.08)
            end
            task.wait(0.8)
            setBioStatus("set")
            print("[Frostbite X] Bio sent ✓ (attempt " .. attempt .. ")")
            return true, attempt
        end
    end
    setBioStatus("fail")
    return false
end
local function averageBodyColor(characterForColor)
    local bodyColors = characterForColor and characterForColor:FindFirstChildOfClass("BodyColors")
    if not bodyColors then
        return nil
    end
    local partColors = {
        bodyColors.HeadColor3,
        bodyColors.LeftArmColor3,
        bodyColors.RightArmColor3,
        bodyColors.TorsoColor3,
        bodyColors.LeftLegColor3,
        bodyColors.RightLegColor3,
    }
    local redSum, greenSum, blueSum = 0, 0, 0
    for colorIndex, color in ipairs(partColors) do
        redSum, greenSum, blueSum = redSum + color.R, greenSum + color.G, blueSum + color.B
    end
    return Color3.new(redSum / 6, greenSum / 6, blueSum / 6)
end
local function serializeDescription(description)
    local outfitData = {
        accessories = {},
        properties = {
            Head = description.Head or 0,
            Torso = description.Torso or 0,
            LeftArm = description.LeftArm or 0,
            RightArm = description.RightArm or 0,
            LeftLeg = description.LeftLeg or 0,
            RightLeg = description.RightLeg or 0,
            Face = description.Face or 0,
            Shirt = description.Shirt or 0,
            Pants = description.Pants or 0,
            GraphicTShirt = description.GraphicTShirt or 0,
            RunAnimation = description.RunAnimation or 0,
            WalkAnimation = description.WalkAnimation or 0,
            JumpAnimation = description.JumpAnimation or 0,
            FallAnimation = description.FallAnimation or 0,
            ClimbAnimation = description.ClimbAnimation or 0,
            IdleAnimation = description.IdleAnimation or 0,
            SwimAnimation = description.SwimAnimation or 0,
            HeightScale = description.HeightScale or 1,
            WidthScale = description.WidthScale or 1,
            DepthScale = description.DepthScale or 1,
            HeadScale = description.HeadScale or 1,
            BodyTypeScale = description.BodyTypeScale or 0,
            ProportionScale = description.ProportionScale or 0,
        },
    }
    pcall(function()
        for accessoryIndex, accessory in ipairs(description:GetAccessories(true)) do
            table.insert(outfitData.accessories, {
                Rotation = "0 0 0",
                Position = "0 0 0",
                Scale = "1 1 1",
                IsLayered = accessory.IsLayered,
                AccessoryType = accessory.AccessoryType.Name,
                AssetId = accessory.AssetId,
                Order = accessory.Order or 0,
                Puffiness = accessory.Puffiness or 0,
            })
        end
    end)
    return outfitData
end
local function applyResize(height, width, headScale)
    headScale = headScale or height
    local resizeNet = getNet()
    if not resizeNet then
        return false, "Net missing"
    end
    local resizeCharacter = player.Character
    if not resizeCharacter then
        return false, "No char"
    end
    local humanoid = resizeCharacter:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return false, "No humanoid"
    end
    local originalSkinTone = averageBodyColor(resizeCharacter)
    local descriptionOk, appliedDescription = pcall(function()
        return humanoid:GetAppliedDescription()
    end)
    if not descriptionOk or not appliedDescription then
        return false, "Desc fail"
    end
    local resizeOutfit = serializeDescription(appliedDescription)
    resizeOutfit.properties.HeightScale = height
    resizeOutfit.properties.WidthScale = width
    resizeOutfit.properties.DepthScale = width
    resizeOutfit.properties.HeadScale = headScale
    local sendOk = pcall(function()
        resizeNet.send("wear_outfit_from_desc", resizeOutfit)
    end)
    if not sendOk then
        return false, "Send fail"
    end
    task.wait(0.25)
    if originalSkinTone then
        pcall(function()
            resizeNet.send("skin_tone", originalSkinTone)
        end)
    end
    return true, string.format("H=%.1f W=%.1f Head=%.1f", height, width, headScale)
end
local function autoWidthForHeight(requestedHeightForWidth)
    if requestedHeightForWidth <= 1 then
        return 1
    end
    return math.max(1, math.floor(1 + (requestedHeightForWidth - 1) * 1.34 + 0.5))
end
local function autoHeadForHeight(requestedHeightForHead)
    if requestedHeightForHead <= 1 then
        return 1
    end
    return math.max(1, math.floor(requestedHeightForHead + 0.5))
end
local function createGui()
    local playerGui = player:WaitForChild("PlayerGui")
    local existingGui = playerGui:FindFirstChild("FrostbiteXResizer")
    if existingGui then
        existingGui:Destroy()
    end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FrostbiteXResizer"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 460, 0, 720)
    mainFrame.Position = UDim2.new(0.5, -230, 0.5, -360)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 16)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)
    local mainBorder = Instance.new("UIStroke", mainFrame)
    mainBorder.Color = Color3.fromRGB(0, 255, 130)
    mainBorder.Thickness = 1
    mainBorder.Transparency = 0.3
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 44)
    titleBar.BackgroundColor3 = Color3.fromRGB(16, 20, 26)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 8)
    local titleBarBottom = Instance.new("Frame")
    titleBarBottom.Size = UDim2.new(1, 0, 0, 20)
    titleBarBottom.Position = UDim2.new(0, 0, 1, -20)
    titleBarBottom.BackgroundColor3 = Color3.fromRGB(16, 20, 26)
    titleBarBottom.BorderSizePixel = 0
    titleBarBottom.Parent = titleBar
    local titleUnderline = Instance.new("Frame")
    titleUnderline.Size = UDim2.new(1, 0, 0, 1)
    titleUnderline.Position = UDim2.new(0, 0, 1, -1)
    titleUnderline.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
    titleUnderline.BorderSizePixel = 0
    titleUnderline.Parent = titleBar
    local titleIndicator = Instance.new("Frame")
    titleIndicator.Size = UDim2.new(0, 8, 0, 8)
    titleIndicator.Position = UDim2.new(0, 14, 0.5, -4)
    titleIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
    titleIndicator.BorderSizePixel = 0
    titleIndicator.Parent = titleBar
    Instance.new("UICorner", titleIndicator).CornerRadius = UDim.new(1, 0)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 1, 0)
    titleLabel.Position = UDim2.new(0, 30, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "⚠️ Celestial Frostbite X Re-Size"
    titleLabel.TextColor3 = Color3.fromRGB(220, 240, 230)
    titleLabel.Font = boldFont
    titleLabel.TextSize = 13
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -37, 0, 7)
    closeButton.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(255, 120, 120)
    closeButton.Font = boldFont
    closeButton.TextSize = 20
    closeButton.Parent = titleBar
    Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 4)
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    local bioBanner = Instance.new("Frame")
    bioBanner.Size = UDim2.new(1, -20, 0, 26)
    bioBanner.Position = UDim2.new(0, 10, 0, 48)
    bioBanner.BackgroundColor3 = Color3.fromRGB(40, 30, 10)
    bioBanner.BorderSizePixel = 0
    bioBanner.Parent = mainFrame
    Instance.new("UICorner", bioBanner).CornerRadius = UDim.new(0, 4)
    local bioBannerBorder = Instance.new("UIStroke", bioBanner)
    bioBannerBorder.Color = Color3.fromRGB(255, 200, 100)
    bioBannerBorder.Thickness = 1
    bioBannerBorder.Transparency = 0.4
    local bioLabel = Instance.new("TextLabel")
    bioLabel.Size = UDim2.new(1, -20, 1, 0)
    bioLabel.Position = UDim2.new(0, 10, 0, 0)
    bioLabel.BackgroundTransparency = 1
    bioLabel.Text = "⏳ Bio: initializing..."
    bioLabel.TextColor3 = Color3.fromRGB(255, 220, 100)
    bioLabel.Font = codeFont
    bioLabel.TextSize = 10
    bioLabel.TextXAlignment = Enum.TextXAlignment.Left
    bioLabel.Parent = bioBanner
    local function onBioStatusChanged(newBioStatus)
        if newBioStatus == "set" then
            bioLabel.Text = "🔒 Bio: " .. forcedBio .. " (✓)"
            bioLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
            bioBannerBorder.Color = Color3.fromRGB(0, 255, 130)
            bioBanner.BackgroundColor3 = Color3.fromRGB(14, 30, 22)
        elseif newBioStatus == "setting" then
            bioLabel.Text = "⏳ Setting bio..."
            bioLabel.TextColor3 = Color3.fromRGB(255, 220, 100)
        else
            bioLabel.Text = "⚠ Bio pending..."
            bioLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
        end
    end
    table.insert(bioStatusListeners, onBioStatusChanged)
    local footer = Instance.new("Frame")
    footer.Size = UDim2.new(1, -20, 0, 22)
    footer.Position = UDim2.new(0, 10, 1, -28)
    footer.BackgroundColor3 = Color3.fromRGB(14, 18, 24)
    footer.BorderSizePixel = 0
    footer.Parent = mainFrame
    Instance.new("UICorner", footer).CornerRadius = UDim.new(0, 4)
    local footerIndicator = Instance.new("Frame")
    footerIndicator.Size = UDim2.new(0, 6, 0, 6)
    footerIndicator.Position = UDim2.new(0, 8, 0.5, -3)
    footerIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
    footerIndicator.BorderSizePixel = 0
    footerIndicator.Parent = footer
    Instance.new("UICorner", footerIndicator).CornerRadius = UDim.new(1, 0)
    local footerLabel = Instance.new("TextLabel")
    footerLabel.Size = UDim2.new(1, -30, 1, 0)
    footerLabel.Position = UDim2.new(0, 22, 0, 0)
    footerLabel.BackgroundTransparency = 1
    footerLabel.Text = "ready · drag title bar"
    footerLabel.TextColor3 = Color3.fromRGB(120, 150, 140)
    footerLabel.Font = codeFont
    footerLabel.TextSize = 10
    footerLabel.TextXAlignment = Enum.TextXAlignment.Left
    footerLabel.Parent = footer
    local function setFooter(footerText, footerColor)
        footerLabel.Text = footerText
        footerLabel.TextColor3 = footerColor or Color3.fromRGB(120, 150, 140)
    end
    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, -20, 1, -110)
    contentFrame.Position = UDim2.new(0, 10, 0, 80)
    contentFrame.BackgroundTransparency = 1
    contentFrame.BorderSizePixel = 0
    contentFrame.ScrollBarThickness = 4
    contentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 110)
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 3000)
    contentFrame.Parent = mainFrame
    local contentLayout = Instance.new("UIListLayout", contentFrame)
    contentLayout.Padding = UDim.new(0, 8)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local function createSection(sectionTitle, sectionOrder)
        local sectionFrame = Instance.new("Frame")
        sectionFrame.Size = UDim2.new(1, 0, 0, 22)
        sectionFrame.BackgroundColor3 = Color3.fromRGB(14, 18, 24)
        sectionFrame.BorderSizePixel = 0
        sectionFrame.LayoutOrder = sectionOrder
        sectionFrame.Parent = contentFrame
        Instance.new("UICorner", sectionFrame).CornerRadius = UDim.new(0, 3)
        local sectionAccent = Instance.new("Frame")
        sectionAccent.Size = UDim2.new(0, 3, 1, -8)
        sectionAccent.Position = UDim2.new(0, 8, 0, 4)
        sectionAccent.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
        sectionAccent.BorderSizePixel = 0
        sectionAccent.Parent = sectionFrame
        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Size = UDim2.new(1, -25, 1, 0)
        sectionLabel.Position = UDim2.new(0, 20, 0, 0)
        sectionLabel.BackgroundTransparency = 1
        sectionLabel.Text = sectionTitle
        sectionLabel.TextColor3 = Color3.fromRGB(180, 220, 200)
        sectionLabel.Font = codeFont
        sectionLabel.TextSize = 11
        sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
        sectionLabel.Parent = sectionFrame
    end
    local function createSlider(sliderName, initialValue, minimum, maximum, step, sliderOrder)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, 0, 0, 88)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 28)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.LayoutOrder = sliderOrder
        sliderFrame.Parent = contentFrame
        Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0, 4)
        local sliderBorder = Instance.new("UIStroke", sliderFrame)
        sliderBorder.Color = Color3.fromRGB(38, 48, 58)
        sliderBorder.Thickness = 1
        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Size = UDim2.new(1, -180, 0, 26)
        sliderLabel.Position = UDim2.new(0, 12, 0, 4)
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Text = sliderName
        sliderLabel.TextColor3 = Color3.fromRGB(210, 225, 235)
        sliderLabel.Font = codeFont
        sliderLabel.TextSize = 12
        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        sliderLabel.Parent = sliderFrame
        local decrementButton = Instance.new("TextButton")
        decrementButton.Size = UDim2.new(0, 22, 0, 24)
        decrementButton.Position = UDim2.new(1, -128, 0, 4)
        decrementButton.BackgroundColor3 = Color3.fromRGB(45, 22, 22)
        decrementButton.Text = "−"
        decrementButton.TextColor3 = Color3.fromRGB(255, 110, 110)
        decrementButton.Font = boldFont
        decrementButton.TextSize = 16
        decrementButton.Parent = sliderFrame
        Instance.new("UICorner", decrementButton).CornerRadius = UDim.new(0, 3)
        local valueInput = Instance.new("TextBox")
        valueInput.Size = UDim2.new(0, 72, 0, 24)
        valueInput.Position = UDim2.new(1, -104, 0, 4)
        valueInput.BackgroundColor3 = Color3.fromRGB(6, 8, 12)
        valueInput.BorderSizePixel = 0
        valueInput.Text = tostring(initialValue)
        valueInput.TextColor3 = Color3.fromRGB(0, 255, 130)
        valueInput.Font = codeFont
        valueInput.TextSize = 13
        valueInput.ClearTextOnFocus = false
        valueInput.Parent = sliderFrame
        local valueInputBorder = Instance.new("UIStroke", valueInput)
        valueInputBorder.Color = Color3.fromRGB(0, 180, 100)
        valueInputBorder.Thickness = 1
        Instance.new("UICorner", valueInput).CornerRadius = UDim.new(0, 3)
        local incrementButton = Instance.new("TextButton")
        incrementButton.Size = UDim2.new(0, 22, 0, 24)
        incrementButton.Position = UDim2.new(1, -28, 0, 4)
        incrementButton.BackgroundColor3 = Color3.fromRGB(22, 45, 28)
        incrementButton.Text = "+"
        incrementButton.TextColor3 = Color3.fromRGB(110, 255, 140)
        incrementButton.Font = boldFont
        incrementButton.TextSize = 14
        incrementButton.Parent = sliderFrame
        Instance.new("UICorner", incrementButton).CornerRadius = UDim.new(0, 3)
        local sliderTrack = Instance.new("Frame")
        sliderTrack.Size = UDim2.new(1, -24, 0, 8)
        sliderTrack.Position = UDim2.new(0, 12, 0, 42)
        sliderTrack.BackgroundColor3 = Color3.fromRGB(28, 34, 42)
        sliderTrack.BorderSizePixel = 0
        sliderTrack.Parent = sliderFrame
        Instance.new("UICorner", sliderTrack).CornerRadius = UDim.new(1, 0)
        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new(0, 0, 1, 0)
        sliderFill.BackgroundColor3 = Color3.fromRGB(0, 220, 120)
        sliderFill.BorderSizePixel = 0
        sliderFill.Parent = sliderTrack
        Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)
        local sliderThumb = Instance.new("Frame")
        sliderThumb.Size = UDim2.new(0, 14, 0, 14)
        sliderThumb.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderThumb.Position = UDim2.new(0, 0, 0.5, 0)
        sliderThumb.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
        sliderThumb.BorderSizePixel = 0
        sliderThumb.Parent = sliderTrack
        Instance.new("UICorner", sliderThumb).CornerRadius = UDim.new(1, 0)
        local rangeLabel = Instance.new("TextLabel")
        rangeLabel.Size = UDim2.new(1, -24, 0, 14)
        rangeLabel.Position = UDim2.new(0, 12, 0, 62)
        rangeLabel.BackgroundTransparency = 1
        rangeLabel.Text = string.format("range %s – %s   (drag slider or type)", tostring(minimum), tostring(maximum))
        rangeLabel.TextColor3 = Color3.fromRGB(90, 105, 115)
        rangeLabel.Font = codeFont
        rangeLabel.TextSize = 9
        rangeLabel.TextXAlignment = Enum.TextXAlignment.Left
        rangeLabel.Parent = sliderFrame
        local sliderValue = initialValue
        local sliderListeners = {}
        local function fireSliderChanged(changedValue)
            for sliderListenerIndex, sliderListener in ipairs(sliderListeners) do
                pcall(sliderListener, changedValue)
            end
        end
        local function updateSliderVisuals(visualValue)
            local fraction = math.clamp((visualValue - minimum) / (maximum - minimum), 0, 1)
            sliderFill.Size = UDim2.new(fraction, 0, 1, 0)
            sliderThumb.Position = UDim2.new(fraction, 0, 0.5, 0)
            valueInput.Text = tostring(visualValue)
        end
        local function setSliderValue(newSliderValue, bypassStep)
            newSliderValue = math.clamp(newSliderValue, minimum, maximum)
            if not bypassStep then
                newSliderValue = math.floor(newSliderValue / step + 0.5) * step
            end
            sliderValue = newSliderValue
            updateSliderVisuals(newSliderValue)
            fireSliderChanged(newSliderValue)
        end
        valueInput.FocusLost:Connect(function()
            local parsedValue = tonumber(valueInput.Text)
            if parsedValue then
                setSliderValue(parsedValue, true)
            else
                valueInput.Text = tostring(sliderValue)
            end
        end)
        decrementButton.MouseButton1Click:Connect(function()
            setSliderValue(sliderValue - step)
        end)
        incrementButton.MouseButton1Click:Connect(function()
            setSliderValue(sliderValue + step)
        end)
        local dragging = false
        local function setSliderFromX(screenX)
            local dragFraction =
                math.clamp((screenX - sliderTrack.AbsolutePosition.X) / math.max(sliderTrack.AbsoluteSize.X, 1), 0, 1)
            setSliderValue(minimum + dragFraction * (maximum - minimum))
        end
        sliderTrack.InputBegan:Connect(function(beginInput)
            if
                beginInput.UserInputType == Enum.UserInputType.MouseButton1
                or beginInput.UserInputType == Enum.UserInputType.Touch
            then
                dragging = true
                setSliderFromX(beginInput.Position.X)
            end
        end)
        UserInputService.InputChanged:Connect(function(changedInput)
            if
                dragging
                and (
                    changedInput.UserInputType == Enum.UserInputType.MouseMovement
                    or changedInput.UserInputType == Enum.UserInputType.Touch
                )
            then
                setSliderFromX(changedInput.Position.X)
            end
        end)
        UserInputService.InputEnded:Connect(function(endedInput)
            if
                endedInput.UserInputType == Enum.UserInputType.MouseButton1
                or endedInput.UserInputType == Enum.UserInputType.Touch
            then
                dragging = false
            end
        end)
        updateSliderVisuals(initialValue)
        return {
            SetValue = setSliderValue,
            GetValue = function()
                return sliderValue
            end,
            OnChanged = {
                Connect = function(signalSelf, onChangedCallback)
                    table.insert(sliderListeners, onChangedCallback)
                end,
            },
        }
    end
    createSection("HEIGHT", 1)
    local heightSlider = createSlider("Player Height", 1, 0.1, 10000, 0.5, 2)
    createSection("WIDTH", 3)
    local widthSlider = createSlider("Player Width", 1, 0.1, 10000, 0.5, 4)
    createSection("HEAD", 5)
    local headSlider = createSlider("Player Head", 1, 0.1, 10000, 0.5, 6)
    local autoWidth, autoHead, updatingAutomatically = true, true, false
    local autoPanel = Instance.new("Frame")
    autoPanel.Size = UDim2.new(1, 0, 0, 78)
    autoPanel.BackgroundColor3 = Color3.fromRGB(14, 30, 22)
    autoPanel.BorderSizePixel = 0
    autoPanel.LayoutOrder = 7
    autoPanel.Parent = contentFrame
    Instance.new("UICorner", autoPanel).CornerRadius = UDim.new(0, 4)
    local autoPanelBorder = Instance.new("UIStroke", autoPanel)
    autoPanelBorder.Color = Color3.fromRGB(0, 200, 110)
    autoPanelBorder.Thickness = 1
    autoPanelBorder.Transparency = 0.4
    local autoPanelIcon = Instance.new("TextLabel")
    autoPanelIcon.Size = UDim2.new(0, 22, 0, 24)
    autoPanelIcon.Position = UDim2.new(0, 10, 0, 6)
    autoPanelIcon.BackgroundTransparency = 1
    autoPanelIcon.Text = "⚡"
    autoPanelIcon.TextColor3 = Color3.fromRGB(0, 255, 130)
    autoPanelIcon.Font = boldFont
    autoPanelIcon.TextSize = 16
    autoPanelIcon.Parent = autoPanel
    local autoSummary = Instance.new("TextLabel")
    autoSummary.Size = UDim2.new(1, -40, 0, 24)
    autoSummary.Position = UDim2.new(0, 36, 0, 6)
    autoSummary.BackgroundTransparency = 1
    autoSummary.Text = "H 1 → W 1 · Head 1"
    autoSummary.TextColor3 = Color3.fromRGB(180, 240, 210)
    autoSummary.Font = codeFont
    autoSummary.TextSize = 11
    autoSummary.TextXAlignment = Enum.TextXAlignment.Left
    autoSummary.Parent = autoPanel
    local autoWidthButton = Instance.new("TextButton")
    autoWidthButton.Size = UDim2.new(0.5, -12, 0, 30)
    autoWidthButton.Position = UDim2.new(0, 8, 0, 38)
    autoWidthButton.BackgroundColor3 = Color3.fromRGB(30, 90, 60)
    autoWidthButton.Text = "AUTO WIDTH: ON"
    autoWidthButton.TextColor3 = Color3.fromRGB(200, 255, 220)
    autoWidthButton.Font = boldFont
    autoWidthButton.TextSize = 10
    autoWidthButton.Parent = autoPanel
    Instance.new("UICorner", autoWidthButton).CornerRadius = UDim.new(0, 4)
    local autoHeadButton = Instance.new("TextButton")
    autoHeadButton.Size = UDim2.new(0.5, -12, 0, 30)
    autoHeadButton.Position = UDim2.new(0.5, 4, 0, 38)
    autoHeadButton.BackgroundColor3 = Color3.fromRGB(30, 90, 60)
    autoHeadButton.Text = "AUTO HEAD: ON"
    autoHeadButton.TextColor3 = Color3.fromRGB(200, 255, 220)
    autoHeadButton.Font = boldFont
    autoHeadButton.TextSize = 10
    autoHeadButton.Parent = autoPanel
    Instance.new("UICorner", autoHeadButton).CornerRadius = UDim.new(0, 4)
    heightSlider.OnChanged:Connect(function(newHeight)
        local computedWidth, computedHead = autoWidthForHeight(newHeight), autoHeadForHeight(newHeight)
        autoSummary.Text = string.format("H %.1f → W %d · Head %d", newHeight, computedWidth, computedHead)
        if autoWidth then
            updatingAutomatically = true
            widthSlider.SetValue(computedWidth)
            updatingAutomatically = false
        end
        if autoHead then
            updatingAutomatically = true
            headSlider.SetValue(computedHead)
            updatingAutomatically = false
        end
    end)
    widthSlider.OnChanged:Connect(function()
        if not updatingAutomatically and autoWidth then
            autoWidth = false
            autoWidthButton.Text = "AUTO WIDTH: OFF"
            autoWidthButton.BackgroundColor3 = Color3.fromRGB(90, 30, 30)
            autoWidthButton.TextColor3 = Color3.fromRGB(255, 180, 180)
        end
    end)
    headSlider.OnChanged:Connect(function()
        if not updatingAutomatically and autoHead then
            autoHead = false
            autoHeadButton.Text = "AUTO HEAD: OFF"
            autoHeadButton.BackgroundColor3 = Color3.fromRGB(90, 30, 30)
            autoHeadButton.TextColor3 = Color3.fromRGB(255, 180, 180)
        end
    end)
    autoWidthButton.MouseButton1Click:Connect(function()
        autoWidth = not autoWidth
        if autoWidth then
            autoWidthButton.Text = "AUTO WIDTH: ON"
            autoWidthButton.BackgroundColor3 = Color3.fromRGB(30, 90, 60)
            autoWidthButton.TextColor3 = Color3.fromRGB(200, 255, 220)
            updatingAutomatically = true
            widthSlider.SetValue(autoWidthForHeight(heightSlider.GetValue()))
            updatingAutomatically = false
        else
            autoWidthButton.Text = "AUTO WIDTH: OFF"
            autoWidthButton.BackgroundColor3 = Color3.fromRGB(90, 30, 30)
            autoWidthButton.TextColor3 = Color3.fromRGB(255, 180, 180)
        end
    end)
    autoHeadButton.MouseButton1Click:Connect(function()
        autoHead = not autoHead
        if autoHead then
            autoHeadButton.Text = "AUTO HEAD: ON"
            autoHeadButton.BackgroundColor3 = Color3.fromRGB(30, 90, 60)
            autoHeadButton.TextColor3 = Color3.fromRGB(200, 255, 220)
            updatingAutomatically = true
            headSlider.SetValue(autoHeadForHeight(heightSlider.GetValue()))
            updatingAutomatically = false
        else
            autoHeadButton.Text = "AUTO HEAD: OFF"
            autoHeadButton.BackgroundColor3 = Color3.fromRGB(90, 30, 30)
            autoHeadButton.TextColor3 = Color3.fromRGB(255, 180, 180)
        end
    end)
    local applyButton = Instance.new("TextButton")
    applyButton.Size = UDim2.new(1, 0, 0, 44)
    applyButton.BackgroundColor3 = Color3.fromRGB(0, 140, 80)
    applyButton.Text = "APPLY RESIZE  (H + W + HEAD)"
    applyButton.TextColor3 = Color3.new(1, 1, 1)
    applyButton.Font = boldFont
    applyButton.TextSize = 13
    applyButton.LayoutOrder = 8
    applyButton.Parent = contentFrame
    Instance.new("UICorner", applyButton).CornerRadius = UDim.new(0, 5)
    applyButton.MouseButton1Click:Connect(function()
        local chosenHeight, chosenWidth, chosenHead =
            heightSlider.GetValue(), widthSlider.GetValue(), headSlider.GetValue()
        applyButton.Text = "APPLYING..."
        applyButton.BackgroundColor3 = Color3.fromRGB(80, 100, 40)
        task.spawn(function()
            local applySucceeded, applyMessage = applyResize(chosenHeight, chosenWidth, chosenHead)
            if applySucceeded then
                applyButton.Text = "✓  " .. (applyMessage or "")
                applyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
                setFooter("✅ " .. (applyMessage or ""), Color3.fromRGB(150, 255, 150))
            else
                applyButton.Text = "✗  " .. (applyMessage or "fail")
                applyButton.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
                setFooter("❌ " .. tostring(applyMessage), Color3.fromRGB(255, 150, 150))
            end
            task.wait(1.4)
            applyButton.Text = "APPLY RESIZE  (H + W + HEAD)"
            applyButton.BackgroundColor3 = Color3.fromRGB(0, 140, 80)
        end)
    end)
    local resetButton = Instance.new("TextButton")
    resetButton.Size = UDim2.new(1, 0, 0, 30)
    resetButton.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
    resetButton.Text = "RESET TO NORMAL  (1 × 1 × 1)"
    resetButton.TextColor3 = Color3.fromRGB(255, 200, 200)
    resetButton.Font = boldFont
    resetButton.TextSize = 11
    resetButton.LayoutOrder = 9
    resetButton.Parent = contentFrame
    Instance.new("UICorner", resetButton).CornerRadius = UDim.new(0, 4)
    resetButton.MouseButton1Click:Connect(function()
        updatingAutomatically = true
        heightSlider.SetValue(1)
        widthSlider.SetValue(1)
        headSlider.SetValue(1)
        updatingAutomatically = false
        task.spawn(function()
            applyResize(1, 1, 1)
            setFooter("✅ Reset", Color3.fromRGB(150, 255, 150))
        end)
    end)
    createSection("PRESETS", 10)
    local presetsContainer = Instance.new("Frame")
    presetsContainer.Size = UDim2.new(1, 0, 0, 170)
    presetsContainer.BackgroundTransparency = 1
    presetsContainer.LayoutOrder = 11
    presetsContainer.Parent = contentFrame
    local presetsGrid = Instance.new("UIGridLayout", presetsContainer)
    presetsGrid.CellSize = UDim2.new(0.5, -4, 0, 30)
    -- Preserved from the source: CellPadding expects UDim2, not UDim.
    presetsGrid.CellPadding = UDim.new(0, 4, 0, 4)
    local presets = {
        { "Tall (3×)", { h = 3, w = 4, head = 3 } },
        { "Giant (6×)", { h = 6, w = 8, head = 6 } },
        { "Titan (15×)", { h = 15, w = 20, head = 15 } },
        { "Mega (30×)", { h = 30, w = 40, head = 30 } },
        { "Short (0.6×)", { h = 0.6, w = 1, head = 0.8 } },
        { "Custom 59→79", { h = 59, w = 79, head = 59 } },
        { "Big Head", { h = 1, w = 1, head = 3 } },
        { "Small Head", { h = 3, w = 4, head = 1 } },
        { "Chonky", { h = 2, w = 4, head = 2 } },
        { "Wide (W=5)", { h = 1, w = 5, head = 1 } },
    }
    for presetIndex, preset in ipairs(presets) do
        local presetButton = Instance.new("TextButton")
        presetButton.BackgroundColor3 = Color3.fromRGB(25, 40, 50)
        presetButton.Text = preset[1]
        presetButton.TextColor3 = Color3.fromRGB(180, 220, 220)
        presetButton.Font = boldFont
        presetButton.TextSize = 10
        presetButton.LayoutOrder = presetIndex
        presetButton.Parent = presetsContainer
        Instance.new("UICorner", presetButton).CornerRadius = UDim.new(0, 4)
        local presetBorder = Instance.new("UIStroke", presetButton)
        presetBorder.Color = Color3.fromRGB(40, 80, 100)
        presetBorder.Thickness = 1
        presetButton.MouseButton1Click:Connect(function()
            local presetHeight, presetWidth, presetHead = preset[2].h, preset[2].w, preset[2].head
            updatingAutomatically = true
            heightSlider.SetValue(presetHeight)
            widthSlider.SetValue(presetWidth)
            headSlider.SetValue(presetHead)
            updatingAutomatically = false
            task.spawn(function()
                applyResize(presetHeight, presetWidth, presetHead)
            end)
        end)
    end
end
local uiSucceeded, uiError = pcall(createGui)
if not uiSucceeded then
    warn("[Frostbite X] UI Error: " .. tostring(uiError))
else
    print("[Frostbite X] UI ok")
end
-- notify is not defined in the supplied snippet; the environment must provide it.
task.spawn(function()
    local bioSucceeded, bioAttempt = setBio(8)
    if bioSucceeded then
        notify("Frostbite X", "Bio set ✓ (" .. bioAttempt .. " attempt)", 3)
    else
        notify("Frostbite X", "Bio pending — retrying", 3)
    end
end)
task.wait(0.5)
notify("Frostbite X", "Full Re-Sizer Loaded!", 3)
print("[Frostbite X] READY ✓")
