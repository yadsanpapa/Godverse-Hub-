--==================================================
-- CELESTIAL SYNDICATE | PORTAL INTRO V4 + GODVERSE HUB UV1
-- BLACK & GOLD EDITION (FIXED & COMBINED)
--==================================================

-- ========================================================
-- PART 1: CELESTIAL SYNDICATE | PORTAL INTRO V4
-- ========================================================
do
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local Player = Players.LocalPlayer
    local TargetGuiParent = (typeof(gethui) == "function" and gethui()) or Player:WaitForChild("PlayerGui")

    -- SETTINGS
    local DURATION = 6
    local GOLD = Color3.fromRGB(238, 184, 91)
    local WHITE_GOLD = Color3.fromRGB(255, 225, 174)
    local DARK_GOLD = Color3.fromRGB(115, 77, 36)
    local BLACK = Color3.fromRGB(5, 4, 8)

    -- CLEANUP EXISTING INTRO
    local old = TargetGuiParent:FindFirstChild("CELESTIAL_SYNDICATE_PORTAL")
    if old then old:Destroy() end

    -- SCREEN
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "CELESTIAL_SYNDICATE_PORTAL"
    Gui.IgnoreGuiInset = true
    Gui.ResetOnSpawn = false
    Gui.DisplayOrder = 999
    Gui.Parent = TargetGuiParent

    -- BACKGROUND
    local BG = Instance.new("Frame")
    BG.Size = UDim2.fromScale(1, 1)
    BG.BackgroundColor3 = BLACK
    BG.BorderSizePixel = 0
    BG.Parent = Gui

    local BGGradient = Instance.new("UIGradient")
    BGGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 13, 5)),
        ColorSequenceKeypoint.new(0.5, BLACK),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 9, 4))
    })
    BGGradient.Rotation = 90
    BGGradient.Parent = BG

    -- RESPONSIVE PORTAL
    local Portal = Instance.new("Frame")
    Portal.Name = "Portal"
    Portal.AnchorPoint = Vector2.new(0.5, 0.5)
    Portal.Position = UDim2.fromScale(0.5, 0.37)
    Portal.Size = UDim2.fromOffset(300, 300)
    Portal.BackgroundTransparency = 1
    Portal.Parent = BG

    local viewportConn = nil
    local function ResizePortal()
        local camera = workspace.CurrentCamera
        if not camera then return end

        local viewport = camera.ViewportSize
        local diameter = math.floor(math.min(viewport.X, viewport.Y) * 0.78)
        Portal.Size = UDim2.fromOffset(diameter, diameter)

        if viewportConn then
            viewportConn:Disconnect()
        end
        viewportConn = camera:GetPropertyChangedSignal("ViewportSize"):Connect(ResizePortal)
    end

    ResizePortal()
    local cameraConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(ResizePortal)

    -- TWEEN HELPER
    local function Tween(obj, duration, properties, repeatCount)
        local info = TweenInfo.new(
            duration,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut,
            repeatCount or 0
        )
        local animation = TweenService:Create(obj, info, properties)
        animation:Play()
        return animation
    end

    -- CIRCLE CREATOR
    local function Ring(parent, size, color, thickness, transparency)
        local circle = Instance.new("Frame")
        circle.AnchorPoint = Vector2.new(0.5, 0.5)
        circle.Position = UDim2.fromScale(0.5, 0.5)
        circle.Size = UDim2.fromScale(size, size)
        circle.BackgroundTransparency = 1
        circle.Parent = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = circle

        local stroke = Instance.new("UIStroke")
        stroke.Color = color
        stroke.Thickness = thickness
        stroke.Transparency = transparency or 0.15
        stroke.Parent = circle

        return circle
    end

    -- ROTATING LAYER
    local function RotatingLayer(duration, direction)
        local layer = Instance.new("Frame")
        layer.AnchorPoint = Vector2.new(0.5, 0.5)
        layer.Position = UDim2.fromScale(0.5, 0.5)
        layer.Size = UDim2.fromScale(1, 1)
        layer.BackgroundTransparency = 1
        layer.Parent = Portal

        Tween(layer, duration, { Rotation = direction * 360 }, -1)
        return layer
    end

    -- OUTER RINGS
    local OuterLayer = RotatingLayer(35, 1)
    Ring(OuterLayer, 0.98, DARK_GOLD, 1, 0.2)
    Ring(OuterLayer, 0.91, GOLD, 1, 0.35)

    -- SECOND ROTATING LAYER
    local SecondLayer = RotatingLayer(24, -1)
    Ring(SecondLayer, 0.80, GOLD, 2, 0.12)
    Ring(SecondLayer, 0.73, DARK_GOLD, 1, 0.2)

    -- THIRD ROTATING LAYER
    local ThirdLayer = RotatingLayer(15, 1)
    Ring(ThirdLayer, 0.61, WHITE_GOLD, 2, 0.1)
    Ring(ThirdLayer, 0.53, GOLD, 1, 0.2)

    -- GEOMETRIC POLYGON CREATOR
    local function Polygon(parent, sides, radius, color)
        for i = 1, sides do
            local a1 = ((i - 1) / sides) * math.pi * 2
            local a2 = (i / sides) * math.pi * 2

            local x1 = 0.5 + math.cos(a1) * radius
            local y1 = 0.5 + math.sin(a1) * radius
            local x2 = 0.5 + math.cos(a2) * radius
            local y2 = 0.5 + math.sin(a2) * radius

            local dx = x2 - x1
            local dy = y2 - y1

            local line = Instance.new("Frame")
            line.AnchorPoint = Vector2.new(0.5, 0.5)
            line.Position = UDim2.fromScale((x1 + x2) / 2, (y1 + y2) / 2)
            line.Size = UDim2.fromScale(math.sqrt(dx * dx + dy * dy), 0)
            line.Rotation = math.deg(math.atan2(dy, dx))
            line.BorderSizePixel = 0
            line.BackgroundColor3 = color
            line.BackgroundTransparency = 0.25
            line.Parent = parent

            local stroke = Instance.new("UIStroke")
            stroke.Color = color
            stroke.Thickness = 1
            stroke.Parent = line
        end
    end

    local PolygonLayer = RotatingLayer(12, -1)
    Polygon(PolygonLayer, 8, 0.29, GOLD)

    local PolygonLayer2 = RotatingLayer(19, 1)
    Polygon(PolygonLayer2, 5, 0.22, WHITE_GOLD)

    -- INNER CORE
    Ring(Portal, 0.30, WHITE_GOLD, 2, 0.05)

    local CoreFill = Instance.new("Frame")
    CoreFill.AnchorPoint = Vector2.new(0.5, 0.5)
    CoreFill.Position = UDim2.fromScale(0.5, 0.5)
    CoreFill.Size = UDim2.fromScale(0.26, 0.26)
    CoreFill.BackgroundColor3 = Color3.fromRGB(12, 8, 4)
    CoreFill.BorderSizePixel = 0
    CoreFill.Parent = Portal

    local CoreCorner = Instance.new("UICorner")
    CoreCorner.CornerRadius = UDim.new(1, 0)
    CoreCorner.Parent = CoreFill

    local CoreStroke = Instance.new("UIStroke")
    CoreStroke.Color = GOLD
    CoreStroke.Thickness = 2
    CoreStroke.Parent = CoreFill

    Tween(CoreStroke, 1.5, { Transparency = 0.7 }, -1)

    -- FLOATING PARTICLES
    for i = 1, 14 do
        local dot = Instance.new("Frame")
        dot.AnchorPoint = Vector2.new(0.5, 0.5)
        dot.Position = UDim2.fromScale(((i * 37) % 90 + 5) / 100, ((i * 61) % 90 + 5) / 100)
        dot.Size = UDim2.fromOffset(i % 3 + 1, i % 3 + 1)
        dot.BackgroundColor3 = GOLD
        dot.BackgroundTransparency = 0.25
        dot.BorderSizePixel = 0
        dot.Parent = BG

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = dot
    end

    -- TITLE
    local Title = Instance.new("TextLabel")
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.Position = UDim2.fromScale(0.5, 0.66)
    Title.Size = UDim2.fromScale(0.94, 0.085)
    Title.BackgroundTransparency = 1
    Title.Text = "C E L E S T I A L"
    Title.TextColor3 = WHITE_GOLD
    Title.Font = Enum.Font.GothamBlack
    Title.TextScaled = true
    Title.TextTransparency = 1
    Title.Parent = BG

    -- SUBTITLE
    local Subtitle = Instance.new("TextLabel")
    Subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
    Subtitle.Position = UDim2.fromScale(0.5, 0.72)
    Subtitle.Size = UDim2.fromScale(0.85, 0.038)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "S Y N D I C A T E"
    Subtitle.TextColor3 = GOLD
    Subtitle.Font = Enum.Font.GothamMedium
    Subtitle.TextScaled = true
    Subtitle.TextTransparency = 1
    Subtitle.Parent = BG

    -- STATUS
    local Status = Instance.new("TextLabel")
    Status.AnchorPoint = Vector2.new(0.5, 0.5)
    Status.Position = UDim2.fromScale(0.5, 0.84)
    Status.Size = UDim2.fromScale(0.8, 0.035)
    Status.BackgroundTransparency = 1
    Status.Text = "INITIALIZING SYSTEMS..."
    Status.TextColor3 = GOLD
    Status.Font = Enum.Font.Gotham
    Status.TextScaled = true
    Status.TextTransparency = 0
    Status.Parent = BG

    -- PROGRESS BAR
    local BarBG = Instance.new("Frame")
    BarBG.AnchorPoint = Vector2.new(0.5, 0.5)
    BarBG.Position = UDim2.fromScale(0.5, 0.91)
    BarBG.Size = UDim2.fromScale(0.58, 0.009)
    BarBG.BackgroundColor3 = Color3.fromRGB(54, 39, 22)
    BarBG.BorderSizePixel = 0
    BarBG.Parent = BG

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.fromScale(0, 1)
    Bar.BackgroundColor3 = WHITE_GOLD
    Bar.BorderSizePixel = 0
    Bar.Parent = BarBG

    -- ANIMATION
    Tween(Title, 1.2, { TextTransparency = 0 })
    Tween(Subtitle, 1.5, { TextTransparency = 0 })
    Tween(Bar, DURATION, { Size = UDim2.fromScale(1, 1) })

    local messages = {
        "INITIALIZING SYSTEMS...",
        "CONNECTING TO GODVERSE HUB..",
        "LOADING CELESTIAL SYNDICATE UI...",
        "AB HOGI TABAHI 🗿..",
        "AB PLAYERS PILENGE⚡"
    }

    for _, message in ipairs(messages) do
        Status.Text = message
        task.wait(DURATION / #messages)
    end

    -- FADE TRANSITION
    for _, object in ipairs(Gui:GetDescendants()) do
        if object:IsA("GuiObject") then
            local properties = { BackgroundTransparency = 1 }
            if object:IsA("TextLabel") then
                properties.TextTransparency = 1
            end
            Tween(object, 0.7, properties)
        elseif object:IsA("UIStroke") then
            Tween(object, 0.7, { Transparency = 1 })
        end
    end

    task.wait(0.8)
    if cameraConn then cameraConn:Disconnect() end
    if viewportConn then viewportConn:Disconnect() end
    Gui:Destroy()
end

-- ========================================================
-- PART 2: CELESTIAL GODVERSE HUB UV1 - WindUI Interface
-- ========================================================
local ok, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()
end)

if not ok or not WindUI then
    warn("[CELESTIAL GODVERSE HUB] Failed to load WindUI library.")
    return
end

local Window = WindUI:CreateWindow({
    Title = "CELESTIAL GODVERSE HUB UV1",
    Icon = "crown",
    Author = "YADSAN 🔱",
    Folder = "YadsanHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 180,
    ScrollBarEnabled = true,
})

--// SERVICES & GLOBAL VARIABLES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local TargetPlayer = nil
local BangSpeed = 1
local AntiFlingConnection = nil
local WalkingFlingConnection = nil
local NoclipConnection = nil
local InfJumpConnection = nil
local SpeedCharConnection = nil

local Toggles = {
    Bang = false,
    MouthBang = false,
    Headsit = false,
    FrontHeadsit = false,
    Orbit = false,
    WalkingFling = false,
    Noclip = false,
    FlyWalk = false,
    Speed = false,
    InfJump = false,
    AntiVoid = false,
    AntiBangV1 = false,
    AntiBangV2 = false,
    AntiFling = false,
    AntiSit = false
}

local function Notify(title, content, duration)
    pcall(function()
        WindUI:Notify({
            Title = title,
            Content = content,
            Duration = duration or 3,
        })
    end)
end

local function GetPlayer(name)
    if not name or name == "" then return nil end
    name = name:lower()

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if p.Name:lower():sub(1, #name) == name
            or p.DisplayName:lower():sub(1, #name) == name then
                return p
            end
        end
    end

    return nil
end

local function HasValidTarget()
    if not TargetPlayer or not TargetPlayer.Parent then
        Notify("NO TARGET", "Please enter a valid player name first!", 3)
        return false
    end
    if not TargetPlayer.Character or not TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Notify("TARGET UNAVAILABLE", TargetPlayer.Name .. " has no active character!", 3)
        return false
    end
    return true
end

--// INFORMATION TAB
local InfoTab = Window:Tab({
    Title = "INFORMATION",
    Icon = "info",
})

InfoTab:Paragraph({
    Title = "GODVERSE 🌐",
    Desc = "Made by Yadsan_Godverse",
})

InfoTab:Paragraph({
    Title = "ROBLOX ID",
    Desc = "Yadsan_Godverse",
})

InfoTab:Paragraph({
    Title = "CREATOR",
    Desc = "Yadsan Papa",
})

InfoTab:Paragraph({
    Title = "STATUS",
    Desc = "ASUKAREIGN X CELESTIAL SYNDICATE X ZERO MERCY LOADED",
})

--// TROLL TAB
local TrollTab = Window:Tab({
    Title = "TROLL💀",
    Icon = "skull",
})

--// OP MULTI FLING GUI INTEGRATION (FIXED)
TrollTab:Button({
    Title = "OP MULTI FLING GUI 💀",
    Desc = "Click to activate the Ultimate Multi Fling Panel!",
    Callback = function()
        local coreGui = (typeof(gethui) == "function" and gethui()) or game:GetService("CoreGui")
        if coreGui:FindFirstChild("YadsanMultiFlingGUI") then
            Notify("GODVERSE HUB", "Multi Fling GUI is already open!", 3)
            return
        end

        task.spawn(function()
            local Player = Players.LocalPlayer

            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "YadsanMultiFlingGUI"
            ScreenGui.ResetOnSpawn = false
            ScreenGui.Parent = coreGui

            local MainFrame = Instance.new("Frame")
            MainFrame.Size = UDim2.new(0, 320, 0, 370)
            MainFrame.Position = UDim2.new(0.5, -160, 0.5, -185)
            MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            MainFrame.BorderSizePixel = 0
            MainFrame.Active = true
            MainFrame.Draggable = true
            MainFrame.Parent = ScreenGui

            local MainCorner = Instance.new("UICorner")
            MainCorner.CornerRadius = UDim.new(0, 8)
            MainCorner.Parent = MainFrame

            local MinFrame = Instance.new("Frame")
            MinFrame.Size = UDim2.new(0, 240, 0, 35)
            MinFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            MinFrame.BorderSizePixel = 0
            MinFrame.Active = true
            MinFrame.Visible = false
            MinFrame.Parent = ScreenGui

            local MinFrameCorner = Instance.new("UICorner")
            MinFrameCorner.CornerRadius = UDim.new(0, 8)
            MinFrameCorner.Parent = MinFrame

            local MinLabel = Instance.new("TextLabel")
            MinLabel.Size = UDim2.new(1, -40, 1, 0)
            MinLabel.Position = UDim2.new(0, 10, 0, 0)
            MinLabel.BackgroundTransparency = 1
            MinLabel.Text = "YADSAN MULTI FLING GUI"
            MinLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            MinLabel.Font = Enum.Font.GothamBold
            MinLabel.TextSize = 12
            MinLabel.TextXAlignment = Enum.TextXAlignment.Left
            MinLabel.Parent = MinFrame

            local OpenButton = Instance.new("TextButton")
            OpenButton.Size = UDim2.new(0, 25, 0, 25)
            OpenButton.Position = UDim2.new(1, -30, 0, 5)
            OpenButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            OpenButton.BorderSizePixel = 0
            OpenButton.Text = "+"
            OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OpenButton.Font = Enum.Font.GothamBold
            OpenButton.TextSize = 18
            OpenButton.Parent = MinFrame

            local OpenCorner = Instance.new("UICorner")
            OpenCorner.CornerRadius = UDim.new(0, 6)
            OpenCorner.Parent = OpenButton

            local draggingMin, dragInputMin, dragStartMin, startPosMin
            local minInputChangedConn, minInputEndedConn

            MinFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    draggingMin = true
                    dragStartMin = input.Position
                    startPosMin = MinFrame.Position
                end
            end)
            MinFrame.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    dragInputMin = input
                end
            end)
            minInputChangedConn = UserInputService.InputChanged:Connect(function(input)
                if input == dragInputMin and draggingMin then
                    local delta = input.Position - dragStartMin
                    MinFrame.Position = UDim2.new(startPosMin.X.Scale, startPosMin.X.Offset + delta.X, startPosMin.Y.Scale, startPosMin.Y.Offset + delta.Y)
                end
            end)
            minInputEndedConn = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    draggingMin = false
                end
            end)

            local TitleBar = Instance.new("Frame")
            TitleBar.Size = UDim2.new(1, 0, 0, 35)
            TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            TitleBar.BorderSizePixel = 0
            TitleBar.Parent = MainFrame

            local TitleCorner = Instance.new("UICorner")
            TitleCorner.CornerRadius = UDim.new(0, 8)
            TitleCorner.Parent = TitleBar

            local TitleFix = Instance.new("Frame")
            TitleFix.Size = UDim2.new(1, 0, 0, 10)
            TitleFix.Position = UDim2.new(0, 0, 1, -10)
            TitleFix.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            TitleFix.BorderSizePixel = 0
            TitleFix.Parent = TitleBar

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(1, -75, 1, 0)
            Title.Position = UDim2.new(0, 10, 0, 0)
            Title.BackgroundTransparency = 1
            Title.Text = "YADSAN HUB MULTI FLING✨"
            Title.TextColor3 = Color3.fromRGB(255, 50, 50)
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 14
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = TitleBar

            local MinimizeButton = Instance.new("TextButton")
            MinimizeButton.Position = UDim2.new(1, -65, 0, 5)
            MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
            MinimizeButton.BackgroundColor3 = Color3.fromRGB(200, 130, 30)
            MinimizeButton.BorderSizePixel = 0
            MinimizeButton.Text = "-"
            MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            MinimizeButton.Font = Enum.Font.GothamBold
            MinimizeButton.TextSize = 18
            MinimizeButton.Parent = TitleBar

            local MinimizeCorner = Instance.new("UICorner")
            MinimizeCorner.CornerRadius = UDim.new(0, 6)
            MinimizeCorner.Parent = MinimizeButton

            local CloseButton = Instance.new("TextButton")
            CloseButton.Position = UDim2.new(1, -35, 0, 5)
            CloseButton.Size = UDim2.new(0, 25, 0, 25)
            CloseButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
            CloseButton.BorderSizePixel = 0
            CloseButton.Text = "X"
            CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            CloseButton.Font = Enum.Font.GothamBold
            CloseButton.TextSize = 14
            CloseButton.Parent = TitleBar

            local CloseCorner = Instance.new("UICorner")
            CloseCorner.CornerRadius = UDim.new(0, 6)
            CloseCorner.Parent = CloseButton

            local AuthorLabel = Instance.new("TextLabel")
            AuthorLabel.Position = UDim2.new(0, 10, 0, 40)
            AuthorLabel.Size = UDim2.new(1, -20, 0, 15)
            AuthorLabel.BackgroundTransparency = 1
            AuthorLabel.Text = "Made by @Yadsan_Godverse"
            AuthorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
            AuthorLabel.Font = Enum.Font.Gotham
            AuthorLabel.TextSize = 12
            AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left
            AuthorLabel.Parent = MainFrame

            local StatusLabel = Instance.new("TextLabel")
            StatusLabel.Position = UDim2.new(0, 10, 0, 55)
            StatusLabel.Size = UDim2.new(1, -20, 0, 20)
            StatusLabel.BackgroundTransparency = 1
            StatusLabel.Text = "Select targets to fling"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            StatusLabel.Font = Enum.Font.GothamSemibold
            StatusLabel.TextSize = 14
            StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
            StatusLabel.Parent = MainFrame

            local SelectionFrame = Instance.new("Frame")
            SelectionFrame.Position = UDim2.new(0, 10, 0, 80)
            SelectionFrame.Size = UDim2.new(1, -20, 0, 210)
            SelectionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SelectionFrame.BorderSizePixel = 0
            SelectionFrame.Parent = MainFrame

            local SelectionCorner = Instance.new("UICorner")
            SelectionCorner.CornerRadius = UDim.new(0, 6)
            SelectionCorner.Parent = SelectionFrame

            local PlayerScrollFrame = Instance.new("ScrollingFrame")
            PlayerScrollFrame.Position = UDim2.new(0, 5, 0, 5)
            PlayerScrollFrame.Size = UDim2.new(1, -10, 1, -10)
            PlayerScrollFrame.BackgroundTransparency = 1
            PlayerScrollFrame.BorderSizePixel = 0
            PlayerScrollFrame.ScrollBarThickness = 4
            PlayerScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
            PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
            PlayerScrollFrame.Parent = SelectionFrame

            local StartButton = Instance.new("TextButton")
            StartButton.Position = UDim2.new(0, 10, 0, 300)
            StartButton.Size = UDim2.new(0.5, -15, 0, 30)
            StartButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
            StartButton.BorderSizePixel = 0
            StartButton.Text = "START FLING"
            StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            StartButton.Font = Enum.Font.GothamBold
            StartButton.TextSize = 13
            StartButton.Parent = MainFrame

            local StartCorner = Instance.new("UICorner")
            StartCorner.CornerRadius = UDim.new(0, 6)
            StartCorner.Parent = StartButton

            local StopButton = Instance.new("TextButton")
            StopButton.Position = UDim2.new(0.5, 5, 0, 300)
            StopButton.Size = UDim2.new(0.5, -15, 0, 30)
            StopButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
            StopButton.BorderSizePixel = 0
            StopButton.Text = "STOP FLING"
            StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            StopButton.Font = Enum.Font.GothamBold
            StopButton.TextSize = 13
            StopButton.Parent = MainFrame

            local StopCorner = Instance.new("UICorner")
            StopCorner.CornerRadius = UDim.new(0, 6)
            StopCorner.Parent = StopButton

            local SelectAllButton = Instance.new("TextButton")
            SelectAllButton.Position = UDim2.new(0, 10, 0, 335)
            SelectAllButton.Size = UDim2.new(0.5, -15, 0, 25)
            SelectAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            SelectAllButton.BorderSizePixel = 0
            SelectAllButton.Text = "SELECT ALL"
            SelectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SelectAllButton.Font = Enum.Font.Gotham
            SelectAllButton.TextSize = 12
            SelectAllButton.Parent = MainFrame

            local SelectCorner = Instance.new("UICorner")
            SelectCorner.CornerRadius = UDim.new(0, 6)
            SelectCorner.Parent = SelectAllButton

            local DeselectAllButton = Instance.new("TextButton")
            DeselectAllButton.Position = UDim2.new(0.5, 5, 0, 335)
            DeselectAllButton.Size = UDim2.new(0.5, -15, 0, 25)
            DeselectAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            DeselectAllButton.BorderSizePixel = 0
            DeselectAllButton.Text = "DESELECT ALL"
            DeselectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DeselectAllButton.Font = Enum.Font.Gotham
            DeselectAllButton.TextSize = 12
            DeselectAllButton.Parent = MainFrame

            local DeselectCorner = Instance.new("UICorner")
            DeselectCorner.CornerRadius = UDim.new(0, 6)
            DeselectCorner.Parent = DeselectAllButton

            local SelectedTargets = {}
            local PlayerCheckboxes = {}
            local FlingActive = false
            getgenv().OldPos = nil
            getgenv().FPDH = workspace.FallenPartsDestroyHeight

            local function CountSelectedTargets()
                local count = 0
                for _ in pairs(SelectedTargets) do count = count + 1 end
                return count
            end

            local function UpdateStatus()
                local count = CountSelectedTargets()
                if FlingActive then
                    StatusLabel.Text = "Flinging " .. count .. " target(s) 💀"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                else
                    StatusLabel.Text = count .. " target(s) selected"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            end

            local function RefreshPlayerList()
                for _, child in ipairs(PlayerScrollFrame:GetChildren()) do
                    child:Destroy()
                end
                PlayerCheckboxes = {}
                local PlayerList = Players:GetPlayers()
                table.sort(PlayerList, function(a, b) return a.Name:lower() < b.Name:lower() end)
                local yPosition = 0
                for _, p in ipairs(PlayerList) do
                    if p ~= Player then
                        local PlayerEntry = Instance.new("Frame")
                        PlayerEntry.Size = UDim2.new(1, -5, 0, 30)
                        PlayerEntry.Position = UDim2.new(0, 0, 0, yPosition)
                        PlayerEntry.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        PlayerEntry.BorderSizePixel = 0
                        PlayerEntry.Parent = PlayerScrollFrame

                        local EntryCorner = Instance.new("UICorner")
                        EntryCorner.CornerRadius = UDim.new(0, 4)
                        EntryCorner.Parent = PlayerEntry

                        local Checkbox = Instance.new("Frame")
                        Checkbox.Size = UDim2.new(0, 18, 0, 18)
                        Checkbox.Position = UDim2.new(0, 6, 0.5, -9)
                        Checkbox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
                        Checkbox.BorderSizePixel = 0
                        Checkbox.Parent = PlayerEntry

                        local CB_Corner = Instance.new("UICorner")
                        CB_Corner.CornerRadius = UDim.new(0, 4)
                        CB_Corner.Parent = Checkbox

                        local Checkmark = Instance.new("TextLabel")
                        Checkmark.Size = UDim2.new(1, 0, 1, 0)
                        Checkmark.BackgroundTransparency = 1
                        Checkmark.Text = "✓"
                        Checkmark.TextColor3 = Color3.fromRGB(50, 255, 50)
                        Checkmark.TextSize = 14
                        Checkmark.Font = Enum.Font.GothamBold
                        Checkmark.Visible = SelectedTargets[p.Name] ~= nil
                        Checkmark.Parent = Checkbox

                        local NameLabel = Instance.new("TextLabel")
                        NameLabel.Size = UDim2.new(1, -35, 1, 0)
                        NameLabel.Position = UDim2.new(0, 32, 0, 0)
                        NameLabel.BackgroundTransparency = 1
                        NameLabel.Text = p.DisplayName .. " (@" .. p.Name .. ")"
                        NameLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
                        NameLabel.TextSize = 13
                        NameLabel.Font = Enum.Font.Gotham
                        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                        NameLabel.Parent = PlayerEntry

                        local ClickArea = Instance.new("TextButton")
                        ClickArea.Size = UDim2.new(1, 0, 1, 0)
                        ClickArea.BackgroundTransparency = 1
                        ClickArea.Text = ""
                        ClickArea.ZIndex = 2
                        ClickArea.Parent = PlayerEntry

                        ClickArea.MouseButton1Click:Connect(function()
                            if SelectedTargets[p.Name] then
                                SelectedTargets[p.Name] = nil
                                Checkmark.Visible = false
                            else
                                SelectedTargets[p.Name] = p
                                Checkmark.Visible = true
                            end
                            UpdateStatus()
                        end)
                        PlayerCheckboxes[p.Name] = { Entry = PlayerEntry, Checkmark = Checkmark }
                        yPosition = yPosition + 35
                    end
                end
                PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPosition)
            end

            local function ToggleAllPlayers(select)
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= Player then
                        local checkboxData = PlayerCheckboxes[p.Name]
                        if checkboxData then
                            if select then
                                SelectedTargets[p.Name] = p
                                checkboxData.Checkmark.Visible = true
                            else
                                SelectedTargets[p.Name] = nil
                                checkboxData.Checkmark.Visible = false
                            end
                        end
                    end
                end
                UpdateStatus()
            end

            local function Message(TitleText, Text, Time)
                pcall(function()
                    StarterGui:SetCore("SendNotification", { Title = TitleText, Text = Text, Duration = Time or 5 })
                end)
            end

            local function YadsanFling(TargetPlr)
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart
                local TCharacter = TargetPlr.Character
                if not TCharacter then return end

                local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                local TRootPart = THumanoid and THumanoid.RootPart
                local THead = TCharacter:FindFirstChild("Head")
                local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                local Handle = Accessory and Accessory:FindFirstChild("Handle")

                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then getgenv().OldPos = RootPart.CFrame end
                    if THumanoid and THumanoid.Sit then
                        return Message("GODVERSE HUB", TargetPlr.Name .. " is sitting!", 2)
                    end

                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end

                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then return end

                    local FPos = function(BasePart, Pos, Ang)
                        local targetCF = CFrame.new(BasePart.Position) * Pos * Ang
                        RootPart.CFrame = targetCF
                        if Character.PrimaryPart then
                            Character:SetPrimaryPartCFrame(targetCF)
                        end
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
                        repeat
                            if RootPart and THumanoid and BasePart and BasePart.Parent then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                else
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until Time + TimeToWait < tick() or not FlingActive
                    end

                    pcall(function() workspace.FallenPartsDestroyHeight = 0/0 end)
                    local BV = Instance.new("BodyVelocity")
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(0, 0, 0)
                    BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRootPart then
                        SFBasePart(TRootPart)
                    elseif THead then
                        SFBasePart(THead)
                    elseif Handle then
                        SFBasePart(Handle)
                    else
                        BV:Destroy()
                        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                        return Message("GODVERSE HUB", TargetPlr.Name .. " has no valid parts", 2)
                    end

                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = Humanoid

                    if getgenv().OldPos then
                        local attempts = 0
                        repeat
                            attempts = attempts + 1
                            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                            if Character.PrimaryPart then
                                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                            end
                            Humanoid:ChangeState("GettingUp")
                            for _, part in ipairs(Character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.Velocity, part.RotVelocity = Vector3.new(), Vector3.new()
                                end
                            end
                            task.wait()
                        until (RootPart.Position - getgenv().OldPos.Position).Magnitude < 25 or attempts > 60
                        pcall(function() workspace.FallenPartsDestroyHeight = getgenv().FPDH end)
                    end
                else
                    return Message("GODVERSE HUB", "Your character is not ready", 2)
                end
            end

            local function StartFling()
                if FlingActive then return end
                local count = CountSelectedTargets()
                if count == 0 then
                    StatusLabel.Text = "No targets selected!"
                    task.wait(1)
                    StatusLabel.Text = "Select targets to fling"
                    return
                end
                FlingActive = true
                UpdateStatus()
                Message("GODVERSE HUB", "Flinging " .. count .. " targets 💀", 2)

                task.spawn(function()
                    while FlingActive do
                        local validTargets = {}
                        for name, p in pairs(SelectedTargets) do
                            if p and p.Parent then
                                validTargets[name] = p
                            else
                                SelectedTargets[name] = nil
                                local checkbox = PlayerCheckboxes[name]
                                if checkbox then checkbox.Checkmark.Visible = false end
                            end
                        end
                        for _, p in pairs(validTargets) do
                            if FlingActive then
                                pcall(function() YadsanFling(p) end)
                                task.wait(0.1)
                            else
                                break
                            end
                        end
                        UpdateStatus()
                        task.wait(0.5)
                    end
                end)
            end

            local function StopFling()
                if not FlingActive then return end
                FlingActive = false
                UpdateStatus()
                Message("GODVERSE HUB", "Multi-Fling Stopped.", 2)
            end

            StartButton.MouseButton1Click:Connect(StartFling)
            StopButton.MouseButton1Click:Connect(StopFling)
            SelectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(true) end)
            DeselectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(false) end)

            MinimizeButton.MouseButton1Click:Connect(function()
                MainFrame.Visible = false
                MinFrame.Position = UDim2.new(0, MainFrame.AbsolutePosition.X, 0, MainFrame.AbsolutePosition.Y)
                MinFrame.Visible = true
            end)

            OpenButton.MouseButton1Click:Connect(function()
                MinFrame.Visible = false
                MainFrame.Position = UDim2.new(0, MinFrame.AbsolutePosition.X, 0, MinFrame.AbsolutePosition.Y)
                MainFrame.Visible = true
            end)

            local playerAddedConn = Players.PlayerAdded:Connect(RefreshPlayerList)
            local playerRemovingConn = Players.PlayerRemoving:Connect(function(p)
                if SelectedTargets[p.Name] then SelectedTargets[p.Name] = nil end
                RefreshPlayerList()
                UpdateStatus()
            end)

            CloseButton.MouseButton1Click:Connect(function()
                FlingActive = false
                if playerAddedConn then playerAddedConn:Disconnect() end
                if playerRemovingConn then playerRemovingConn:Disconnect() end
                if minInputChangedConn then minInputChangedConn:Disconnect() end
                if minInputEndedConn then minInputEndedConn:Disconnect() end
                ScreenGui:Destroy()
            end)

            RefreshPlayerList()
            UpdateStatus()
            Message("CELESTIAL GODVERSE HUB UV1 🌐", "YADSAN MULTI-FLING GUI LOADED! 💀", 4)
        end)
    end,
})

TrollTab:Input({
    Title = "TARGET NAME",
    Desc = "Enter player name",
    Placeholder = "Username...",
    Callback = function(value)
        TargetPlayer = GetPlayer(value)
        if TargetPlayer then
            Notify("TARGET LOCKED", "Target: " .. TargetPlayer.DisplayName .. " (@" .. TargetPlayer.Name .. ")", 2)
        elseif value ~= "" then
            Notify("TARGET NOT FOUND", "No player matching: " .. value, 2)
        end
    end,
})

TrollTab:Input({
    Title = "SPEED",
    Desc = "Default: 1",
    Placeholder = "1",
    Callback = function(value)
        BangSpeed = tonumber(value) or 1
    end,
})

TrollTab:Button({
    Title = "GOTO TARGET",
    Desc = "Teleport to target player",
    Callback = function()
        if not HasValidTarget() then return end
        local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if myHrp then
            myHrp.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
        end
    end,
})

TrollTab:Toggle({
    Title = "VIEW TARGET",
    Desc = "Toggle target view",
    Value = false,
    Callback = function(value)
        if value then
            if HasValidTarget() and TargetPlayer.Character:FindFirstChildOfClass("Humanoid") then
                workspace.CurrentCamera.CameraSubject = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
        else
            local myHum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if myHum then
                workspace.CurrentCamera.CameraSubject = myHum
            end
        end
    end,
})

TrollTab:Toggle({
    Title = "BANG",
    Desc = "Toggle",
    Value = false,
    Callback = function(value)
        Toggles.Bang = value
        if value and not HasValidTarget() then return end

        task.spawn(function()
            while Toggles.Bang and task.wait() do
                pcall(function()
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TargetPlayer.Character.HumanoidRootPart.CFrame *
                            CFrame.new(
                                0,
                                0,
                                1.1 + math.sin(tick() * (BangSpeed * 20)) * 0.8
                            )
                    end
                end)
            end
        end)
    end,
})

TrollTab:Toggle({
    Title = "MOUTH BANG",
    Value = false,
    Callback = function(value)
        Toggles.MouthBang = value
        if value and not HasValidTarget() then return end

        task.spawn(function()
            while Toggles.MouthBang and task.wait() do
                pcall(function()
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TargetPlayer.Character.Head.CFrame *
                            CFrame.new(
                                0,
                                0.2,
                                -1.2 - math.sin(tick() * (BangSpeed * 20)) * 0.8
                            ) *
                            CFrame.Angles(0, math.pi, 0)
                    end
                end)
            end
        end)
    end,
})

TrollTab:Toggle({
    Title = "HEADSIT",
    Value = false,
    Callback = function(value)
        Toggles.Headsit = value
        if value and not HasValidTarget() then return end

        task.spawn(function()
            while Toggles.Headsit and task.wait() do
                pcall(function()
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TargetPlayer.Character.Head.CFrame *
                            CFrame.new(
                                0,
                                0.5 + math.sin(tick() * (BangSpeed * 20)) * 0.5,
                                0
                            )
                    end
                end)
            end
        end)
    end,
})

TrollTab:Toggle({
    Title = "FRONTHEADSIT",
    Value = false,
    Callback = function(value)
        Toggles.FrontHeadsit = value
        if value and not HasValidTarget() then return end

        task.spawn(function()
            while Toggles.FrontHeadsit and task.wait() do
                pcall(function()
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TargetPlayer.Character.Head.CFrame *
                            CFrame.new(
                                0,
                                0.4,
                                -0.2 - math.sin(tick() * (BangSpeed * 25)) * 0.5
                            ) *
                            CFrame.Angles(0, math.pi, 0)
                    end
                end)
            end
        end)
    end,
})

TrollTab:Toggle({
    Title = "ORBIT",
    Value = false,
    Callback = function(value)
        Toggles.Orbit = value
        if value and not HasValidTarget() then return end

        task.spawn(function()
            local angle = 0
            while Toggles.Orbit and task.wait() do
                pcall(function()
                    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + (0.2 * BangSpeed)
                        LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TargetPlayer.Character.HumanoidRootPart.CFrame *
                            CFrame.Angles(0, angle, 0) *
                            CFrame.new(0, 0, 5)
                    end
                end)
            end
        end)
    end,
})

--// WALKING FLING (FIXED NON-STACKING PHYSICS)
TrollTab:Toggle({
    Title = "WALKING FLING",
    Value = false,
    Callback = function(value)
        Toggles.WalkingFling = value

        if WalkingFlingConnection then
            WalkingFlingConnection:Disconnect()
            WalkingFlingConnection = nil
        end

        if value then
            local busy = false
            WalkingFlingConnection = RunService.Heartbeat:Connect(function()
                if busy or not Toggles.WalkingFling then return end
                busy = true
                pcall(function()
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            for _, part in ipairs(player.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end

                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local strength = 100000
                        local oldV = hrp.Velocity
                        hrp.Velocity = Vector3.new(strength, strength, strength)

                        for _, v in ipairs(char:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end

                        RunService.RenderStepped:Wait()
                        if hrp and hrp.Parent then
                            hrp.Velocity = oldV
                        end
                    end
                end)
                busy = false
            end)
        end
    end,
})

--// DEFENCE TAB
local DefenceTab = Window:Tab({
    Title = "DEFENCE ⚔️",
    Icon = "shield",
})

--// SAFE SPOT (FIXED CONNECTION CLEANUP)
local SafeSpotGui = nil
local SafeSpotBaseplate = nil
local SafeSpotDragConn = nil
local teleported = false
local originalPosition = nil

DefenceTab:Toggle({
    Title = "Safe Spot",
    Value = false,
    Callback = function(value)
        if value then
            if SafeSpotGui then SafeSpotGui:Destroy() end
            if SafeSpotBaseplate then SafeSpotBaseplate:Destroy() end
            if SafeSpotDragConn then SafeSpotDragConn:Disconnect() end

            local teleportPosition = Vector3.new(5000, 1000, 5000)
            local baseplateSize = Vector3.new(100, 1, 100)
            local baseplatePosition = teleportPosition - Vector3.new(0, 5, 0)

            SafeSpotBaseplate = Instance.new("Part")
            SafeSpotBaseplate.Name = "CelestialSafeSpotPlate"
            SafeSpotBaseplate.Size = baseplateSize
            SafeSpotBaseplate.Position = baseplatePosition
            SafeSpotBaseplate.Anchored = true
            SafeSpotBaseplate.BrickColor = BrickColor.new("Earth green")
            SafeSpotBaseplate.Parent = workspace

            local playerGui = LocalPlayer:WaitForChild("PlayerGui")
            SafeSpotGui = Instance.new("ScreenGui")
            SafeSpotGui.Name = "TeleportGui"
            SafeSpotGui.ResetOnSpawn = false
            SafeSpotGui.Parent = playerGui

            local teleportButton = Instance.new("TextButton")
            teleportButton.Size = UDim2.new(0, 50, 0, 50)
            teleportButton.Position = UDim2.new(0, 150, 0, 10)
            teleportButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            teleportButton.Text = "TP"
            teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            teleportButton.Font = Enum.Font.GothamBold
            teleportButton.TextSize = 20
            teleportButton.Parent = SafeSpotGui

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = teleportButton

            local dragging, dragInput, dragStart, startPos

            teleportButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = teleportButton.Position

                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)

            teleportButton.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    dragInput = input
                end
            end)

            SafeSpotDragConn = UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    local delta = input.Position - dragStart
                    teleportButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)

            teleportButton.MouseButton1Click:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = LocalPlayer.Character.HumanoidRootPart

                    if not teleported then
                        originalPosition = humanoidRootPart.Position
                        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
                        teleported = true
                        teleportButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        teleportButton.Text = "BACK"
                    else
                        if originalPosition then
                            humanoidRootPart.CFrame = CFrame.new(originalPosition)
                        end
                        teleported = false
                        teleportButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                        teleportButton.Text = "TP"
                    end
                end
            end)
        else
            if SafeSpotDragConn then
                SafeSpotDragConn:Disconnect()
                SafeSpotDragConn = nil
            end
            if SafeSpotGui then
                SafeSpotGui:Destroy()
                SafeSpotGui = nil
            end
            if SafeSpotBaseplate then
                SafeSpotBaseplate:Destroy()
                SafeSpotBaseplate = nil
            end

            if teleported and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if originalPosition then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
                end
                teleported = false
            end
        end
    end,
})

DefenceTab:Toggle({
    Title = "Anti Void",
    Value = false,
    Callback = function(value)
        Toggles.AntiVoid = value

        task.spawn(function()
            while Toggles.AntiVoid do
                task.wait()
                pcall(function()
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and hrp.Position.Y < -15 then
                        hrp.Velocity = Vector3.new(0, 0, 0)
                        hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z)
                    end
                end)
            end
        end)
    end,
})

--// ANTI BANG V1
DefenceTab:Toggle({
    Title = "Anti Bang V1",
    Value = false,
    Callback = function(value)
        Toggles.AntiBangV1 = value

        task.spawn(function()
            while Toggles.AntiBangV1 do
                task.wait(0.1)
                pcall(function()
                    local char = LocalPlayer.Character
                    local myHrp = char and char:FindFirstChild("HumanoidRootPart")

                    if myHrp then
                        for _, otherPlayer in ipairs(Players:GetPlayers()) do
                            if otherPlayer ~= LocalPlayer and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local myPos = myHrp.Position
                                local otherPos = otherPlayer.Character.HumanoidRootPart.Position
                                local dist = (myPos - otherPos).Magnitude

                                if dist < 3.5 and dist > 0.001 then
                                    local moveDirection = (myPos - otherPos).Unit
                                    myHrp.CFrame = myHrp.CFrame + Vector3.new(moveDirection.X * 20, 0, moveDirection.Z * 20)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end,
})

--// ANTI BANG V2 (FIXED NO-FREEZE LOOP & X/Z MOVEMENT PRESERVED)
DefenceTab:Toggle({
    Title = "Anti Bang V2 (TP)",
    Value = false,
    Callback = function(value)
        Toggles.AntiBangV2 = value

        task.spawn(function()
            while Toggles.AntiBangV2 do
                task.wait(0.1)
                pcall(function()
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end

                    local baseY = hrp.Position.Y
                    local rot = hrp.CFrame - hrp.CFrame.Position

                    hrp.CFrame = CFrame.new(hrp.Position.X, baseY + 1000, hrp.Position.Z) * rot
                    task.wait(0.1)
                    if not Toggles.AntiBangV2 or not hrp.Parent then return end

                    hrp.CFrame = CFrame.new(hrp.Position.X, baseY, hrp.Position.Z) * rot
                    task.wait(0.1)
                    if not Toggles.AntiBangV2 or not hrp.Parent then return end

                    hrp.CFrame = CFrame.new(hrp.Position.X, baseY - 1000, hrp.Position.Z) * rot
                    task.wait(0.1)
                    if not Toggles.AntiBangV2 or not hrp.Parent then return end

                    hrp.CFrame = CFrame.new(hrp.Position.X, baseY, hrp.Position.Z) * rot
                end)
            end
        end)
    end,
})

--// ANTI FLING
DefenceTab:Toggle({
    Title = "Anti Fling",
    Value = false,
    Callback = function(value)
        Toggles.AntiFling = value

        if AntiFlingConnection then
            AntiFlingConnection:Disconnect()
            AntiFlingConnection = nil
        end

        if value then
            AntiFlingConnection = RunService.Stepped:Connect(function()
                pcall(function()
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                            if hrp and not hrp.Anchored then
                                hrp.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                                hrp.CanCollide = false

                                if hrp.Velocity.Magnitude > 100 or hrp.RotVelocity.Magnitude > 100 then
                                    hrp.Velocity = Vector3.new(0, 0, 0)
                                    hrp.RotVelocity = Vector3.new(0, 0, 0)
                                end
                            end
                        end
                    end
                end)
            end)
        end
    end,
})

--// ANTI SIT
DefenceTab:Toggle({
    Title = "Anti Sit",
    Value = false,
    Callback = function(value)
        Toggles.AntiSit = value

        task.spawn(function()
            while Toggles.AntiSit do
                task.wait()
                pcall(function()
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Sit then
                        hum.Jump = true
                    end
                end)
            end
        end)
    end,
})

--// SPAM TAB
local SpamTab = Window:Tab({
    Title = "SPAM 🥵",
    Icon = "message-square",
})

SpamTab:Button({
    Title = "YADSAN EDITION SPAM 👑",
    Desc = "Click to execute the ultimate VIP Spammer!",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/yadsanpapa/Yadsan-/refs/heads/main/Yadsan_Spammer_OV1"), true))()
    end,
})

SpamTab:Button({
    Title = "ZERO MERCY SPAMMER V1 🏴",
    Desc = "Click to execute Zm Spammer ShafiXZenex!",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/yadsanpapa/Yadsan-/refs/heads/main/Zm_Spammerv1byshafi.lua"), true))()
    end,
})

SpamTab:Button({
    Title = "ASUKA SPAMMER RED 🚩",
    Desc = "Click to execute Asuka Team Powerful!",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/yadsanpapa/Yadsan-/refs/heads/main/AsukaSpammerByYadsan.lua"), true))()
    end,
})

--// LIFE TOGETHER RP TAB
local LifeTogetherTab = Window:Tab({
    Title = "LIFE TOGETHER RP 🏠",
    Icon = "shirt",
})

LifeTogetherTab:Button({
    Title = "YADSAN OUTFIT COPIER 🤓",
    Desc = "Click to open the outfit copier GUI",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/yadsanpapa/Yadsan-/refs/heads/main/Yadsan_Outfit_Copier_OV1"), true))()
    end,
})

LifeTogetherTab:Button({
    Title = "CELESTIAL GEN X 💢",
    Desc = "Click to open the Celestial Gen X",
    Callback = function()
        loadstring(game:HttpGet(("https://scriptblox.com/raw/LifeTogether-RP-Gen-X-Hub-236184"), true))()
    end,
})

LifeTogetherTab:Button({
    Title = "CELESTIAL CRYPTIC HUB 🗿",
    Desc = "Click to open the Ultimate Troll Aura",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/OnlyCryptic/Cryptic/main/main.lua"), true))()
    end,
})

--// OTHER TAB
local OtherTab = Window:Tab({
    Title = "OTHER 📁",
    Icon = "folder",
})

OtherTab:Toggle({
    Title = "FLY WALK",
    Value = false,
    Callback = function(value)
        Toggles.FlyWalk = value

        if value then
            task.spawn(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if not hrp or not humanoid then return end

                local bg = Instance.new("BodyGyro")
                bg.P = 9e4
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.CFrame = hrp.CFrame
                bg.Parent = hrp

                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(0, 0.1, 0)
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Parent = hrp

                while Toggles.FlyWalk and hrp and hrp.Parent and humanoid and humanoid.Parent do
                    task.wait()
                    pcall(function()
                        humanoid.PlatformStand = true
                        local cam = workspace.CurrentCamera.CFrame
                        local moveDir = humanoid.MoveDirection
                        if moveDir.Magnitude > 0 then
                            bv.Velocity = cam.LookVector * (humanoid.WalkSpeed * 2)
                        else
                            bv.Velocity = Vector3.new(0, 0.1, 0)
                        end
                        bg.CFrame = cam
                    end)
                end

                if bg and bg.Parent then bg:Destroy() end
                if bv and bv.Parent then bv:Destroy() end
                if humanoid and humanoid.Parent then
                    humanoid.PlatformStand = false
                end
            end)
        end
    end,
})

OtherTab:Toggle({
    Title = "SPEED 🚄",
    Value = false,
    Callback = function(value)
        Toggles.Speed = value

        if SpeedCharConnection then
            SpeedCharConnection:Disconnect()
            SpeedCharConnection = nil
        end

        local function applySpeed(char)
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = Toggles.Speed and 300 or 16
            end
        end

        applySpeed(LocalPlayer.Character)

        if value then
            SpeedCharConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
                task.wait(0.2)
                if Toggles.Speed then
                    applySpeed(newChar)
                end
            end)
        end
    end,
})

OtherTab:Toggle({
    Title = "INFINITE JUMP 🦘",
    Value = false,
    Callback = function(value)
        Toggles.InfJump = value
        _G.InfJump = value

        if InfJumpConnection then
            InfJumpConnection:Disconnect()
            InfJumpConnection = nil
        end

        if value then
            InfJumpConnection = UserInputService.JumpRequest:Connect(function()
                if Toggles.InfJump then
                    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        end
    end,
})

OtherTab:Toggle({
    Title = "NOCLIP",
    Value = false,
    Callback = function(value)
        Toggles.Noclip = value

        if NoclipConnection then
            NoclipConnection:Disconnect()
            NoclipConnection = nil
        end

        if value then
            NoclipConnection = RunService.Stepped:Connect(function()
                if Toggles.Noclip and LocalPlayer.Character then
                    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})

OtherTab:Button({
    Title = "INFINITE YIELD",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

OtherTab:Button({
    Title = "FE R15 SONIC THE HEDGEHOG",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FE-R15-Sonic-The-Hedgehog-63923"))()
    end,
})

OtherTab:Button({
    Title = "FE SKY GLITCHER ",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-sky-destroyer-V2-AXEZZ-110640"))()
    end,
})

OtherTab:Button({
    Title = "EMOTES",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gaze-emote-74592"))()
    end,
})

OtherTab:Button({
    Title = "REJOIN",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

OtherTab:Button({
    Title = "SERVER HOP",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/m888X7p3"))()
    end,
})

--// NOTIFICATION & AUTO CHAT MESSAGE
WindUI:Notify({
    Title = "CELESTIAL GODVERSE HUB UV1",
    Content = "YADSAN HUB LOADED!",
    Duration = 5,
})

task.spawn(function()
    local chatMsg = "------------//// CELESTIAL GODVERSE HUB UV1 🤩 LOADED Made by Yadsan_Godverse (ZERO MERCY X CELESTIAL X ASUKA ON TOP 🔥) ////-----------------"
    pcall(function()
        local tcs = game:GetService("TextChatService")
        if tcs.ChatVersion == Enum.ChatVersion.TextChatService then
            local general = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if general then
                general:SendAsync(chatMsg)
            end
        else
            local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                chatEvents.SayMessageRequest:FireServer(chatMsg, "All")
            end
        end
    end)
end)
