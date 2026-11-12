local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("DEMONPAPA") then
	CoreGui.DEMONPAPA:Destroy()
end

local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "DEMONPAPA"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.ResetOnSpawn = false
_G.CustomName = LocalPlayer.DisplayName:upper()

local function func(arg1, arg2)
	if #arg1 <= arg2 then
		return arg1
	end

	local tbl = {}
	local num = 1

	while num <= #arg1 do
		local v1 = arg1:sub(num, num)
		if v1 == "_" or v1 == "-" or v1 == "@" then
			local v2 = num

			while v2 <= #arg1 and arg1:sub(v2, v2) == v1 do
				v2 = v2 + 1
			end

			table.insert(tbl, {start = num, finish = v2 - 1, char = v1})
			num = v2
		else
			num = num + 1
		end
	end

	local v3 = #arg1 - arg2

	for i = #tbl, 1, -1 do
		if v3 <= 0 then
			break
		end

		local v4 = tbl[i]
		local v5 = v4.finish - v4.start + 1

		if v5 > 1 then
			local v6 = math.min(v5 - 1, v3)
			v4.newLen = v5 - v6
			v3 = v3 - v6
		else
			v4.newLen = 1
		end
	end

	if v3 <= 0 then
		local str = ""
		local num1 = 1

		for _, v7 in ipairs(tbl) do
			str = (str .. arg1:sub(num1, v7.start - 1)) .. string.rep(v7.char, v7.newLen or v7.finish - v7.start + 1)
			num1 = v7.finish + 1
		end

		local v8 = str .. arg1:sub(num1)

		if #v8 <= arg2 then
			return v8
		end
	end

	local v9 = arg2
	local num2 = tonumber(arg2)

	for i1 = num2, 1, -1 do
		if arg1:sub(i1, i1) == " " then
			v9 = num2
			break
		end
	end

	return arg1:sub(1, v9)
end

local function func1(arg1)
	local v1 = arg1:gsub("[Ll][Aa][Kk][Ss][Hh][Yy]", _G.CustomName)
	return func(v1, 190)
end

local tbl = {
	{
		name = "Cyber Blue",
		mainBg = Color3.fromRGB(10, 15, 30),
		accent = Color3.fromRGB(0, 170, 255),
		secondary = Color3.fromRGB(0, 100, 200),
		text = Color3.fromRGB(180, 220, 255),
		buttonBg = Color3.fromRGB(20, 30, 50),
		gradient1 = Color3.fromRGB(0, 170, 255),
		gradient2 = Color3.fromRGB(0, 80, 180),
	},
	{
		name = "Demon Purple",
		mainBg = Color3.fromRGB(20, 10, 30),
		accent = Color3.fromRGB(170, 0, 255),
		secondary = Color3.fromRGB(100, 0, 180),
		text = Color3.fromRGB(220, 180, 255),
		buttonBg = Color3.fromRGB(35, 20, 50),
		gradient1 = Color3.fromRGB(170, 0, 255),
		gradient2 = Color3.fromRGB(80, 0, 160),
	},
	{
		name = "Blood Red",
		mainBg = Color3.fromRGB(25, 8, 8),
		accent = Color3.fromRGB(255, 40, 40),
		secondary = Color3.fromRGB(180, 20, 20),
		text = Color3.fromRGB(255, 180, 180),
		buttonBg = Color3.fromRGB(40, 15, 15),
		gradient1 = Color3.fromRGB(255, 40, 40),
		gradient2 = Color3.fromRGB(150, 0, 0),
	},
	{
		name = "Toxic Green",
		mainBg = Color3.fromRGB(8, 20, 10),
		accent = Color3.fromRGB(0, 255, 100),
		secondary = Color3.fromRGB(0, 160, 60),
		text = Color3.fromRGB(180, 255, 200),
		buttonBg = Color3.fromRGB(15, 35, 20),
		gradient1 = Color3.fromRGB(0, 255, 100),
		gradient2 = Color3.fromRGB(0, 140, 50),
	},
	{
		name = "Gold Royal",
		mainBg = Color3.fromRGB(20, 15, 5),
		accent = Color3.fromRGB(255, 200, 50),
		secondary = Color3.fromRGB(200, 140, 20),
		text = Color3.fromRGB(255, 230, 150),
		buttonBg = Color3.fromRGB(35, 28, 10),
		gradient1 = Color3.fromRGB(255, 200, 50),
		gradient2 = Color3.fromRGB(180, 120, 0),
	},
	{
		name = "Ice White",
		mainBg = Color3.fromRGB(15, 18, 25),
		accent = Color3.fromRGB(180, 220, 255),
		secondary = Color3.fromRGB(100, 150, 220),
		text = Color3.fromRGB(220, 240, 255),
		buttonBg = Color3.fromRGB(25, 30, 40),
		gradient1 = Color3.fromRGB(180, 220, 255),
		gradient2 = Color3.fromRGB(80, 120, 200),
	},
	{
		name = "Neon Pink",
		mainBg = Color3.fromRGB(25, 8, 20),
		accent = Color3.fromRGB(255, 50, 180),
		secondary = Color3.fromRGB(180, 20, 120),
		text = Color3.fromRGB(255, 180, 230),
		buttonBg = Color3.fromRGB(40, 15, 30),
		gradient1 = Color3.fromRGB(255, 50, 180),
		gradient2 = Color3.fromRGB(160, 0, 100),
	},
	{
		name = "Midnight Black",
		mainBg = Color3.fromRGB(8, 8, 12),
		accent = Color3.fromRGB(120, 120, 255),
		secondary = Color3.fromRGB(60, 60, 140),
		text = Color3.fromRGB(200, 200, 255),
		buttonBg = Color3.fromRGB(18, 18, 28),
		gradient1 = Color3.fromRGB(100, 100, 255),
		gradient2 = Color3.fromRGB(40, 40, 120),
	},
	{
		name = "Sunset Orange",
		mainBg = Color3.fromRGB(25, 12, 5),
		accent = Color3.fromRGB(255, 120, 30),
		secondary = Color3.fromRGB(200, 80, 10),
		text = Color3.fromRGB(255, 210, 160),
		buttonBg = Color3.fromRGB(40, 20, 10),
		gradient1 = Color3.fromRGB(255, 140, 40),
		gradient2 = Color3.fromRGB(180, 60, 0),
	},
	{
		name = "Electric Lime",
		mainBg = Color3.fromRGB(10, 20, 5),
		accent = Color3.fromRGB(180, 255, 0),
		secondary = Color3.fromRGB(100, 180, 0),
		text = Color3.fromRGB(220, 255, 150),
		buttonBg = Color3.fromRGB(20, 35, 10),
		gradient1 = Color3.fromRGB(180, 255, 0),
		gradient2 = Color3.fromRGB(80, 160, 0),
	},
	{
		name = "Crimson Night",
		mainBg = Color3.fromRGB(18, 5, 10),
		accent = Color3.fromRGB(255, 20, 80),
		secondary = Color3.fromRGB(160, 10, 50),
		text = Color3.fromRGB(255, 160, 190),
		buttonBg = Color3.fromRGB(30, 10, 18),
		gradient1 = Color3.fromRGB(255, 30, 90),
		gradient2 = Color3.fromRGB(140, 0, 40),
	},
	{
		name = "Aqua Cyan",
		mainBg = Color3.fromRGB(5, 18, 22),
		accent = Color3.fromRGB(0, 230, 255),
		secondary = Color3.fromRGB(0, 150, 180),
		text = Color3.fromRGB(160, 240, 255),
		buttonBg = Color3.fromRGB(10, 30, 35),
		gradient1 = Color3.fromRGB(0, 220, 255),
		gradient2 = Color3.fromRGB(0, 120, 160),
	},
	{
		name = "Violet Storm",
		mainBg = Color3.fromRGB(15, 8, 25),
		accent = Color3.fromRGB(200, 80, 255),
		secondary = Color3.fromRGB(130, 40, 180),
		text = Color3.fromRGB(230, 180, 255),
		buttonBg = Color3.fromRGB(28, 15, 40),
		gradient1 = Color3.fromRGB(190, 70, 255),
		gradient2 = Color3.fromRGB(100, 20, 160),
	},
	{
		name = "Emerald Forest",
		mainBg = Color3.fromRGB(5, 18, 12),
		accent = Color3.fromRGB(0, 220, 140),
		secondary = Color3.fromRGB(0, 140, 90),
		text = Color3.fromRGB(160, 255, 210),
		buttonBg = Color3.fromRGB(12, 30, 20),
		gradient1 = Color3.fromRGB(0, 210, 130),
		gradient2 = Color3.fromRGB(0, 120, 70),
	},
	{
		name = "Rose Gold",
		mainBg = Color3.fromRGB(22, 12, 15),
		accent = Color3.fromRGB(255, 140, 170),
		secondary = Color3.fromRGB(200, 90, 120),
		text = Color3.fromRGB(255, 200, 215),
		buttonBg = Color3.fromRGB(35, 20, 25),
		gradient1 = Color3.fromRGB(255, 150, 180),
		gradient2 = Color3.fromRGB(180, 70, 110),
	},
	{
		name = "Magma",
		mainBg = Color3.fromRGB(22, 8, 5),
		accent = Color3.fromRGB(255, 80, 20),
		secondary = Color3.fromRGB(200, 40, 0),
		text = Color3.fromRGB(255, 190, 140),
		buttonBg = Color3.fromRGB(38, 15, 10),
		gradient1 = Color3.fromRGB(255, 90, 30),
		gradient2 = Color3.fromRGB(160, 30, 0),
	},
	{
		name = "Shadow Gray",
		mainBg = Color3.fromRGB(12, 12, 15),
		accent = Color3.fromRGB(180, 180, 200),
		secondary = Color3.fromRGB(100, 100, 120),
		text = Color3.fromRGB(220, 220, 235),
		buttonBg = Color3.fromRGB(25, 25, 30),
		gradient1 = Color3.fromRGB(160, 160, 190),
		gradient2 = Color3.fromRGB(70, 70, 90),
	},
}

local tbl1 = {
	"🔮",
	"💀",
	"👑",
	"🔥",
	"⚡",
	"😈",
	"💎",
	"🌟",
	"🩸",
	"☠️",
	"🖤",
	"🤍",
	"🚀",
	"💥",
	"🧿",
	"🕷",
	"🌙",
	"⭐",
	"🔱",
	"🎭",
}

local random = Random.new(tick() + LocalPlayer.UserId)
local v1 = tbl[random:NextInteger(1, #tbl)]
local v2 = tbl1[random:NextInteger(1, #tbl1)]
local textLabel = Instance.new("TextLabel", screenGui)
textLabel.Size = UDim2.new(0.95, 0, 0, 50)
textLabel.Position = UDim2.new(0.025, 0, 0, 8)
textLabel.BackgroundTransparency = 1
textLabel.Text = ""
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.TextStrokeTransparency = 0.3
textLabel.TextStrokeColor3 = v1.accent
textLabel.TextWrapped = true
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.ZIndex = 1000
local uIStroke = Instance.new("UIStroke", textLabel)
uIStroke.Thickness = 1
uIStroke.Color = v1.accent
local flag = true

spawn(function()
	while flag and textLabel.Parent do
		uIStroke.Color = Color3.fromHSV(tick() % 3 / 3, 1, 1)
		wait(0.07)
	end
end)

local function func2(arg1, arg2, arg3)
	arg1.Text = ""
	for i = 1, #arg2 do
		arg1.Text = string.sub(arg2, 1, i)
		wait(arg3)
	end
end

spawn(function()
	wait(0.6)

	func2(
		textLabel,
		"⚠ HELLO TO ALL MY SCRIPT USERS, GUYS DON'T USE 0 DELAY BANG AND ONLY USE LESS WARNING BANG WHETHER YU ARE USING FOR ONE TARGET OR MULTI AS GAME IS UPDATED AND THERE ARE GLITCH IN 0 DELAY STICK BANG ⚠ \n NEW BANG IN BANG TAB GO AND CHECK IT OUT 💀✨ \n THANKS FOR 2.4 k VIEWS AND 11 k EXECUTIONS 💀✨ \n 🔳 MAIN ACC- Alone_12A5\n🔳 SECOND ACC- luckyhuywr",
		0.09
	)

	wait(6)
	flag = false
	local tweenInfo = TweenInfo.new(1.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	TweenService:Create(textLabel, tweenInfo, {TextTransparency = 1}):Play()
	TweenService:Create(textLabel, tweenInfo, {TextStrokeTransparency = 1}):Play()
	TweenService:Create(uIStroke, tweenInfo, {Thickness = 0}):Play()
	wait(0.2)
	textLabel:Destroy()
end)

local function func3(arg1)
	local flag
	local Position
	local Position1

	arg1.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag, Position, Position1 = true, input.Position, arg1.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag = false
				end
			end)
		end
	end)

	arg1.InputChanged:Connect(function(input)
		if flag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local v1 = input.Position - Position
			arg1.Position = UDim2.new(Position1.X.Scale, Position1.X.Offset + v1.X, Position1.Y.Scale, Position1.Y.Offset + v1.Y)
		end
	end)
end

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 430, 0, 370)
frame.Position = UDim2.new(0.5, -215, 0.5, -185)
frame.BackgroundColor3 = v1.mainBg
frame.BackgroundTransparency = 0.4
frame.Visible = true
frame.Active = true
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 20)
func3(frame)
local uIGradient = Instance.new("UIGradient", frame)

uIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, v1.gradient1),
	ColorSequenceKeypoint.new(0.5, v1.gradient2),
	ColorSequenceKeypoint.new(1, v1.gradient1),
})

spawn(function()
	while wait() do
		uIGradient.Offset = Vector2.new(tick() % 5 / 5, 0)
	end
end)

local uIStroke1 = Instance.new("UIStroke", frame)

spawn(function()
	while wait() do
		uIStroke1.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
		uIStroke1.Thickness = 2 + math.sin(tick() * 3)
	end
end)

local scrollingFrame = Instance.new("ScrollingFrame", frame)
scrollingFrame.Size = UDim2.new(0, 110, 1, -20)
scrollingFrame.Position = UDim2.new(0, 25, 0, 10)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 0
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ClipsDescendants = true
Instance.new("UICorner", scrollingFrame)
Instance.new("UIListLayout", scrollingFrame).Padding = UDim.new(0, 6)
local frame1 = Instance.new("Frame", frame)
frame1.Size = UDim2.new(1, -145, 1, -20)
frame1.Position = UDim2.new(0, 145, 0, 10)
frame1.BackgroundTransparency = 1

local function func4()
	local scrollingFrame = Instance.new("ScrollingFrame", frame1)
	scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 2.5, 0)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.Visible = false
	Instance.new("UIListLayout", scrollingFrame).Padding = UDim.new(0, 6)
	return scrollingFrame
end

local v3 = func4()
local v4 = func4()
local v5 = func4()
local v6 = func4()
local v7 = func4()
local v8 = func4()
local v9 = func4()
local v10 = func4()
local v11 = func4()

local function func5(arg1)
	Instance.new("UICorner", arg1)
	local uIStroke = Instance.new("UIStroke", arg1)
	uIStroke.Color = v1.accent
	uIStroke.Thickness = 1.2
	arg1.BackgroundColor3 = v1.buttonBg
	arg1.TextColor3 = v1.accent

	arg1.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(0.15)
		TweenService:Create(arg1, tweenInfo, {
			BackgroundColor3 = Color3.new(
				math.min(v1.buttonBg.R + 0.1, 1),
				math.min(v1.buttonBg.G + 0.1, 1),
				math.min(v1.buttonBg.B + 0.1, 1)
			),
		}):Play()
	end)

	arg1.MouseLeave:Connect(function()
		TweenService:Create(arg1, TweenInfo.new(0.15), {BackgroundColor3 = v1.buttonBg}):Play()
	end)
end

local function func6(arg1)
	Instance.new("UICorner", arg1)
	local uIStroke = Instance.new("UIStroke", arg1)
	uIStroke.Color = v1.accent
	uIStroke.Thickness = 0.8
	arg1.BackgroundColor3 = v1.buttonBg
	arg1.TextColor3 = v1.text

	arg1.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(0.15)
		TweenService:Create(arg1, tweenInfo, {
			BackgroundColor3 = Color3.new(
				math.min(v1.buttonBg.R + 0.12, 1),
				math.min(v1.buttonBg.G + 0.12, 1),
				math.min(v1.buttonBg.B + 0.12, 1)
			),
		}):Play()
	end)

	arg1.MouseLeave:Connect(function()
		TweenService:Create(arg1, TweenInfo.new(0.15), {BackgroundColor3 = v1.buttonBg}):Play()
	end)
end

local function func7(text, arg2)
	local textButton = Instance.new("TextButton", scrollingFrame)
	textButton.Size = UDim2.new(1, -10, 0, 42)
	textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	textButton.Text = text
	textButton.TextColor3 = Color3.fromRGB(0, 200, 255)
	textButton.Font = Enum.Font.GothamSemibold
	textButton.TextSize = 13.7
	func5(textButton)

	textButton.MouseButton1Click:Connect(function()
		for _, child in pairs(frame1:GetChildren()) do
			if child:IsA("ScrollingFrame") then
				child.Visible = false
			end
		end
		arg2.Visible = true
	end)
end

local function func8(text, arg2, arg3)
	local textButton = Instance.new("TextButton", arg2)
	textButton.Size = UDim2.new(1, -10, 0, 40)
	textButton.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
	textButton.Text = text
	textButton.TextColor3 = Color3.fromRGB(200, 200, 255)
	textButton.Font = Enum.Font.GothamSemibold
	textButton.TextSize = 12.9
	func6(textButton)

	textButton.MouseButton1Click:Connect(function()
		arg3(textButton)
	end)
end

func7("TROLL ⚔", v3)
func7("SPAMMER-1 💫", v4)
func7("SPAMMER-2 💢", v5)
func7("BANG 🔥", v6)
func7("OTHER ☣", v7)
func7("SHIELD 🤖", v8)
func7("FAKEOUT 🌌", v9)
func7("MUSIC 🎶", v10)
func7("CREDITS 🍂", v11)
v3.Visible = true

local function func9(text, arg2, arg3)
	local textButton = Instance.new("TextButton", arg2)
	textButton.Size = UDim2.new(1, -10, 0, 52)
	textButton.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
	textButton.Text = text
	textButton.TextColor3 = Color3.fromRGB(200, 200, 255)
	textButton.Font = Enum.Font.GothamSemibold
	textButton.TextSize = 12.5
	textButton.TextWrapped = true
	textButton.TextYAlignment = Enum.TextYAlignment.Center
	func6(textButton)

	textButton.MouseButton1Click:Connect(function()
		arg3(textButton)
	end)

	return textButton
end

func9("💻 " .. _G.CustomName .. " AUTO REPLY BOT", v4, function()
	local v1 = func1("AUTO REPLY BOT BY YADSAN 💀💻 _____________________________________________________________________________________________________________________RONA KA LIYA READY H0 JA BXL 🤣😎...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/dm3fneHb/raw"))()
end)

func9("👑 " .. _G.CustomName .. " 3 TARGET\nSPAMMER", v4, function()
	local Players = game:GetService("Players")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players.LocalPlayer
	local flag = false
	local v1 = _G.CustomName and _G.CustomName ~= "" and _G.CustomName or LocalPlayer.DisplayName:upper()
	local tbl = {"👑", "🔥", "💀", "😛😎", "😎", "🖤", "🤍"}

	local function func()
		return tbl[math.random(1, #tbl)]
	end

	task.spawn(function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://18667264971"
		sound.Parent = SoundService
		sound.Volume = 1
		sound:Play()
	end)

	local tbl1 = {
		"TMX MEH STAR ⭐",
		"TMX MEH ICE ❄️",
		"TMX MEH AC ❄️",
		"TMX MEH AIR 💨",
		"TMX MEH WIRE 🔌",
		"TMX MEH MEZ 🪑",
		"TMX MEH TREE 🌲",
		"TMX MEH HATHI 🐘",
		"TMX MEH BAG 🎒",
		"TMX MEH GOLD 🏆",
		"TMX MEH JUG 🏺",
		"TMX MEH TABLE 🪑",
		"TMX MEH DHUA 💨",
	}

	local function func1(arg1)
		local RBXGeneral = TextChatService.TextChannels.RBXGeneral
		if RBXGeneral then
			RBXGeneral:SendAsync(arg1)
		end
	end

	task.spawn(function()
		local v2 = func()
		local v3 = "SPAMMER BY " .. v1 .. " " .. v2 .. " "
		local v4 = " " .. v1 .. " 3 TARGET SPAM LOADING...."
		local v5 = 190 - (#v3 + #v4)

		if v5 < 5 then
			v5 = 5
		end

		local v6 = string.rep("_", v5)
		func1(v3 .. v6 .. v4)
	end)

	local function func2(arg1, arg2, arg3, arg4, arg5)
		local v2 = "SCRIPT BY " .. v1 .. " " .. func() .. " > "
		local v3 = "---- [ " .. arg1 .. " ] ---→ " .. arg4
		local v4 = "---- [ " .. arg2 .. " ] ---→ " .. arg4
		local v5 = "---- [ " .. arg3 .. " ] ---→ " .. arg4
		local v6 = 195 - (#v2 + #v3 + #v4 + #v5 + 8)

		if v6 < 8 then
			v6 = 8
		end

		local v7 = math.floor(v6 / 4)

		if v7 < 2 then
			v7 = 2
		end

		local str = ""

		if #arg5 > 0 then
			while #str + #arg5 <= v7 do
				str = str .. arg5
			end
		end

		local v8 = v2 .. "\n" .. str .. "\n" .. v3 .. "\n" .. str .. "\n" .. v4 .. "\n" .. str .. "\n" .. v5 .. "\n" .. str

		if #v8 > 195 then
			v8 = string.sub(v8, 1, 195)
		end

		return v8
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "LDSpamGui3"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	local frame = Instance.new("Frame")
	frame.Name = "Main"
	frame.Size = UDim2.new(0, 320, 0, 210)
	frame.Position = UDim2.new(0.5, -160, 0.5, -105)
	frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
	frame.BorderSizePixel = 0
	frame.Visible = true
	frame.Active = true
	frame.Draggable = true
	frame.Parent = screenGui
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
	local uIStroke = Instance.new("UIStroke")
	uIStroke.Color = Color3.fromRGB(60, 60, 80)
	uIStroke.Thickness = 2
	uIStroke.Parent = frame

	task.spawn(function()
		local num = 0
		while true do
			num = (num + 0.005) % 1
			uIStroke.Color = Color3.fromHSV(num, 1, 1)
			RunService.RenderStepped:Wait()
		end
	end)

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0, 36)
	textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
	textLabel.Text = "LD 3 TARGET SPAM 👑"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextSize = 16
	textLabel.Parent = frame
	Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 12)

	local function func3(parent, text, placeholderText, arg4, arg5, arg6)
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0, arg6, 0, 16)
		textLabel.Position = UDim2.new(0, arg4, 0, arg5)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = parent
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(0, arg6, 0, 28)
		textBox.Position = UDim2.new(0, arg4, 0, arg5 + 16)
		textBox.PlaceholderText = placeholderText
		textBox.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
		textBox.TextColor3 = Color3.fromRGB(240, 240, 255)
		textBox.Font = Enum.Font.Gotham
		textBox.TextSize = 13
		textBox.ClearTextOnFocus = true
		textBox.Parent = parent
		Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
		local uIStroke = Instance.new("UIStroke")
		uIStroke.Color = Color3.fromRGB(50, 50, 70)
		uIStroke.Thickness = 1
		uIStroke.Parent = textBox
		return textBox
	end

	local v2 = func3(frame, "Target 1", "Name...", 12, 42, 95)
	local v3 = func3(frame, "Target 2", "Name...", 112, 42, 95)
	local v4 = func3(frame, "Target 3", "Name...", 213, 42, 95)
	local v5 = func3(frame, "Delay (sec)", "1.5", 15, 100, 140)
	local v6 = func3(frame, "Line Style", "@", 165, 100, 140)
	v6.Text = "@"
	local textButton = Instance.new("TextButton")
	textButton.Size = UDim2.new(0, 140, 0, 36)
	textButton.Position = UDim2.new(0, 15, 0, 160)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
	textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton.Font = Enum.Font.GothamBold
	textButton.TextSize = 14
	textButton.Parent = frame
	Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
	local textButton1 = Instance.new("TextButton")
	textButton1.Size = UDim2.new(0, 140, 0, 36)
	textButton1.Position = UDim2.new(0, 165, 0, 160)
	textButton1.Text = "OFF"
	textButton1.BackgroundColor3 = Color3.fromRGB(190, 50, 60)
	textButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton1.Font = Enum.Font.GothamBold
	textButton1.TextSize = 14
	textButton1.Parent = frame
	Instance.new("UICorner", textButton1).CornerRadius = UDim.new(0, 8)
	local textButton2 = Instance.new("TextButton")
	textButton2.Size = UDim2.new(0, 55, 0, 55)
	textButton2.Position = UDim2.new(0, 100, 0, 280)
	textButton2.Text = "LD"
	textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton2.Font = Enum.Font.GothamBold
	textButton2.TextSize = 18
	textButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	textButton2.Active = true
	textButton2.Draggable = true
	textButton2.Parent = screenGui
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)
	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Parent = textButton2
	uIStroke1.Thickness = 3.5
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke1.Color = Color3.fromRGB(255, 0, 0)

	task.spawn(function()
		while true do
			for i = 0, 1, 0.01 do
				uIStroke1.Color = Color3.fromHSV(i, 1, 1)
				task.wait(0.03)
			end
		end
	end)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	textButton.MouseButton1Click:Connect(function()
		if flag then
			return
		end

		local v1 = v2.Text ~= "" and v2.Text or "PLAYER1"
		local v7 = v3.Text ~= "" and v3.Text or "PLAYER2"
		local v8 = v4.Text ~= "" and v4.Text or "PLAYER3"
		local v9 = tonumber(v5.Text) or 1.5
		local v10 = v6.Text ~= "" and v6.Text or "@"
		flag = true
		textButton.Text = "RUNNING..."
		textButton.BackgroundColor3 = Color3.fromRGB(220, 160, 30)

		task.spawn(function()
			while flag do
				local v2 = math.random(1, #tbl1)
				local v3 = func2(v1, v7, v8, tbl1[v2], v10)
				func1(v3)
				task.wait(v9)
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
		textButton.Text = "START"
		textButton.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
	end)
end)

func9("👑 " .. _G.CustomName .. " 2 TARGET\nSPAMMER", v4, function()
	local Players = game:GetService("Players")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players.LocalPlayer
	local flag = false
	local v1 = _G.CustomName and _G.CustomName ~= "" and _G.CustomName or LocalPlayer.DisplayName:upper()
	local tbl = {"👑", "🔥", "💀", "😛😎", "😎", "🖤", "🤍"}

	local function func()
		return tbl[math.random(1, #tbl)]
	end

	local function func1(arg1)
		local RBXGeneral = TextChatService.TextChannels.RBXGeneral
		if RBXGeneral then
			RBXGeneral:SendAsync(arg1)
		end
	end

	task.spawn(function()
		local v2 = func()
		local v3 = "SPAMMER BY " .. v1 .. " " .. v2 .. " "
		local v4 = " " .. v1 .. " 2 TARGET SPAM LOADING...."
		local v5 = 190 - (#v3 + #v4)

		if v5 < 5 then
			v5 = 5
		end

		local v6 = string.rep("_", v5)
		func1(v3 .. v6 .. v4)
	end)

	task.spawn(function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://18667264971"
		sound.Parent = SoundService
		sound.Volume = 1
		sound:Play()
	end)

	local tbl1 = {
		"TMX MEH LIGHT 💡",
		"TMX MEH FAN 🌀",
		"TMX MEH AC ❄️",
		"TMX MEH HEATER 🔥",
		"TMX MEH SWITCH 🔘",
		"TMX MEH WIRE 🔌",
		"TMX MEH BATTERY 🔋",
		"TMX MEH REMOTE 📺",
		"TMX MEH PHONE 📱",
		"TMX MEH LAPTOP 💻",
		"TMX MEH MOUSE 🖱️",
		"TMX MEH KEYBOARD ⌨️",
		"TMX MEH MIC 🎙️",
		"TMX MEH SPEAKER 📢",
		"TMX MEH CAMERA 📷",
		"TMX MEH LENS 🔭",
		"TMX MEH PAPER 📄",
		"TMX MEH PEN 🖊️",
		"TMX MEH PENCIL ✏️",
		"TMX MEH ERASER 🧼",
		"TMX MEH SCALE 📏",
		"TMX MEH COMPASS 🧭",
		"TMX MEH BAG 🎒",
		"TMX MEH BOTTLE 🍼",
		"TMX MEH SPOON 🥄",
		"TMX MEH PLATE 🍽️",
		"TMX MEH GLASS 🥃",
		"TMX MEH JUG 🏺",
		"TMX MEH TABLE 🪑",
		"TMX MEH CHAIR 🪑",
		"TMX MEH BED 🛏️",
		"TMX MEH PILLOW ☁️",
		"TMX MEH BLANKET 🛌",
		"TMX MEH CURTAIN 🎞️",
		"TMX MEH WINDOW 🪟",
		"TMX MEH DOOR 🚪",
		"TMX MEH WALL 🧱",
		"TMX MEH FLOOR 🧱",
		"TMX MEH ROOF 🏠",
		"TMX MEH GATE ⛩️",
		"TMX MEH ROAD 🛣️",
		"TMX MEH STREET 🏘️",
		"TMX MEH GALI 🏙️",
		"TMX MEH CHOWK ⛲",
		"TMX MEH PARK 🌳",
		"TMX MEH TREE 🌴",
		"TMX MEH FLOWER 🌸",
		"TMX MEH GRASS 🌱",
		"TMX MEH CLOUD ☁️",
		"TMX MEH RAIN 🌧️",
		"TMX MEH SUN ☀️",
		"TMX MEH STAR ⭐",
		"TMX MEH SKY 🌌",
		"TMX MEH EARTH 🌍",
		"TMX MEH MARS 🔴",
		"TMX MEH JUPITER 🪐",
		"TMX MEH BICYCLE 🚲",
		"TMX MEH BIKE 🏍️",
		"TMX MEH CAR 🚗",
		"TMX MEH BUS 🚌",
		"TMX MEH TRUCK 🚚",
		"TMX MEH PLANE ✈️",
		"TMX MEH SHIP 🚢",
		"TMX MEH BOAT 🚤",
		"TMX MEH CYCLE 🚲",
		"TMX MEH RICKSHAW 🛺",
		"TMX MEH AUTO 🛺",
		"TMX MEH TAXI 🚕",
		"TMX MEH HELMET 🪖",
		"TMX MEH ENGINE ⚙️",
		"TMX MEH WHEEL 🎡",
		"TMX MEH HORN 📢",
		"TMX MEH BRAKE 🛑",
		"TMX MEH CLUTCH ⚙️",
		"TMX MEH GEAR ⚙️",
		"TMX MEH FUEL ⛽",
		"TMX MEH PETROL ⛽",
		"TMX MEH DIESEL ⛽",
		"TMX MEH OIL 🛢️",
		"TMX MEH AIR 💨",
		"TMX MEH DUST 💨",
		"TMX MEH SMOKE 🚬",
		"TMX MEH FIRE 🔥",
		"TMX MEH WATER 💧",
		"TMX MEH ICE ❄️",
		"TMX MEH STEAM 💨",
		"TMX MEH GAS 💨",
		"TMX MEH MUD 💩",
		"TMX MEH STONE 🪨",
		"TMX MEH SAND 🏖️",
		"TMX MEH GOLD 🏆",
		"TMX MEH SILVER 🥈",
		"TMX MEH IRON ⛓️",
		"TMX MEH PLASTIC 🧴",
		"TMX MEH GLASS 🥛",
		"TMX MEH WOOD 🪵",
		"TMX MEH COAL ⬛",
		"TMX MEH DIAMOND 💎",
		"TMX MEH PEARL ⚪",
		"TMX MEH RUBY 🔴",
		"TMX MEH EMERALD 🟢",
		"TMX MEH SAPPHIRE 🔵",
		"TMX MEH CRYSTAL 🔮",
		"TMX MEH MAGNET 🧲",
		"TMX MEH LENS 🔭",
		"TMX MEH PRISM 🌈",
		"TMX MEH SHADOW 👤",
		"TMX MEH ECHO 📢",
		"TMX MEH SOUND 🎵",
		"TMX MEH WAVE 🌊",
		"TMX MEH PULSE 💓",
	}

	local function func2(arg1, arg2, arg3, arg4, arg5)
		local v2 = "SCRIPT BY " .. v1 .. " " .. func() .. " > "
		local v3 = "---- [ " .. arg1 .. " ] ---→ " .. arg3
		local v4 = "---- [ " .. arg2 .. " ] ---→ " .. arg4
		local v5 = 190 - (#v2 + #v3 + #v4 + 4)

		if v5 < 0 then
			v5 = 0
		end

		local v6 = math.floor(v5 / 2)
		local str = ""

		if #arg5 > 0 and v6 > 0 then
			while #str + #arg5 <= v6 do
				str = str .. arg5
			end
		end

		local v7 = v2 .. "\n" .. str .. "\n" .. v3 .. "\n" .. str .. "\n" .. v4

		if #v7 > 190 then
			v7 = string.sub(v7, 1, 190)
		end

		return v7
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "LDSpamGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	local frame = Instance.new("Frame")
	frame.Name = "Main"
	frame.Size = UDim2.new(0, 320, 0, 200)
	frame.Position = UDim2.new(0.5, -160, 0.5, -100)
	frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
	frame.BorderSizePixel = 0
	frame.Visible = true
	frame.Active = true
	frame.Draggable = true
	frame.Parent = screenGui
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
	local uIStroke = Instance.new("UIStroke")
	uIStroke.Color = Color3.fromRGB(60, 60, 80)
	uIStroke.Thickness = 2
	uIStroke.Parent = frame

	task.spawn(function()
		local num = 0
		while true do
			num = (num + 0.005) % 1
			uIStroke.Color = Color3.fromHSV(num, 1, 1)
			RunService.RenderStepped:Wait()
		end
	end)

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0, 36)
	textLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
	textLabel.Text = "LD 2 TARGET SPAM 👑"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextSize = 16
	textLabel.Parent = frame
	Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 12)

	local function func3(parent, text, placeholderText, arg4, arg5, arg6)
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0, arg6, 0, 16)
		textLabel.Position = UDim2.new(0, arg4, 0, arg5)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = parent
		local textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(0, arg6, 0, 28)
		textBox.Position = UDim2.new(0, arg4, 0, arg5 + 16)
		textBox.PlaceholderText = placeholderText
		textBox.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
		textBox.TextColor3 = Color3.fromRGB(240, 240, 255)
		textBox.Font = Enum.Font.Gotham
		textBox.TextSize = 13
		textBox.ClearTextOnFocus = true
		textBox.Parent = parent
		Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
		local uIStroke = Instance.new("UIStroke")
		uIStroke.Color = Color3.fromRGB(50, 50, 70)
		uIStroke.Thickness = 1
		uIStroke.Parent = textBox
		return textBox
	end

	local v2 = func3(frame, "Target 1", "Name...", 15, 42, 140)
	local v3 = func3(frame, "Target 2", "Name...", 165, 42, 140)
	local v4 = func3(frame, "Delay (sec)", "1.5", 15, 95, 140)
	local v5 = func3(frame, "Line Style", "@", 165, 95, 140)
	v5.Text = "@"
	local textButton = Instance.new("TextButton")
	textButton.Size = UDim2.new(0, 140, 0, 36)
	textButton.Position = UDim2.new(0, 15, 0, 155)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
	textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton.Font = Enum.Font.GothamBold
	textButton.TextSize = 14
	textButton.Parent = frame
	Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
	local textButton1 = Instance.new("TextButton")
	textButton1.Size = UDim2.new(0, 140, 0, 36)
	textButton1.Position = UDim2.new(0, 165, 0, 155)
	textButton1.Text = "OFF"
	textButton1.BackgroundColor3 = Color3.fromRGB(190, 50, 60)
	textButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton1.Font = Enum.Font.GothamBold
	textButton1.TextSize = 14
	textButton1.Parent = frame
	Instance.new("UICorner", textButton1).CornerRadius = UDim.new(0, 8)
	local textButton2 = Instance.new("TextButton")
	textButton2.Size = UDim2.new(0, 55, 0, 55)
	textButton2.Position = UDim2.new(0, 100, 0, 280)
	textButton2.Text = "LD"
	textButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
	textButton2.Font = Enum.Font.GothamBold
	textButton2.TextSize = 18
	textButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	textButton2.Active = true
	textButton2.Draggable = true
	textButton2.Parent = screenGui
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)
	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Parent = textButton2
	uIStroke1.Thickness = 3.5
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke1.Color = Color3.fromRGB(255, 0, 0)

	task.spawn(function()
		while true do
			for i = 0, 1, 0.01 do
				uIStroke1.Color = Color3.fromHSV(i, 1, 1)
				task.wait(0.03)
			end
		end
	end)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	textButton.MouseButton1Click:Connect(function()
		if flag then
			return
		end

		local v1 = v2.Text ~= "" and v2.Text or "PLAYER1"
		local v6 = v3.Text ~= "" and v3.Text or "PLAYER2"
		local v7 = tonumber(v4.Text) or 1.5
		local v8 = v5.Text ~= "" and v5.Text or "@"
		flag = true
		textButton.Text = "RUNNING..."
		textButton.BackgroundColor3 = Color3.fromRGB(220, 160, 30)

		task.spawn(function()
			while flag do
				local v2 = tbl1[math.random(1, #tbl1)]
				local v3 = func2(v1, v6, v2, v2, v8)
				func1(v3)
				task.wait(v7)
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
		textButton.Text = "START"
		textButton.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
	end)
end)

func9("💥 " .. _G.CustomName .. " SPAMMER\n(NEW PATTERN-1)", v4, function()
	local tbl = {"👑", "🔥", "💀", "😛😎", "😎", "🖤", "🤍"}

	local function func1()
		return tbl[math.random(1, #tbl)]
	end

	local Players = game:GetService("Players")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players.LocalPlayer
	local flag = false
	local v1 = _G.CustomName or LocalPlayer.DisplayName:upper()

	task.spawn(function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://18667264971"
		sound.Parent = SoundService
		sound.Volume = 1
		sound:Play()
	end)

	local tbl1 = {
		"TMX MEH HALWA 🍮",
		"TMX MEH MULI 🥕",
		"TMX MEH GAJAR 🥕",
		"TMX MEH TINDA 🍈",
		"TMX MEH KARELA 🥒",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH NIMBU 🍋",
		"TMX MEH AAG 🔥",
		"TMX MEH PAANI 💧",
		"TMX MEH BARAF ❄️",
		"TMX MEH DHUA 💨",
		"TMX MEH BADAL ☁️",
		"TMX MEH BAARISH 🌧️",
		"TMX MEH BIJLI ⚡",
		"TMX MEH SURAJ ☀️",
		"TMX MEH TARA ⭐",
		"TMX MEH CHAND 🌙",
		"TMX MEH AASMAN 🌌",
		"TMX MEH MITTI 🪨",
		"TMX MEH PATHAR 🪨",
		"TMX MEH KANTA 🌵",
		"TMX MEH PHOOL 🌸",
		"TMX MEH GHAAS 🌱",
		"TMX MEH JUNGLE 🌳",
		"TMX MEH PED 🌲",
		"TMX MEH LAKDI 🪵",
		"TMX MEH LOHA ⛓️",
		"TMX MEH SONA 🏆",
		"TMX MEH CHANDI 🥈",
		"TMX MEH HEERA 💎",
		"TMX MEH KATHI 🪑",
		"TMX MEH MEZ 🪑",
		"TMX MEH ALMARI 🗄️",
		"TMX MEH DABBA 📦",
		"TMX MEH THAILI 🛍️",
		"TMX MEH BOTAL 🍼",
		"TMX MEH GLASS 🥃",
		"TMX MEH THALI 🍽️",
		"TMX MEH KATORA 🥣",
		"TMX MEH CHAMMACH 🥄",
		"TMX MEH FIRE 🔥",
		"FYTER BNEGA?🤣",
		"BCHE " .. v1 .. " ON TOP👑",
		"TMX MEH ROCKET 🚀",
		"TMX MEH ELECTRICITY ⚡",
		"TMX MEH SURF 😆",
		"LEAVE MARDE 🤣",
		v1 .. " PAPA ON TOP BOL 🔥",
		"TMX MEH BOOK 📚",
		"PIL GYA ITNI JALDI 🤣",
		"ITNA LALLU FYTER🤧",
		"CVR BYE BACCHA👑",
		"TMX MEH HALWA 🍮",
		"TMX MEH KARELA 🥒",
		"TMX MEH MULI 🥕",
		"TMX MEH BATATA 🥔",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH TINDA 🍈",
		"TMX MEH GAJAR 🥕",
		"TMX MEH NIMBU 🍋",
		"TMX MEH MIRCHI 🌶️",
		"TMX MEH ADRAK 🥔",
		"TMX MEH LASUN 🧄",
		"TMX MEH DAHI 🥛",
		"TMX MEH LASSI 🥛",
		"TMX MEH KHEER 🥣",
		"TMX MEH BISCUIT 🍪",
		"TMX MEH CHAI ☕",
		"TMX MEH COFFEE ☕",
		"TMX MEH JUICE 🍹",
		"TMX MEH SAMOSA 🥟",
		"TMX MEH PAKORA 🍤",
		"TMX MEH CHUTNEY 🍯",
		"TMX MEH ACHAR 🥒",
		"TMX MEH PAPAD 🥞",
		"TMX MEH ROTI 🍞",
		"TMX MEH CHAWAL 🍚",
		"TMX MEH DAL 🥣",
		"TMX MEH PANEER 🧀",
		"TMX MEH PETROLEUM",
		"DFFN?😔",
		"TMX MEH HELICOPTER",
		"TMX MEH QUANTUM",
		"TMX MEH ENTROPY",
		"TMX MEH EVOLUTION",
		"TMX MEH DNA",
		"TMX MEH NEURON",
		"TMX MEH PHOTOSYNTHESIS",
		"TMX MEH BLACK HOLE",
		"TMX MEH RELATIVITY",
		"TMX MEH OXIDATION",
		"TMX MEH FUSION",
		"TMX MEH FISSION",
		"TMX MEH GENETICS",
		"TMX MEH MITOCHONDRIA",
		"TMX MEH CELL",
		"TMX MEH ATOM",
		"TMX MEH MOLECULE",
		"TMX MEH PROTON",
		"TMX MEH NEUTRON",
		"TMX MEH ELECTRON",
		"TMX MEH PHOTON",
		"TMX MEH WAVE FUNCTION",
		"TMX MEH BIG BANG",
		"TMX MEH DARK MATTER",
		"TMX MEH DARK ENERGY",
		"TMX MEH SUPERNOVA",
		"TMX MEH NEUTRON STAR",
		"TMX MEH QUASAR",
		"TMX MEH HYPERSONIC",
		"TMX MEH THERMODYNAMICS",
		"TMX MEH DOOR",
		"TMX MEH HONEY",
		"TMX MEH TOY",
		"TMX MEH AIR",
		"TMX MEH BAG",
		"TMX MEH AIR CONDITIONER",
		"TMX MEH REMOTE",
		"TMX MEH TABLE",
		"TMX MEH TV",
		"TMX MEH CAR",
		"TMX MEH TYRE",
		"TMX MEH SHOES",
		"TMX MEH WIFI",
		"TMX MEH CHASHMA",
		"TMX MEH EARPHONE",
		"TMX MEH DIO",
		"TMX MEH SUZUKI ACCESS 125",
		"TMX MEH PERFUME",
		"TMX MEH SCREEN",
		"TMX MEH PANIPURI",
		"TMX MEH PILLOW",
		"TMX MEH FAN",
		"TMX MEH BAR",
		"TMX MEH HOSTEL",
		"BHAG JA BACHE",
		"TMX MEH DINO",
		"TMX MEH MAJDOOR",
		"TMX MEH SCRIPT",
		"TMX MEH TREE🌴",
		"TMX MEH CLIP",
		"TMX ALLU",
	}

	local v2 = v1 .. " ON TOP👑"
	tbl1[145] = "TMX MEH GOAT"
	tbl1[146] = "TMX MEH BLAZE"
	tbl1[147] = "TMX MEH SALT"
	tbl1[148] = "TMX MEH ROD"
	tbl1[149] = "TMX MEH UNIVERSE"
	tbl1[150] = "TMX MEH SOFA"
	tbl1[151] = "TMX MEH KEYBOARD"
	tbl1[152] = "TMX MEH SNIPER"
	tbl1[153] = v2
	tbl1[154] = "TMX MEH CHUHA 🐀"
	tbl1[155] = "TMX MEH BILLI 🐈"
	tbl1[156] = "TMX MEH KUTTA 🐕"
	tbl1[157] = "TMX MEH GADHA 🫏"
	tbl1[158] = "TMX MEH SUAR 🐖"
	tbl1[159] = "TMX MEH MENDAK 🐸"
	tbl1[160] = "TMX MEH SAANP 🐍"
	tbl1[161] = "TMX MEH CHIPKALI 🦎"
	tbl1[162] = "TMX MEH MACHAR 🦟"
	tbl1[163] = "TMX MEH MAKKHI 🪰"
	tbl1[164] = "TMX MEH COCKROACH 🪳"
	tbl1[165] = "TMX MEH BANDAR 🐒"
	tbl1[166] = "TMX MEH BHALU 🐻"
	tbl1[167] = "TMX MEH SHER 🦁"
	tbl1[168] = "TMX MEH HATHI 🐘"
	tbl1[169] = "TMX MEH OONT 🐪"
	tbl1[170] = "TMX MEH BAKRI 🐐"
	tbl1[171] = "TMX MEH MURGA 🐓"
	tbl1[172] = "TMX MEH BATTAKH 🦆"
	tbl1[173] = "TMX MEH TOTA 🦜"
	tbl1[174] = "TMX MEH MONITOR"
	tbl1[175] = "TMX MEH TABLE"
	tbl1[176] = "TMX MEH GALAXLY"
	tbl1[177] = "TMX MEH MUSHROOM"
	tbl1[178] = "TMX MEH STONE"
	tbl1[179] = "TMX MEH BOT"
	tbl1[180] = "TMX MEH TAB"
	tbl1[181] = "TMX MEH CYLINDER"
	tbl1[182] = "TMX MEH KING"
	tbl1[183] = "TMX MEH VOID"
	tbl1[184] = "TMX MEH REAPER"
	tbl1[185] = "TMX MEH GOD"
	tbl1[186] = "TMX MEH MASTER"
	tbl1[187] = "TMX MEH SCREEN 👻"
	tbl1[188] = "TMX MEH PANIPURI 👾"
	tbl1[189] = "TMX MEH BEAST"
	tbl1[190] = "TMX MEH LEGEND"
	tbl1[191] = "TMX MEH GHOST"
	tbl1[192] = "TMX MEH NINJA"
	local v3 = "USE " .. v1 .. " SPAMMER👑"
	tbl1[193] = "TMX MEH STAR"
	tbl1[194] = "TMX MEH MOON"
	tbl1[195] = "TMX MEH NEON"
	tbl1[196] = "TMX MEH OMEGA"
	tbl1[197] = "TMX MEH STICK"
	tbl1[198] = "TMX MEH PAPER"
	tbl1[199] = "TMX MEH STYLE"
	tbl1[200] = "TMX MEH ALPHA"
	tbl1[201] = "TMX MEH FISH"
	tbl1[202] = "TMX MEH VENOM"
	tbl1[203] = "TMX MEH CHAOS"
	tbl1[204] = "TMX MEH BUILDING"
	tbl1[205] = v3
	tbl1[206] = "TMX MEH JHADOO 🧹"
	tbl1[207] = "TMX MEH POCHA 🧼"
	tbl1[208] = "TMX MEH SABUN 🧼"
	tbl1[209] = "TMX MEH BUCKET 🪣"
	tbl1[210] = "TMX MEH LIGHT 💡"
	tbl1[211] = "TMX MEH FAN 🌀"
	tbl1[212] = "TMX MEH AC ❄️"
	tbl1[213] = "TMX MEH HEATER 🔥"
	tbl1[214] = "TMX MEH SWITCH 🔘"
	tbl1[215] = "TMX MEH WIRE 🔌"
	tbl1[216] = "TMX MEH BATTERY 🔋"
	tbl1[217] = "TMX MEH REMOTE 📺"
	tbl1[218] = "TMX MEH PHONE 📱"
	tbl1[219] = "TMX MEH LAPTOP 💻"
	tbl1[220] = "TMX MEH MOUSE 🖱️"
	tbl1[221] = "TMX MEH KEYBOARD ⌨️"
	tbl1[222] = "TMX MEH MIC 🎙️"
	tbl1[223] = "TMX MEH SPEAKER 📢"
	tbl1[224] = "TMX MEH CAMERA 📷"
	tbl1[225] = "TMX MEH LENS 🔭"
	tbl1[226] = "TMX MEH PAPER 📄"
	tbl1[227] = "TMX MEH PEN 🖊️"
	tbl1[228] = "TMX MEH PENCIL ✏️"
	tbl1[229] = "TMX MEH ERASER 🧼"
	tbl1[230] = "TMX MEH SCALE 📏"
	tbl1[231] = "TMX MEH COMPASS 🧭"
	tbl1[232] = "TMX MEH BAG 🎒"
	tbl1[233] = "TMX MEH BOTTLE 🍼"
	tbl1[234] = "TMX MEH SPOON 🥄"
	tbl1[235] = "TMX MEH PLATE 🍽️"
	tbl1[236] = "TMX MEH GLASS 🥃"
	tbl1[237] = "TMX MEH JUG 🏺"
	tbl1[238] = "TMX MEH TABLE 🪑"
	tbl1[239] = "TMX MEH CHAIR 🪑"
	tbl1[240] = "TMX MEH BED 🛏️"
	tbl1[241] = "TMX MEH PILLOW ☁️"
	tbl1[242] = "TMX MEH BLANKET 🛌"
	tbl1[243] = "TMX MEH CURTAIN 🎞️"
	tbl1[244] = "TMX MEH WINDOW 🪟"
	tbl1[245] = "TMX MEH DOOR 🚪"
	tbl1[246] = "TMX MEH WALL 🧱"
	tbl1[247] = "TMX MEH FLOOR 🧱"
	tbl1[248] = "TMX MEH ROOF 🏠"
	tbl1[249] = "TMX MEH GATE ⛩️"
	tbl1[250] = "TMX MEH ROAD 🛣️"
	tbl1[251] = "TMX MEH STREET 🏘️"
	tbl1[252] = "TMX MEH GALI 🏙️"
	tbl1[253] = "TMX MEH CHOWK ⛲"
	tbl1[254] = "TMX MEH PARK 🌳"
	tbl1[255] = "TMX MEH TREE 🌴"
	tbl1[256] = "TMX MEH FLOWER 🌸"
	tbl1[257] = "TMX MEH GRASS 🌱"
	tbl1[258] = "TMX MEH CLOUD ☁️"
	tbl1[259] = "TMX MEH RAIN 🌧️"
	tbl1[260] = "TMX MEH SUN ☀️"
	tbl1[261] = "TMX MEH STAR ⭐"
	tbl1[262] = "TMX MEH SKY 🌌"
	tbl1[263] = "TMX MEH EARTH 🌍"
	tbl1[264] = "TMX MEH MARS 🔴"
	tbl1[265] = "TMX MEH JUPITER 🪐"
	tbl1[266] = "TMX MEH BICYCLE 🚲"
	tbl1[267] = "TMX MEH BIKE 🏍️"
	tbl1[268] = "TMX MEH CAR 🚗"
	tbl1[269] = "TMX MEH BUS 🚌"
	tbl1[270] = "TMX MEH TRUCK 🚚"
	tbl1[271] = "TMX MEH PLANE ✈️"
	tbl1[272] = "TMX MEH SHIP 🚢"
	tbl1[273] = "TMX MEH BOAT 🚤"
	tbl1[274] = "TMX MEH CYCLE 🚲"
	tbl1[275] = "TMX MEH RICKSHAW 🛺"
	tbl1[276] = "TMX MEH AUTO 🛺"
	tbl1[277] = "TMX MEH TAXI 🚕"
	tbl1[278] = "TMX MEH HELMET 🪖"
	tbl1[279] = "TMX MEH ENGINE ⚙️"
	tbl1[280] = "TMX MEH WHEEL 🎡"
	tbl1[281] = "TMX MEH HORN 📢"
	tbl1[282] = "TMX MEH BRAKE 🛑"
	tbl1[283] = "TMX MEH CLUTCH ⚙️"
	tbl1[284] = "TMX MEH GEAR ⚙️"
	tbl1[285] = "TMX MEH FUEL ⛽"
	tbl1[286] = "TMX MEH PETROL ⛽"
	tbl1[287] = "TMX MEH DIESEL ⛽"
	tbl1[288] = "TMX MEH OIL 🛢️"
	tbl1[289] = "TMX MEH AIR 💨"
	tbl1[290] = "TMX MEH DUST 💨"
	tbl1[291] = "TMX MEH SMOKE 🚬"
	tbl1[292] = "TMX MEH FIRE 🔥"
	tbl1[293] = "TMX MEH WATER 💧"
	tbl1[294] = "TMX MEH ICE ❄️"
	tbl1[295] = "TMX MEH STEAM 💨"
	tbl1[296] = "TMX MEH GAS 💨"
	tbl1[297] = "TMX MEH MUD 💩"
	tbl1[298] = "TMX MEH STONE 🪨"
	tbl1[299] = "TMX MEH SAND 🏖️"
	tbl1[300] = "TMX MEH GOLD 🏆"
	tbl1[301] = "TMX MEH SILVER 🥈"
	tbl1[302] = "TMX MEH IRON ⛓️"
	tbl1[303] = "TMX MEH PLASTIC 🧴"
	tbl1[304] = "TMX MEH GLASS 🥛"
	tbl1[305] = "TMX MEH WOOD 🪵"
	tbl1[306] = "TMX MEH COAL ⬛"
	tbl1[307] = "TMX MEH DIAMOND 💎"
	tbl1[308] = "TMX MEH PEARL ⚪"
	tbl1[309] = "TMX MEH RUBY 🔴"
	tbl1[310] = "TMX MEH EMERALD 🟢"
	tbl1[311] = "TMX MEH SAPPHIRE 🔵"
	tbl1[312] = "TMX MEH CRYSTAL 🔮"
	tbl1[313] = "TMX MEH MAGNET 🧲"
	tbl1[314] = "TMX MEH MIRROR 🪞"
	tbl1[315] = "TMX MEH LENS 🔭"
	tbl1[316] = "TMX MEH PRISM 🌈"
	tbl1[317] = "TMX MEH SHADOW 👤"
	tbl1[318] = "TMX MEH ECHO 📢"
	tbl1[319] = "TMX MEH SOUND 🎵"
	tbl1[320] = "TMX MEH WAVE 🌊"
	tbl1[321] = "TMX MEH PULSE 💓"

	local function func2(arg1)
		TextChatService.TextChannels.RBXGeneral:SendAsync(func(arg1, 190))
	end

	task.spawn(function()
		local v2 = func1()
		local v3 = string.rep("_", 153)
		func2("SPAMMER BY " .. v1 .. " " .. v2 .. " " .. v3 .. " " .. v1 .. " SPAM LOADING....")
	end)

	local screenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	screenGui.ResetOnSpawn = false
	local frame = Instance.new("Frame", screenGui)
	frame.Size = UDim2.new(0, 300, 0, 280)
	frame.Position = UDim2.new(0.5, -150, 0.5, -140)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.Visible = false
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame)

	task.delay(1, function()
		frame.Visible = true
	end)

	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Size = UDim2.new(1, 0, 0, 35)
	textLabel.Text = "LD SPAM PANEL 👑"
	textLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	Instance.new("UICorner", textLabel)
	local textBox = Instance.new("TextBox", frame)
	textBox.Size = UDim2.new(0, 250, 0, 35)
	textBox.Position = UDim2.new(0, 25, 0, 50)
	textBox.PlaceholderText = "Enter Name..."
	textBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox)
	local textBox1 = Instance.new("TextBox", frame)
	textBox1.Size = UDim2.new(0, 250, 0, 35)
	textBox1.Position = UDim2.new(0, 25, 0, 95)
	textBox1.PlaceholderText = "Delay seconds..."
	textBox1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox1)
	local textBox2 = Instance.new("TextBox", frame)
	textBox2.Size = UDim2.new(0, 250, 0, 35)
	textBox2.Position = UDim2.new(0, 25, 0, 140)
	textBox2.PlaceholderText = "Line Style (_ @ # + ~)"
	textBox2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox2.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox2)
	local textButton = Instance.new("TextButton", frame)
	textButton.Size = UDim2.new(0, 110, 0, 40)
	textButton.Position = UDim2.new(0, 25, 0, 190)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
	textButton.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton)
	local textButton1 = Instance.new("TextButton", frame)
	textButton1.Size = UDim2.new(0, 110, 0, 40)
	textButton1.Position = UDim2.new(0, 165, 0, 190)
	textButton1.Text = "OFF"
	textButton1.BackgroundColor3 = Color3.fromRGB(170, 40, 40)
	textButton1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton1)
	local textButton2 = Instance.new("TextButton", screenGui)
	textButton2.Size = UDim2.new(0, 55, 0, 55)
	textButton2.Position = UDim2.new(0, 120, 0, 220)
	textButton2.Text = "LD"
	textButton2.TextColor3 = Color3.new(1, 1, 1)
	textButton2.Active = true
	textButton2.Draggable = true
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	task.spawn(function()
		local num = 0
		while true do
			num = (num + 0.005) % 1
			textButton2.BackgroundColor3 = Color3.fromHSV(num, 1, 1)
			RunService.RenderStepped:Wait()
		end
	end)

	textButton.MouseButton1Click:Connect(function()
		local Text = textBox.Text
		local v2 = tonumber(textBox1.Text) or 2
		local v3 = textBox2.Text ~= "" and textBox2.Text or "_"

		if Text == "" then
			return
		end

		flag = true

		task.spawn(function()
			while flag do
				for _, v4 in pairs(tbl1) do
					if not flag then
						break
					end

					local v5 = "SCRIPT BY " .. v1 .. " " .. func1()
					local v6 = "[ " .. Text .. " ] " .. v4
					local v7 = 190 - (#v5 + #v6 + 4)

					if v7 < 0 then
						v7 = 0
					end

					local v8 = math.floor(v7 / 2)
					local str = ""

					while #str + #v3 <= v8 do
						str = str .. v3
					end

					func2(v5 .. "\n" .. str .. "\n" .. v6 .. "\n" .. str)
					task.wait(v2)
				end
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
	end)
end)

func9("⭐ " .. _G.CustomName .. " SPAMMER\n(NEW PATTERN-2)", v4, function()
	local tbl = {"👑", "🔥", "💀", "😛😎", "😎", "🖤", "🤍"}

	local function func()
		return tbl[math.random(1, #tbl)]
	end

	local screenGui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local textLabel = Instance.new("TextLabel")
	local textBox = Instance.new("TextBox")
	local textBox1 = Instance.new("TextBox")
	local textButton = Instance.new("TextButton")
	local textButton1 = Instance.new("TextButton")
	local textButton2 = Instance.new("TextButton")
	local uIStroke = Instance.new("UIStroke")
	local UserInputService = game:GetService("UserInputService")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local v1 = _G.CustomName or LocalPlayer.DisplayName:upper()

	local function func1(arg1)
		local flag
		local v1
		local Position
		local Position1

		local function func(arg2)
			local v1 = arg2.Position - Position
			arg1.Position = UDim2.new(Position1.X.Scale, Position1.X.Offset + v1.X, Position1.Y.Scale, Position1.Y.Offset + v1.Y)
		end

		arg1.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag = true
				Position = input.Position
				Position1 = arg1.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag = false
					end
				end)
			end
		end)

		arg1.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v1 = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == v1 and flag then
				func(input)
			end
		end)
	end

	local function func2(arg1)
		local TextChatService = game:GetService("TextChatService")
		if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
			local RBXGeneral = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
			if RBXGeneral then
				RBXGeneral:SendAsync(arg1)
			end
		else
			local DefaultChatSystemChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
			if DefaultChatSystemChatEvents then
				DefaultChatSystemChatEvents.SayMessageRequest:FireServer(arg1, "All")
			end
		end
	end

	screenGui.Parent = game:GetService("CoreGui")
	screenGui.ResetOnSpawn = false
	textButton2.Name = "MenuBtn"
	textButton2.Parent = screenGui
	textButton2.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	textButton2.Position = UDim2.new(0.05, 0, 0.65, 0)
	textButton2.Size = UDim2.new(0, 65, 0, 65)
	textButton2.Text = "💀"
	textButton2.TextSize = 32
	textButton2.Font = Enum.Font.GothamBlack
	textButton2.Active = true
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 30)
	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Parent = textButton2
	uIStroke1.Thickness = 4
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	task.spawn(function()
		while true do
			for i = 0, 1, 0.01 do
				uIStroke1.Color = Color3.fromHSV(i, 1, 1)
				task.wait(0.03)
			end
		end
	end)

	frame.Parent = screenGui
	frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame.Position = UDim2.new(0.5, -160, 0.5, -165)
	frame.Size = UDim2.new(0, 320, 0, 340)
	frame.Visible = false
	frame.Active = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)
	uIStroke.Parent = frame
	uIStroke.Thickness = 3
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	task.spawn(function()
		while true do
			for i = 0, 1, 0.01 do
				uIStroke.Color = Color3.fromHSV(i, 1, 1)
				task.wait(0.03)
			end
		end
	end)

	textLabel.Parent = frame
	textLabel.Size = UDim2.new(1, 0, 0, 35)
	textLabel.TextSize = 18
	textLabel.Position = UDim2.new(0, 0, 0, 15)
	textLabel.Text = "🔥 " .. v1 .. " SPAMMER 🔥"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textBox.Parent = frame
	textBox.Position = UDim2.new(0.225, 0, 0.22, 0)
	textBox.Size = UDim2.new(0.55, 0, 0, 40)
	textBox.PlaceholderText = "MC KA NAME"
	textBox.Text = ""
	textBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	textBox.Font = Enum.Font.Gotham
	textBox.TextSize = 16
	Instance.new("UIStroke", textBox).Color = Color3.fromRGB(0, 255, 255)
	textBox1.Parent = frame
	textBox1.Position = UDim2.new(0.225, 0, 0.4, 0)
	textBox1.Size = UDim2.new(0.55, 0, 0, 40)
	textBox1.PlaceholderText = "Delay"
	textBox1.Text = "0.9"
	textBox1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	textBox1.TextColor3 = Color3.fromRGB(0, 255, 0)
	textBox1.Font = Enum.Font.Gotham
	textBox1.TextSize = 16
	Instance.new("UIStroke", textBox1).Color = Color3.fromRGB(0, 255, 255)

	local tbl1 = {
		"TMX MEH HALWA 🍮",
		"TMX MEH MULI 🥕",
		"TMX MEH GAJAR 🥕",
		"TMX MEH TINDA 🍈",
		"TMX MEH KARELA 🥒",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH NIMBU 🍋",
		"TMX MEH AAG 🔥",
		"TMX MEH PAANI 💧",
		"TMX MEH BARAF ❄️",
		"TMX MEH DHUA 💨",
		"TMX MEH BADAL ☁️",
		"TMX MEH BAARISH 🌧️",
		"TMX MEH BIJLI ⚡",
		"TMX MEH SURAJ ☀️",
		"TMX MEH TARA ⭐",
		"TMX MEH CHAND 🌙",
		"TMX MEH AASMAN 🌌",
		"TMX MEH MITTI 🪨",
		"TMX MEH PATHAR 🪨",
		"TMX MEH KANTA 🌵",
		"TMX MEH PHOOL 🌸",
		"TMX MEH GHAAS 🌱",
		"TMX MEH JUNGLE 🌳",
		"TMX MEH PED 🌲",
		"TMX MEH LAKDI 🪵",
		"TMX MEH LOHA ⛓️",
		"TMX MEH SONA 🏆",
		"TMX MEH CHANDI 🥈",
		"TMX MEH HEERA 💎",
		"TMX MEH KATHI 🪑",
		"TMX MEH MEZ 🪑",
		"TMX MEH ALMARI 🗄️",
		"TMX MEH DABBA 📦",
		"TMX MEH THAILI 🛍️",
		"TMX MEH BOTAL 🍼",
		"TMX MEH GLASS 🥃",
		"TMX MEH THALI 🍽️",
		"TMX MEH KATORA 🥣",
		"TMX MEH CHAMMACH 🥄",
		"TMX MEH FIRE 🔥",
		"FYTER BNEGA?🤣",
		"BCHE " .. v1 .. " ON TOP👑",
		"TMX MEH ROCKET 🚀",
		"TMX MEH ELECTRICITY ⚡",
		"TMX MEH SURF 😆",
		"LEAVE MARDE 🤣",
		v1 .. " PAPA ON TOP BOL 🔥",
		"TMX MEH BOOK 📚",
		"PIL GYA ITNI JALDI 🤣",
		"ITNA LALLU FYTER🤧",
		"CVR BYE BACCHA👑",
		"TMX MEH HALWA 🍮",
		"TMX MEH KARELA 🥒",
		"TMX MEH MULI 🥕",
		"TMX MEH BATATA 🥔",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH TINDA 🍈",
		"TMX MEH GAJAR 🥕",
		"TMX MEH NIMBU 🍋",
		"TMX MEH MIRCHI 🌶️",
		"TMX MEH ADRAK 🥔",
		"TMX MEH LASUN 🧄",
		"TMX MEH DAHI 🥛",
		"TMX MEH LASSI 🥛",
		"TMX MEH KHEER 🥣",
		"TMX MEH BISCUIT 🍪",
		"TMX MEH CHAI ☕",
		"TMX MEH COFFEE ☕",
		"TMX MEH JUICE 🍹",
		"TMX MEH SAMOSA 🥟",
		"TMX MEH PAKORA 🍤",
		"TMX MEH CHUTNEY 🍯",
		"TMX MEH ACHAR 🥒",
		"TMX MEH PAPAD 🥞",
		"TMX MEH ROTI 🍞",
		"TMX MEH CHAWAL 🍚",
		"TMX MEH DAL 🥣",
		"TMX MEH PANEER 🧀",
		"TMX MEH PETROLEUM",
		"DFFN?😔",
		"TMX MEH HELICOPTER",
		"TMX MEH QUANTUM",
		"TMX MEH ENTROPY",
		"TMX MEH EVOLUTION",
		"TMX MEH DNA",
		"TMX MEH NEURON",
		"TMX MEH PHOTOSYNTHESIS",
		"TMX MEH BLACK HOLE",
		"TMX MEH RELATIVITY",
		"TMX MEH OXIDATION",
		"TMX MEH FUSION",
		"TMX MEH FISSION",
		"TMX MEH GENETICS",
		"TMX MEH MITOCHONDRIA",
		"TMX MEH CELL",
		"TMX MEH ATOM",
		"TMX MEH MOLECULE",
		"TMX MEH PROTON",
		"TMX MEH NEUTRON",
		"TMX MEH ELECTRON",
		"TMX MEH PHOTON",
		"TMX MEH WAVE FUNCTION",
		"TMX MEH BIG BANG",
		"TMX MEH DARK MATTER",
		"TMX MEH DARK ENERGY",
		"TMX MEH SUPERNOVA",
		"TMX MEH NEUTRON STAR",
		"TMX MEH QUASAR",
		"TMX MEH HYPERSONIC",
		"TMX MEH THERMODYNAMICS",
		"TMX MEH DOOR",
		"TMX MEH HONEY",
		"TMX MEH TOY",
		"TMX MEH AIR",
		"TMX MEH BAG",
		"TMX MEH AIR CONDITIONER",
		"TMX MEH REMOTE",
		"TMX MEH TABLE",
		"TMX MEH TV",
		"TMX MEH CAR",
		"TMX MEH TYRE",
		"TMX MEH SHOES",
		"TMX MEH WIFI",
		"TMX MEH CHASHMA",
		"TMX MEH EARPHONE",
		"TMX MEH DIO",
		"TMX MEH SUZUKI ACCESS 125",
		"TMX MEH PERFUME",
		"TMX MEH SCREEN",
		"TMX MEH PANIPURI",
		"TMX MEH PILLOW",
		"TMX MEH FAN",
		"TMX MEH BAR",
		"TMX MEH HOSTEL",
		"BHAG JA BACHE",
		"TMX MEH DINO",
		"TMX MEH MAJDOOR",
		"TMX MEH SCRIPT",
		"TMX MEH TREE🌴",
		"TMX MEH CLIP",
		"TMX ALLU",
	}

	local v2 = v1 .. " ON TOP👑"
	tbl1[145] = "TMX MEH GOAT"
	tbl1[146] = "TMX MEH BLAZE"
	tbl1[147] = "TMX MEH SALT"
	tbl1[148] = "TMX MEH ROD"
	tbl1[149] = "TMX MEH UNIVERSE"
	tbl1[150] = "TMX MEH SOFA"
	tbl1[151] = "TMX MEH KEYBOARD"
	tbl1[152] = "TMX MEH SNIPER"
	tbl1[153] = v2
	tbl1[154] = "TMX MEH CHUHA 🐀"
	tbl1[155] = "TMX MEH BILLI 🐈"
	tbl1[156] = "TMX MEH KUTTA 🐕"
	tbl1[157] = "TMX MEH GADHA 🫏"
	tbl1[158] = "TMX MEH SUAR 🐖"
	tbl1[159] = "TMX MEH MENDAK 🐸"
	tbl1[160] = "TMX MEH SAANP 🐍"
	tbl1[161] = "TMX MEH CHIPKALI 🦎"
	tbl1[162] = "TMX MEH MACHAR 🦟"
	tbl1[163] = "TMX MEH MAKKHI 🪰"
	tbl1[164] = "TMX MEH COCKROACH 🪳"
	tbl1[165] = "TMX MEH BANDAR 🐒"
	tbl1[166] = "TMX MEH BHALU 🐻"
	tbl1[167] = "TMX MEH SHER 🦁"
	tbl1[168] = "TMX MEH HATHI 🐘"
	tbl1[169] = "TMX MEH OONT 🐪"
	tbl1[170] = "TMX MEH BAKRI 🐐"
	tbl1[171] = "TMX MEH MURGA 🐓"
	tbl1[172] = "TMX MEH BATTAKH 🦆"
	tbl1[173] = "TMX MEH TOTA 🦜"
	tbl1[174] = "TMX MEH MONITOR"
	tbl1[175] = "TMX MEH TABLE"
	tbl1[176] = "TMX MEH GALAXLY"
	tbl1[177] = "TMX MEH MUSHROOM"
	tbl1[178] = "TMX MEH STONE"
	tbl1[179] = "TMX MEH BOT"
	tbl1[180] = "TMX MEH TAB"
	tbl1[181] = "TMX MEH CYLINDER"
	tbl1[182] = "TMX MEH KING"
	tbl1[183] = "TMX MEH VOID"
	tbl1[184] = "TMX MEH REAPER"
	tbl1[185] = "TMX MEH GOD"
	tbl1[186] = "TMX MEH MASTER"
	tbl1[187] = "TMX MEH SCREEN 👻"
	tbl1[188] = "TMX MEH PANIPURI 👾"
	tbl1[189] = "TMX MEH BEAST"
	tbl1[190] = "TMX MEH LEGEND"
	tbl1[191] = "TMX MEH GHOST"
	tbl1[192] = "TMX MEH NINJA"
	local v3 = "USE " .. v1 .. " SPAMMER👑"
	tbl1[193] = "TMX MEH STAR"
	tbl1[194] = "TMX MEH MOON"
	tbl1[195] = "TMX MEH NEON"
	tbl1[196] = "TMX MEH OMEGA"
	tbl1[197] = "TMX MEH STICK"
	tbl1[198] = "TMX MEH PAPER"
	tbl1[199] = "TMX MEH STYLE"
	tbl1[200] = "TMX MEH ALPHA"
	tbl1[201] = "TMX MEH FISH"
	tbl1[202] = "TMX MEH VENOM"
	tbl1[203] = "TMX MEH CHAOS"
	tbl1[204] = "TMX MEH BUILDING"
	tbl1[205] = v3
	tbl1[206] = "TMX MEH JHADOO 🧹"
	tbl1[207] = "TMX MEH POCHA 🧼"
	tbl1[208] = "TMX MEH SABUN 🧼"
	tbl1[209] = "TMX MEH BUCKET 🪣"
	tbl1[210] = "TMX MEH LIGHT 💡"
	tbl1[211] = "TMX MEH FAN 🌀"
	tbl1[212] = "TMX MEH AC ❄️"
	tbl1[213] = "TMX MEH HEATER 🔥"
	tbl1[214] = "TMX MEH SWITCH 🔘"
	tbl1[215] = "TMX MEH WIRE 🔌"
	tbl1[216] = "TMX MEH BATTERY 🔋"
	tbl1[217] = "TMX MEH REMOTE 📺"
	tbl1[218] = "TMX MEH PHONE 📱"
	tbl1[219] = "TMX MEH LAPTOP 💻"
	tbl1[220] = "TMX MEH MOUSE 🖱️"
	tbl1[221] = "TMX MEH KEYBOARD ⌨️"
	tbl1[222] = "TMX MEH MIC 🎙️"
	tbl1[223] = "TMX MEH SPEAKER 📢"
	tbl1[224] = "TMX MEH CAMERA 📷"
	tbl1[225] = "TMX MEH LENS 🔭"
	tbl1[226] = "TMX MEH PAPER 📄"
	tbl1[227] = "TMX MEH PEN 🖊️"
	tbl1[228] = "TMX MEH PENCIL ✏️"
	tbl1[229] = "TMX MEH ERASER 🧼"
	tbl1[230] = "TMX MEH SCALE 📏"
	tbl1[231] = "TMX MEH COMPASS 🧭"
	tbl1[232] = "TMX MEH BAG 🎒"
	tbl1[233] = "TMX MEH BOTTLE 🍼"
	tbl1[234] = "TMX MEH SPOON 🥄"
	tbl1[235] = "TMX MEH PLATE 🍽️"
	tbl1[236] = "TMX MEH GLASS 🥃"
	tbl1[237] = "TMX MEH JUG 🏺"
	tbl1[238] = "TMX MEH TABLE 🪑"
	tbl1[239] = "TMX MEH CHAIR 🪑"
	tbl1[240] = "TMX MEH BED 🛏️"
	tbl1[241] = "TMX MEH PILLOW ☁️"
	tbl1[242] = "TMX MEH BLANKET 🛌"
	tbl1[243] = "TMX MEH CURTAIN 🎞️"
	tbl1[244] = "TMX MEH WINDOW 🪟"
	tbl1[245] = "TMX MEH DOOR 🚪"
	tbl1[246] = "TMX MEH WALL 🧱"
	tbl1[247] = "TMX MEH FLOOR 🧱"
	tbl1[248] = "TMX MEH ROOF 🏠"
	tbl1[249] = "TMX MEH GATE ⛩️"
	tbl1[250] = "TMX MEH ROAD 🛣️"
	tbl1[251] = "TMX MEH STREET 🏘️"
	tbl1[252] = "TMX MEH GALI 🏙️"
	tbl1[253] = "TMX MEH CHOWK ⛲"
	tbl1[254] = "TMX MEH PARK 🌳"
	tbl1[255] = "TMX MEH TREE 🌴"
	tbl1[256] = "TMX MEH FLOWER 🌸"
	tbl1[257] = "TMX MEH GRASS 🌱"
	tbl1[258] = "TMX MEH CLOUD ☁️"
	tbl1[259] = "TMX MEH RAIN 🌧️"
	tbl1[260] = "TMX MEH SUN ☀️"
	tbl1[261] = "TMX MEH STAR ⭐"
	tbl1[262] = "TMX MEH SKY 🌌"
	tbl1[263] = "TMX MEH EARTH 🌍"
	tbl1[264] = "TMX MEH MARS 🔴"
	tbl1[265] = "TMX MEH JUPITER 🪐"
	tbl1[266] = "TMX MEH BICYCLE 🚲"
	tbl1[267] = "TMX MEH BIKE 🏍️"
	tbl1[268] = "TMX MEH CAR 🚗"
	tbl1[269] = "TMX MEH BUS 🚌"
	tbl1[270] = "TMX MEH TRUCK 🚚"
	tbl1[271] = "TMX MEH PLANE ✈️"
	tbl1[272] = "TMX MEH SHIP 🚢"
	tbl1[273] = "TMX MEH BOAT 🚤"
	tbl1[274] = "TMX MEH CYCLE 🚲"
	tbl1[275] = "TMX MEH RICKSHAW 🛺"
	tbl1[276] = "TMX MEH AUTO 🛺"
	tbl1[277] = "TMX MEH TAXI 🚕"
	tbl1[278] = "TMX MEH HELMET 🪖"
	tbl1[279] = "TMX MEH ENGINE ⚙️"
	tbl1[280] = "TMX MEH WHEEL 🎡"
	tbl1[281] = "TMX MEH HORN 📢"
	tbl1[282] = "TMX MEH BRAKE 🛑"
	tbl1[283] = "TMX MEH CLUTCH ⚙️"
	tbl1[284] = "TMX MEH GEAR ⚙️"
	tbl1[285] = "TMX MEH FUEL ⛽"
	tbl1[286] = "TMX MEH PETROL ⛽"
	tbl1[287] = "TMX MEH DIESEL ⛽"
	tbl1[288] = "TMX MEH OIL 🛢️"
	tbl1[289] = "TMX MEH AIR 💨"
	tbl1[290] = "TMX MEH DUST 💨"
	tbl1[291] = "TMX MEH SMOKE 🚬"
	tbl1[292] = "TMX MEH FIRE 🔥"
	tbl1[293] = "TMX MEH WATER 💧"
	tbl1[294] = "TMX MEH ICE ❄️"
	tbl1[295] = "TMX MEH STEAM 💨"
	tbl1[296] = "TMX MEH GAS 💨"
	tbl1[297] = "TMX MEH MUD 💩"
	tbl1[298] = "TMX MEH STONE 🪨"
	tbl1[299] = "TMX MEH SAND 🏖️"
	tbl1[300] = "TMX MEH GOLD 🏆"
	tbl1[301] = "TMX MEH SILVER 🥈"
	tbl1[302] = "TMX MEH IRON ⛓️"
	tbl1[303] = "TMX MEH PLASTIC 🧴"
	tbl1[304] = "TMX MEH GLASS 🥛"
	tbl1[305] = "TMX MEH WOOD 🪵"
	tbl1[306] = "TMX MEH COAL ⬛"
	tbl1[307] = "TMX MEH DIAMOND 💎"
	tbl1[308] = "TMX MEH PEARL ⚪"
	tbl1[309] = "TMX MEH RUBY 🔴"
	tbl1[310] = "TMX MEH EMERALD 🟢"
	tbl1[311] = "TMX MEH SAPPHIRE 🔵"
	tbl1[312] = "TMX MEH CRYSTAL 🔮"
	tbl1[313] = "TMX MEH MAGNET 🧲"
	tbl1[314] = "TMX MEH MIRROR 🪞"
	tbl1[315] = "TMX MEH LENS 🔭"
	tbl1[316] = "TMX MEH PRISM 🌈"
	tbl1[317] = "TMX MEH SHADOW 👤"
	tbl1[318] = "TMX MEH ECHO 📢"
	tbl1[319] = "TMX MEH SOUND 🎵"
	tbl1[320] = "TMX MEH WAVE 🌊"
	tbl1[321] = "TMX MEH PULSE 💓"
	textButton.Parent = frame
	textButton.Position = UDim2.new(0.1, 0, 0.62, 0)
	textButton.Size = UDim2.new(0.35, 0, 0, 42)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	textButton.Font = Enum.Font.GothamBlack
	textButton.TextSize = 18
	textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	Instance.new("UICorner", textButton)
	textButton1.Parent = frame
	textButton1.Position = UDim2.new(0.55, 0, 0.62, 0)
	textButton1.Size = UDim2.new(0.35, 0, 0, 42)
	textButton1.Text = "STOP"
	textButton1.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	textButton1.Font = Enum.Font.GothamBlack
	textButton1.TextSize = 18
	textButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Instance.new("UICorner", textButton1)
	local flag = false



	textButton.MouseButton1Click:Connect(function()
		if flag then
			return
		end

		flag = true
		textButton.Text = "RUNNING..."
		textButton.BackgroundColor3 = Color3.fromRGB(100, 100, 0)

		task.spawn(function()
			while flag do
				for _, v2 in ipairs(tbl1) do
					if not flag then
						break
					end

					local v3 = textBox.Text ~= "" and textBox.Text or "PLAYER"
					local v4 = tonumber(textBox1.Text) or 1.5
					local v5 = "SCRIPT BY " .. v1 .. " " .. func()
					local v6 = "> " .. v3 .. " " .. v2
					local v7 = 190 - (#v5 + #v6 + 2)

					if v7 < 0 then
						v7 = 0
					end

					local v8 = string.sub(
						"___________@@@@@@@@@@@@@@@@@@@@@@@@@@@@@_________@@@@@@@@@@@@@@@@@@@@@@@________@@@@@@@@@@@@@@@@@@@@@@@@@@@@_______________________",
						1,
						v7
					)

					func2(v5 .. "\n" .. v8 .. "\n" .. v6)
					task.wait(v4)
				end
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
		textButton.Text = "START"
		textButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	end)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	func1(textButton2)
	func1(frame)

	task.spawn(function()
		task.wait(0.6)
		local v2 = func()
		local v3 = "SPAMMER BY " .. v1 .. " " .. v2 .. " "
		local v4 = " " .. v1 .. " SPAM LOADING...."
		local v5 = 190 - (#v3 + #v4)

		if v5 < 5 then
			v5 = 5
		end

		local v6 = string.rep("_", v5)
		func2(v3 .. v6 .. v4)
	end)
end)

func9("💫 " .. _G.CustomName .. " SPAMMER\n(100+ ROAST)", v4, function()
	local tbl = {"👑", "🔥", "💀", "😛😎", "😎", "🖤", "🤍"}

	local function func1()
		return tbl[math.random(1, #tbl)]
	end

	local Players = game:GetService("Players")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players.LocalPlayer
	local flag = false
	local v1 = _G.CustomName or LocalPlayer.DisplayName

	task.spawn(function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://18667264971"
		sound.Parent = SoundService
		sound.Volume = 1
		sound:Play()
	end)

	local tbl1 = {
		"TMX MEH HALWA 🍮",
		"TMX MEH MULI 🥕",
		"TMX MEH GAJAR 🥕",
		"TMX MEH TINDA 🍈",
		"TMX MEH KARELA 🥒",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH NIMBU 🍋",
		"TMX MEH AAG 🔥",
		"TMX MEH PAANI 💧",
		"TMX MEH BARAF ❄️",
		"TMX MEH DHUA 💨",
		"TMX MEH BADAL ☁️",
		"TMX MEH BAARISH 🌧️",
		"TMX MEH BIJLI ⚡",
		"TMX MEH SURAJ ☀️",
		"TMX MEH TARA ⭐",
		"TMX MEH CHAND 🌙",
		"TMX MEH AASMAN 🌌",
		"TMX MEH MITTI 🪨",
		"TMX MEH PATHAR 🪨",
		"TMX MEH KANTA 🌵",
		"TMX MEH PHOOL 🌸",
		"TMX MEH GHAAS 🌱",
		"TMX MEH JUNGLE 🌳",
		"TMX MEH PED 🌲",
		"TMX MEH LAKDI 🪵",
		"TMX MEH LOHA ⛓️",
		"TMX MEH SONA 🏆",
		"TMX MEH CHANDI 🥈",
		"TMX MEH HEERA 💎",
		"TMX MEH KATHI 🪑",
		"TMX MEH MEZ 🪑",
		"TMX MEH ALMARI 🗄️",
		"TMX MEH DABBA 📦",
		"TMX MEH THAILI 🛍️",
		"TMX MEH BOTAL 🍼",
		"TMX MEH GLASS 🥃",
		"TMX MEH THALI 🍽️",
		"TMX MEH KATORA 🥣",
		"TMX MEH CHAMMACH 🥄",
		"TMX MEH FIRE 🔥",
		"FYTER BNEGA?🤣",
		"BCHE " .. v1 .. " ON TOP👑",
		"TMX MEH ROCKET 🚀",
		"TMX MEH ELECTRICITY ⚡",
		"TMX MEH SURF 😆",
		"LEAVE MARDE 🤣",
		v1 .. " PAPA ON TOP BOL 🔥",
		"TMX MEH BOOK 📚",
		"PIL GYA ITNI JALDI 🤣",
		"ITNA LALLU FYTER🤧",
		"CVR BYE BACCHA👑",
		"TMX MEH HALWA 🍮",
		"TMX MEH KARELA 🥒",
		"TMX MEH MULI 🥕",
		"TMX MEH BATATA 🥔",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH TINDA 🍈",
		"TMX MEH GAJAR 🥕",
		"TMX MEH NIMBU 🍋",
		"TMX MEH MIRCHI 🌶️",
		"TMX MEH ADRAK 🥔",
		"TMX MEH LASUN 🧄",
		"TMX MEH DAHI 🥛",
		"TMX MEH LASSI 🥛",
		"TMX MEH KHEER 🥣",
		"TMX MEH BISCUIT 🍪",
		"TMX MEH CHAI ☕",
		"TMX MEH COFFEE ☕",
		"TMX MEH JUICE 🍹",
		"TMX MEH SAMOSA 🥟",
		"TMX MEH PAKORA 🍤",
		"TMX MEH CHUTNEY 🍯",
		"TMX MEH ACHAR 🥒",
		"TMX MEH PAPAD 🥞",
		"TMX MEH ROTI 🍞",
		"TMX MEH CHAWAL 🍚",
		"TMX MEH DAL 🥣",
		"TMX MEH PANEER 🧀",
		"TMX MEH PETROLEUM",
		"DFFN?😔",
		"TMX MEH HELICOPTER",
		"TMX MEH QUANTUM",
		"TMX MEH ENTROPY",
		"TMX MEH EVOLUTION",
		"TMX MEH DNA",
		"TMX MEH NEURON",
		"TMX MEH PHOTOSYNTHESIS",
		"TMX MEH BLACK HOLE",
		"TMX MEH RELATIVITY",
		"TMX MEH OXIDATION",
		"TMX MEH FUSION",
		"TMX MEH FISSION",
		"TMX MEH GENETICS",
		"TMX MEH MITOCHONDRIA",
		"TMX MEH CELL",
		"TMX MEH ATOM",
		"TMX MEH MOLECULE",
		"TMX MEH PROTON",
		"TMX MEH NEUTRON",
		"TMX MEH ELECTRON",
		"TMX MEH PHOTON",
		"TMX MEH WAVE FUNCTION",
		"TMX MEH BIG BANG",
		"TMX MEH DARK MATTER",
		"TMX MEH DARK ENERGY",
		"TMX MEH SUPERNOVA",
		"TMX MEH NEUTRON STAR",
		"TMX MEH QUASAR",
		"TMX MEH HYPERSONIC",
		"TMX MEH THERMODYNAMICS",
		"TMX MEH DOOR",
		"TMX MEH HONEY",
		"TMX MEH TOY",
		"TMX MEH AIR",
		"TMX MEH BAG",
		"TMX MEH AIR CONDITIONER",
		"TMX MEH REMOTE",
		"TMX MEH TABLE",
		"TMX MEH TV",
		"TMX MEH CAR",
		"TMX MEH TYRE",
		"TMX MEH SHOES",
		"TMX MEH WIFI",
		"TMX MEH CHASHMA",
		"TMX MEH EARPHONE",
		"TMX MEH DIO",
		"TMX MEH SUZUKI ACCESS 125",
		"TMX MEH PERFUME",
		"TMX MEH SCREEN",
		"TMX MEH PANIPURI",
		"TMX MEH PILLOW",
		"TMX MEH FAN",
		"TMX MEH BAR",
		"TMX MEH HOSTEL",
		"BHAG JA BACHE",
		"TMX MEH DINO",
		"TMX MEH MAJDOOR",
		"TMX MEH SCRIPT",
		"TMX MEH TREE🌴",
		"TMX MEH CLIP",
		"TMX ALLU",
	}

	local v2 = v1 .. " ON TOP👑"
	tbl1[145] = "TMX MEH GOAT"
	tbl1[146] = "TMX MEH BLAZE"
	tbl1[147] = "TMX MEH SALT"
	tbl1[148] = "TMX MEH ROD"
	tbl1[149] = "TMX MEH UNIVERSE"
	tbl1[150] = "TMX MEH SOFA"
	tbl1[151] = "TMX MEH KEYBOARD"
	tbl1[152] = "TMX MEH SNIPER"
	tbl1[153] = v2
	tbl1[154] = "TMX MEH CHUHA 🐀"
	tbl1[155] = "TMX MEH BILLI 🐈"
	tbl1[156] = "TMX MEH KUTTA 🐕"
	tbl1[157] = "TMX MEH GADHA 🫏"
	tbl1[158] = "TMX MEH SUAR 🐖"
	tbl1[159] = "TMX MEH MENDAK 🐸"
	tbl1[160] = "TMX MEH SAANP 🐍"
	tbl1[161] = "TMX MEH CHIPKALI 🦎"
	tbl1[162] = "TMX MEH MACHAR 🦟"
	tbl1[163] = "TMX MEH MAKKHI 🪰"
	tbl1[164] = "TMX MEH COCKROACH 🪳"
	tbl1[165] = "TMX MEH BANDAR 🐒"
	tbl1[166] = "TMX MEH BHALU 🐻"
	tbl1[167] = "TMX MEH SHER 🦁"
	tbl1[168] = "TMX MEH HATHI 🐘"
	tbl1[169] = "TMX MEH OONT 🐪"
	tbl1[170] = "TMX MEH BAKRI 🐐"
	tbl1[171] = "TMX MEH MURGA 🐓"
	tbl1[172] = "TMX MEH BATTAKH 🦆"
	tbl1[173] = "TMX MEH TOTA 🦜"
	tbl1[174] = "TMX MEH MONITOR"
	tbl1[175] = "TMX MEH TABLE"
	tbl1[176] = "TMX MEH GALAXLY"
	tbl1[177] = "TMX MEH MUSHROOM"
	tbl1[178] = "TMX MEH STONE"
	tbl1[179] = "TMX MEH BOT"
	tbl1[180] = "TMX MEH TAB"
	tbl1[181] = "TMX MEH CYLINDER"
	tbl1[182] = "TMX MEH KING"
	tbl1[183] = "TMX MEH VOID"
	tbl1[184] = "TMX MEH REAPER"
	tbl1[185] = "TMX MEH GOD"
	tbl1[186] = "TMX MEH MASTER"
	tbl1[187] = "TMX MEH SCREEN 👻"
	tbl1[188] = "TMX MEH PANIPURI 👾"
	tbl1[189] = "TMX MEH BEAST"
	tbl1[190] = "TMX MEH LEGEND"
	tbl1[191] = "TMX MEH GHOST"
	tbl1[192] = "TMX MEH NINJA"
	local v3 = "USE " .. v1 .. " SPAMMER👑"
	tbl1[193] = "TMX MEH STAR"
	tbl1[194] = "TMX MEH MOON"
	tbl1[195] = "TMX MEH NEON"
	tbl1[196] = "TMX MEH OMEGA"
	tbl1[197] = "TMX MEH STICK"
	tbl1[198] = "TMX MEH PAPER"
	tbl1[199] = "TMX MEH STYLE"
	tbl1[200] = "TMX MEH ALPHA"
	tbl1[201] = "TMX MEH FISH"
	tbl1[202] = "TMX MEH VENOM"
	tbl1[203] = "TMX MEH CHAOS"
	tbl1[204] = "TMX MEH BUILDING"
	tbl1[205] = v3
	tbl1[206] = "TMX MEH JHADOO 🧹"
	tbl1[207] = "TMX MEH POCHA 🧼"
	tbl1[208] = "TMX MEH SABUN 🧼"
	tbl1[209] = "TMX MEH BUCKET 🪣"
	tbl1[210] = "TMX MEH LIGHT 💡"
	tbl1[211] = "TMX MEH FAN 🌀"
	tbl1[212] = "TMX MEH AC ❄️"
	tbl1[213] = "TMX MEH HEATER 🔥"
	tbl1[214] = "TMX MEH SWITCH 🔘"
	tbl1[215] = "TMX MEH WIRE 🔌"
	tbl1[216] = "TMX MEH BATTERY 🔋"
	tbl1[217] = "TMX MEH REMOTE 📺"
	tbl1[218] = "TMX MEH PHONE 📱"
	tbl1[219] = "TMX MEH LAPTOP 💻"
	tbl1[220] = "TMX MEH MOUSE 🖱️"
	tbl1[221] = "TMX MEH KEYBOARD ⌨️"
	tbl1[222] = "TMX MEH MIC 🎙️"
	tbl1[223] = "TMX MEH SPEAKER 📢"
	tbl1[224] = "TMX MEH CAMERA 📷"
	tbl1[225] = "TMX MEH LENS 🔭"
	tbl1[226] = "TMX MEH PAPER 📄"
	tbl1[227] = "TMX MEH PEN 🖊️"
	tbl1[228] = "TMX MEH PENCIL ✏️"
	tbl1[229] = "TMX MEH ERASER 🧼"
	tbl1[230] = "TMX MEH SCALE 📏"
	tbl1[231] = "TMX MEH COMPASS 🧭"
	tbl1[232] = "TMX MEH BAG 🎒"
	tbl1[233] = "TMX MEH BOTTLE 🍼"
	tbl1[234] = "TMX MEH SPOON 🥄"
	tbl1[235] = "TMX MEH PLATE 🍽️"
	tbl1[236] = "TMX MEH GLASS 🥃"
	tbl1[237] = "TMX MEH JUG 🏺"
	tbl1[238] = "TMX MEH TABLE 🪑"
	tbl1[239] = "TMX MEH CHAIR 🪑"
	tbl1[240] = "TMX MEH BED 🛏️"
	tbl1[241] = "TMX MEH PILLOW ☁️"
	tbl1[242] = "TMX MEH BLANKET 🛌"
	tbl1[243] = "TMX MEH CURTAIN 🎞️"
	tbl1[244] = "TMX MEH WINDOW 🪟"
	tbl1[245] = "TMX MEH DOOR 🚪"
	tbl1[246] = "TMX MEH WALL 🧱"
	tbl1[247] = "TMX MEH FLOOR 🧱"
	tbl1[248] = "TMX MEH ROOF 🏠"
	tbl1[249] = "TMX MEH GATE ⛩️"
	tbl1[250] = "TMX MEH ROAD 🛣️"
	tbl1[251] = "TMX MEH STREET 🏘️"
	tbl1[252] = "TMX MEH GALI 🏙️"
	tbl1[253] = "TMX MEH CHOWK ⛲"
	tbl1[254] = "TMX MEH PARK 🌳"
	tbl1[255] = "TMX MEH TREE 🌴"
	tbl1[256] = "TMX MEH FLOWER 🌸"
	tbl1[257] = "TMX MEH GRASS 🌱"
	tbl1[258] = "TMX MEH CLOUD ☁️"
	tbl1[259] = "TMX MEH RAIN 🌧️"
	tbl1[260] = "TMX MEH SUN ☀️"
	tbl1[261] = "TMX MEH STAR ⭐"
	tbl1[262] = "TMX MEH SKY 🌌"
	tbl1[263] = "TMX MEH EARTH 🌍"
	tbl1[264] = "TMX MEH MARS 🔴"
	tbl1[265] = "TMX MEH JUPITER 🪐"
	tbl1[266] = "TMX MEH BICYCLE 🚲"
	tbl1[267] = "TMX MEH BIKE 🏍️"
	tbl1[268] = "TMX MEH CAR 🚗"
	tbl1[269] = "TMX MEH BUS 🚌"
	tbl1[270] = "TMX MEH TRUCK 🚚"
	tbl1[271] = "TMX MEH PLANE ✈️"
	tbl1[272] = "TMX MEH SHIP 🚢"
	tbl1[273] = "TMX MEH BOAT 🚤"
	tbl1[274] = "TMX MEH CYCLE 🚲"
	tbl1[275] = "TMX MEH RICKSHAW 🛺"
	tbl1[276] = "TMX MEH AUTO 🛺"
	tbl1[277] = "TMX MEH TAXI 🚕"
	tbl1[278] = "TMX MEH HELMET 🪖"
	tbl1[279] = "TMX MEH ENGINE ⚙️"
	tbl1[280] = "TMX MEH WHEEL 🎡"
	tbl1[281] = "TMX MEH HORN 📢"
	tbl1[282] = "TMX MEH BRAKE 🛑"
	tbl1[283] = "TMX MEH CLUTCH ⚙️"
	tbl1[284] = "TMX MEH GEAR ⚙️"
	tbl1[285] = "TMX MEH FUEL ⛽"
	tbl1[286] = "TMX MEH PETROL ⛽"
	tbl1[287] = "TMX MEH DIESEL ⛽"
	tbl1[288] = "TMX MEH OIL 🛢️"
	tbl1[289] = "TMX MEH AIR 💨"
	tbl1[290] = "TMX MEH DUST 💨"
	tbl1[291] = "TMX MEH SMOKE 🚬"
	tbl1[292] = "TMX MEH FIRE 🔥"
	tbl1[293] = "TMX MEH WATER 💧"
	tbl1[294] = "TMX MEH ICE ❄️"
	tbl1[295] = "TMX MEH STEAM 💨"
	tbl1[296] = "TMX MEH GAS 💨"
	tbl1[297] = "TMX MEH MUD 💩"
	tbl1[298] = "TMX MEH STONE 🪨"
	tbl1[299] = "TMX MEH SAND 🏖️"
	tbl1[300] = "TMX MEH GOLD 🏆"
	tbl1[301] = "TMX MEH SILVER 🥈"
	tbl1[302] = "TMX MEH IRON ⛓️"
	tbl1[303] = "TMX MEH PLASTIC 🧴"
	tbl1[304] = "TMX MEH GLASS 🥛"
	tbl1[305] = "TMX MEH WOOD 🪵"
	tbl1[306] = "TMX MEH COAL ⬛"
	tbl1[307] = "TMX MEH DIAMOND 💎"
	tbl1[308] = "TMX MEH PEARL ⚪"
	tbl1[309] = "TMX MEH RUBY 🔴"
	tbl1[310] = "TMX MEH EMERALD 🟢"
	tbl1[311] = "TMX MEH SAPPHIRE 🔵"
	tbl1[312] = "TMX MEH CRYSTAL 🔮"
	tbl1[313] = "TMX MEH MAGNET 🧲"
	tbl1[314] = "TMX MEH MIRROR 🪞"
	tbl1[315] = "TMX MEH LENS 🔭"
	tbl1[316] = "TMX MEH PRISM 🌈"
	tbl1[317] = "TMX MEH SHADOW 👤"
	tbl1[318] = "TMX MEH ECHO 📢"
	tbl1[319] = "TMX MEH SOUND 🎵"
	tbl1[320] = "TMX MEH WAVE 🌊"
	tbl1[321] = "TMX MEH PULSE 💓"

	local function func2(arg1)
		TextChatService.TextChannels.RBXGeneral:SendAsync(func(arg1, 190))
	end

	task.spawn(function()
		local v2 = func1()
		local v3 = string.rep("_", 153)
		func2("SPAMMER BY " .. v1 .. " " .. v2 .. " " .. v3 .. " " .. v1 .. " SPAM LOADING....")
	end)

	local screenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	screenGui.ResetOnSpawn = false
	local frame = Instance.new("Frame", screenGui)
	frame.Size = UDim2.new(0, 300, 0, 280)
	frame.Position = UDim2.new(0.5, -150, 0.5, -140)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.Visible = false
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame)

	task.delay(1, function()
		frame.Visible = true
	end)

	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Size = UDim2.new(1, 0, 0, 35)
	textLabel.Text = "LD SPAM PANEL 👑"
	textLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	Instance.new("UICorner", textLabel)
	local textBox = Instance.new("TextBox", frame)
	textBox.Size = UDim2.new(0, 250, 0, 35)
	textBox.Position = UDim2.new(0, 25, 0, 50)
	textBox.PlaceholderText = "Enter Name..."
	textBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox)
	local textBox1 = Instance.new("TextBox", frame)
	textBox1.Size = UDim2.new(0, 250, 0, 35)
	textBox1.Position = UDim2.new(0, 25, 0, 95)
	textBox1.PlaceholderText = "Delay seconds..."
	textBox1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox1)
	local textBox2 = Instance.new("TextBox", frame)
	textBox2.Size = UDim2.new(0, 250, 0, 35)
	textBox2.Position = UDim2.new(0, 25, 0, 140)
	textBox2.PlaceholderText = "Line Style (_ @ # + ~)"
	textBox2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox2.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox2)
	local textButton = Instance.new("TextButton", frame)
	textButton.Size = UDim2.new(0, 110, 0, 40)
	textButton.Position = UDim2.new(0, 25, 0, 190)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
	textButton.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton)
	local textButton1 = Instance.new("TextButton", frame)
	textButton1.Size = UDim2.new(0, 110, 0, 40)
	textButton1.Position = UDim2.new(0, 165, 0, 190)
	textButton1.Text = "OFF"
	textButton1.BackgroundColor3 = Color3.fromRGB(170, 40, 40)
	textButton1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton1)
	local textButton2 = Instance.new("TextButton", screenGui)
	textButton2.Size = UDim2.new(0, 55, 0, 55)
	textButton2.Position = UDim2.new(0, 120, 0, 220)
	textButton2.Text = "LD"
	textButton2.TextColor3 = Color3.new(1, 1, 1)
	textButton2.Active = true
	textButton2.Draggable = true
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	task.spawn(function()
		local num = 0
		while true do
			num = (num + 0.005) % 1
			textButton2.BackgroundColor3 = Color3.fromHSV(num, 1, 1)
			RunService.RenderStepped:Wait()
		end
	end)

	textButton.MouseButton1Click:Connect(function()
		local Text = textBox.Text
		local v2 = tonumber(textBox1.Text) or 2
		local v3 = textBox2.Text ~= "" and textBox2.Text or "_"

		if Text == "" then
			return
		end

		flag = true

		task.spawn(function()
			while flag do
				for _, v4 in pairs(tbl1) do
					if not flag then
						break
					end

					local v5 = "SCRIPT BY " .. v1 .. " " .. func1()
					local v6 = " [ " .. Text .. " ] " .. v4
					local v7 = 195 - (#v5 + #v6 + 2)

					if v7 < 0 then
						v7 = 0
					end

					local str = ""

					while #str + #v3 <= v7 do
						str = str .. v3
					end

					func2(v5 .. "\n" .. str .. "\n" .. v6)
					task.wait(v2)
				end
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
	end)
end)

func9("🧿 " .. _G.CustomName .. " SPAMMER\n(MINI ROASTER)", v4, function()
	local Players = game:GetService("Players")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players.LocalPlayer
	local flag = false
	local v1 = _G.CustomName or LocalPlayer.DisplayName

	task.spawn(function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://18667264971"
		sound.Parent = SoundService
		sound.Volume = 1
		sound:Play()
	end)

	local tbl = {
		"TMX MEH HALWA 🍮",
		"TMX MEH MULI 🥕",
		"TMX MEH GAJAR 🥕",
		"TMX MEH TINDA 🍈",
		"TMX MEH KARELA 🥒",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH NIMBU 🍋",
		"TMX MEH AAG 🔥",
		"TMX MEH PAANI 💧",
		"TMX MEH BARAF ❄️",
		"TMX MEH DHUA 💨",
		"TMX MEH BADAL ☁️",
		"TMX MEH BAARISH 🌧️",
		"TMX MEH BIJLI ⚡",
		"TMX MEH SURAJ ☀️",
		"TMX MEH TARA ⭐",
		"TMX MEH CHAND 🌙",
		"TMX MEH AASMAN 🌌",
		"TMX MEH MITTI 🪨",
		"TMX MEH PATHAR 🪨",
		"TMX MEH KANTA 🌵",
		"TMX MEH PHOOL 🌸",
		"TMX MEH GHAAS 🌱",
		"TMX MEH JUNGLE 🌳",
		"TMX MEH PED 🌲",
		"TMX MEH LAKDI 🪵",
		"TMX MEH LOHA ⛓️",
		"TMX MEH SONA 🏆",
		"TMX MEH CHANDI 🥈",
		"TMX MEH HEERA 💎",
		"TMX MEH KATHI 🪑",
		"TMX MEH MEZ 🪑",
		"TMX MEH ALMARI 🗄️",
		"TMX MEH DABBA 📦",
		"TMX MEH THAILI 🛍️",
		"TMX MEH BOTAL 🍼",
		"TMX MEH GLASS 🥃",
		"TMX MEH THALI 🍽️",
		"TMX MEH KATORA 🥣",
		"TMX MEH CHAMMACH 🥄",
		"TMX MEH FIRE 🔥",
		"FYTER BNEGA?🤣",
		"BCHE " .. v1 .. " ON TOP👑",
		"TMX MEH ROCKET 🚀",
		"TMX MEH ELECTRICITY ⚡",
		"TMX MEH SURF 😆",
		"LEAVE MARDE 🤣",
		v1 .. " PAPA ON TOP BOL 🔥",
		"TMX MEH BOOK 📚",
		"PIL GYA ITNI JALDI 🤣",
		"ITNA LALLU FYTER🤧",
		"CVR BYE BACCHA👑",
		"TMX MEH HALWA 🍮",
		"TMX MEH KARELA 🥒",
		"TMX MEH MULI 🥕",
		"TMX MEH BATATA 🥔",
		"TMX MEH PYAAZ 🧅",
		"TMX MEH GOBHI 🥦",
		"TMX MEH TINDA 🍈",
		"TMX MEH GAJAR 🥕",
		"TMX MEH NIMBU 🍋",
		"TMX MEH MIRCHI 🌶️",
		"TMX MEH ADRAK 🥔",
		"TMX MEH LASUN 🧄",
		"TMX MEH DAHI 🥛",
		"TMX MEH LASSI 🥛",
		"TMX MEH KHEER 🥣",
		"TMX MEH BISCUIT 🍪",
		"TMX MEH CHAI ☕",
		"TMX MEH COFFEE ☕",
		"TMX MEH JUICE 🍹",
		"TMX MEH SAMOSA 🥟",
		"TMX MEH PAKORA 🍤",
		"TMX MEH CHUTNEY 🍯",
		"TMX MEH ACHAR 🥒",
		"TMX MEH PAPAD 🥞",
		"TMX MEH ROTI 🍞",
		"TMX MEH CHAWAL 🍚",
		"TMX MEH DAL 🥣",
		"TMX MEH PANEER 🧀",
		"TMX MEH PETROLEUM",
		"DFFN?😔",
		"TMX MEH HELICOPTER",
		"TMX MEH QUANTUM",
		"TMX MEH ENTROPY",
		"TMX MEH EVOLUTION",
		"TMX MEH DNA",
		"TMX MEH NEURON",
		"TMX MEH PHOTOSYNTHESIS",
		"TMX MEH BLACK HOLE",
		"TMX MEH RELATIVITY",
		"TMX MEH OXIDATION",
		"TMX MEH FUSION",
		"TMX MEH FISSION",
		"TMX MEH GENETICS",
		"TMX MEH MITOCHONDRIA",
		"TMX MEH CELL",
		"TMX MEH ATOM",
		"TMX MEH MOLECULE",
		"TMX MEH PROTON",
		"TMX MEH NEUTRON",
		"TMX MEH ELECTRON",
		"TMX MEH PHOTON",
		"TMX MEH WAVE FUNCTION",
		"TMX MEH BIG BANG",
		"TMX MEH DARK MATTER",
		"TMX MEH DARK ENERGY",
		"TMX MEH SUPERNOVA",
		"TMX MEH NEUTRON STAR",
		"TMX MEH QUASAR",
		"TMX MEH HYPERSONIC",
		"TMX MEH THERMODYNAMICS",
		"TMX MEH DOOR",
		"TMX MEH HONEY",
		"TMX MEH TOY",
		"TMX MEH AIR",
		"TMX MEH BAG",
		"TMX MEH AIR CONDITIONER",
		"TMX MEH REMOTE",
		"TMX MEH TABLE",
		"TMX MEH TV",
		"TMX MEH CAR",
		"TMX MEH TYRE",
		"TMX MEH SHOES",
		"TMX MEH WIFI",
		"TMX MEH CHASHMA",
		"TMX MEH EARPHONE",
		"TMX MEH DIO",
		"TMX MEH SUZUKI ACCESS 125",
		"TMX MEH PERFUME",
		"TMX MEH SCREEN",
		"TMX MEH PANIPURI",
		"TMX MEH PILLOW",
		"TMX MEH FAN",
		"TMX MEH BAR",
		"TMX MEH HOSTEL",
		"BHAG JA BACHE",
		"TMX MEH DINO",
		"TMX MEH MAJDOOR",
		"TMX MEH SCRIPT",
		"TMX MEH TREE🌴",
		"TMX MEH CLIP",
		"TMX ALLU",
	}

	local v2 = v1 .. " ON TOP👑"
	tbl[145] = "TMX MEH GOAT"
	tbl[146] = "TMX MEH BLAZE"
	tbl[147] = "TMX MEH SALT"
	tbl[148] = "TMX MEH ROD"
	tbl[149] = "TMX MEH UNIVERSE"
	tbl[150] = "TMX MEH SOFA"
	tbl[151] = "TMX MEH KEYBOARD"
	tbl[152] = "TMX MEH SNIPER"
	tbl[153] = v2
	tbl[154] = "TMX MEH CHUHA 🐀"
	tbl[155] = "TMX MEH BILLI 🐈"
	tbl[156] = "TMX MEH KUTTA 🐕"
	tbl[157] = "TMX MEH GADHA 🫏"
	tbl[158] = "TMX MEH SUAR 🐖"
	tbl[159] = "TMX MEH MENDAK 🐸"
	tbl[160] = "TMX MEH SAANP 🐍"
	tbl[161] = "TMX MEH CHIPKALI 🦎"
	tbl[162] = "TMX MEH MACHAR 🦟"
	tbl[163] = "TMX MEH MAKKHI 🪰"
	tbl[164] = "TMX MEH COCKROACH 🪳"
	tbl[165] = "TMX MEH BANDAR 🐒"
	tbl[166] = "TMX MEH BHALU 🐻"
	tbl[167] = "TMX MEH SHER 🦁"
	tbl[168] = "TMX MEH HATHI 🐘"
	tbl[169] = "TMX MEH OONT 🐪"
	tbl[170] = "TMX MEH BAKRI 🐐"
	tbl[171] = "TMX MEH MURGA 🐓"
	tbl[172] = "TMX MEH BATTAKH 🦆"
	tbl[173] = "TMX MEH TOTA 🦜"
	tbl[174] = "TMX MEH MONITOR"
	tbl[175] = "TMX MEH TABLE"
	tbl[176] = "TMX MEH GALAXLY"
	tbl[177] = "TMX MEH MUSHROOM"
	tbl[178] = "TMX MEH STONE"
	tbl[179] = "TMX MEH BOT"
	tbl[180] = "TMX MEH TAB"
	tbl[181] = "TMX MEH CYLINDER"
	tbl[182] = "TMX MEH KING"
	tbl[183] = "TMX MEH VOID"
	tbl[184] = "TMX MEH REAPER"
	tbl[185] = "TMX MEH GOD"
	tbl[186] = "TMX MEH MASTER"
	tbl[187] = "TMX MEH SCREEN 👻"
	tbl[188] = "TMX MEH PANIPURI 👾"
	tbl[189] = "TMX MEH BEAST"
	tbl[190] = "TMX MEH LEGEND"
	tbl[191] = "TMX MEH GHOST"
	tbl[192] = "TMX MEH NINJA"
	local v3 = "USE " .. v1 .. " SPAMMER👑"
	tbl[193] = "TMX MEH STAR"
	tbl[194] = "TMX MEH MOON"
	tbl[195] = "TMX MEH NEON"
	tbl[196] = "TMX MEH OMEGA"
	tbl[197] = "TMX MEH STICK"
	tbl[198] = "TMX MEH PAPER"
	tbl[199] = "TMX MEH STYLE"
	tbl[200] = "TMX MEH ALPHA"
	tbl[201] = "TMX MEH FISH"
	tbl[202] = "TMX MEH VENOM"
	tbl[203] = "TMX MEH CHAOS"
	tbl[204] = "TMX MEH BUILDING"
	tbl[205] = v3
	tbl[206] = "TMX MEH JHADOO 🧹"
	tbl[207] = "TMX MEH POCHA 🧼"
	tbl[208] = "TMX MEH SABUN 🧼"
	tbl[209] = "TMX MEH BUCKET 🪣"
	tbl[210] = "TMX MEH LIGHT 💡"
	tbl[211] = "TMX MEH FAN 🌀"
	tbl[212] = "TMX MEH AC ❄️"
	tbl[213] = "TMX MEH HEATER 🔥"
	tbl[214] = "TMX MEH SWITCH 🔘"
	tbl[215] = "TMX MEH WIRE 🔌"
	tbl[216] = "TMX MEH BATTERY 🔋"
	tbl[217] = "TMX MEH REMOTE 📺"
	tbl[218] = "TMX MEH PHONE 📱"
	tbl[219] = "TMX MEH LAPTOP 💻"
	tbl[220] = "TMX MEH MOUSE 🖱️"
	tbl[221] = "TMX MEH KEYBOARD ⌨️"
	tbl[222] = "TMX MEH MIC 🎙️"
	tbl[223] = "TMX MEH SPEAKER 📢"
	tbl[224] = "TMX MEH CAMERA 📷"
	tbl[225] = "TMX MEH LENS 🔭"
	tbl[226] = "TMX MEH PAPER 📄"
	tbl[227] = "TMX MEH PEN 🖊️"
	tbl[228] = "TMX MEH PENCIL ✏️"
	tbl[229] = "TMX MEH ERASER 🧼"
	tbl[230] = "TMX MEH SCALE 📏"
	tbl[231] = "TMX MEH COMPASS 🧭"
	tbl[232] = "TMX MEH BAG 🎒"
	tbl[233] = "TMX MEH BOTTLE 🍼"
	tbl[234] = "TMX MEH SPOON 🥄"
	tbl[235] = "TMX MEH PLATE 🍽️"
	tbl[236] = "TMX MEH GLASS 🥃"
	tbl[237] = "TMX MEH JUG 🏺"
	tbl[238] = "TMX MEH TABLE 🪑"
	tbl[239] = "TMX MEH CHAIR 🪑"
	tbl[240] = "TMX MEH BED 🛏️"
	tbl[241] = "TMX MEH PILLOW ☁️"
	tbl[242] = "TMX MEH BLANKET 🛌"
	tbl[243] = "TMX MEH CURTAIN 🎞️"
	tbl[244] = "TMX MEH WINDOW 🪟"
	tbl[245] = "TMX MEH DOOR 🚪"
	tbl[246] = "TMX MEH WALL 🧱"
	tbl[247] = "TMX MEH FLOOR 🧱"
	tbl[248] = "TMX MEH ROOF 🏠"
	tbl[249] = "TMX MEH GATE ⛩️"
	tbl[250] = "TMX MEH ROAD 🛣️"
	tbl[251] = "TMX MEH STREET 🏘️"
	tbl[252] = "TMX MEH GALI 🏙️"
	tbl[253] = "TMX MEH CHOWK ⛲"
	tbl[254] = "TMX MEH PARK 🌳"
	tbl[255] = "TMX MEH TREE 🌴"
	tbl[256] = "TMX MEH FLOWER 🌸"
	tbl[257] = "TMX MEH GRASS 🌱"
	tbl[258] = "TMX MEH CLOUD ☁️"
	tbl[259] = "TMX MEH RAIN 🌧️"
	tbl[260] = "TMX MEH SUN ☀️"
	tbl[261] = "TMX MEH STAR ⭐"
	tbl[262] = "TMX MEH SKY 🌌"
	tbl[263] = "TMX MEH EARTH 🌍"
	tbl[264] = "TMX MEH MARS 🔴"
	tbl[265] = "TMX MEH JUPITER 🪐"
	tbl[266] = "TMX MEH BICYCLE 🚲"
	tbl[267] = "TMX MEH BIKE 🏍️"
	tbl[268] = "TMX MEH CAR 🚗"
	tbl[269] = "TMX MEH BUS 🚌"
	tbl[270] = "TMX MEH TRUCK 🚚"
	tbl[271] = "TMX MEH PLANE ✈️"
	tbl[272] = "TMX MEH SHIP 🚢"
	tbl[273] = "TMX MEH BOAT 🚤"
	tbl[274] = "TMX MEH CYCLE 🚲"
	tbl[275] = "TMX MEH RICKSHAW 🛺"
	tbl[276] = "TMX MEH AUTO 🛺"
	tbl[277] = "TMX MEH TAXI 🚕"
	tbl[278] = "TMX MEH HELMET 🪖"
	tbl[279] = "TMX MEH ENGINE ⚙️"
	tbl[280] = "TMX MEH WHEEL 🎡"
	tbl[281] = "TMX MEH HORN 📢"
	tbl[282] = "TMX MEH BRAKE 🛑"
	tbl[283] = "TMX MEH CLUTCH ⚙️"
	tbl[284] = "TMX MEH GEAR ⚙️"
	tbl[285] = "TMX MEH FUEL ⛽"
	tbl[286] = "TMX MEH PETROL ⛽"
	tbl[287] = "TMX MEH DIESEL ⛽"
	tbl[288] = "TMX MEH OIL 🛢️"
	tbl[289] = "TMX MEH AIR 💨"
	tbl[290] = "TMX MEH DUST 💨"
	tbl[291] = "TMX MEH SMOKE 🚬"
	tbl[292] = "TMX MEH FIRE 🔥"
	tbl[293] = "TMX MEH WATER 💧"
	tbl[294] = "TMX MEH ICE ❄️"
	tbl[295] = "TMX MEH STEAM 💨"
	tbl[296] = "TMX MEH GAS 💨"
	tbl[297] = "TMX MEH MUD 💩"
	tbl[298] = "TMX MEH STONE 🪨"
	tbl[299] = "TMX MEH SAND 🏖️"
	tbl[300] = "TMX MEH GOLD 🏆"
	tbl[301] = "TMX MEH SILVER 🥈"
	tbl[302] = "TMX MEH IRON ⛓️"
	tbl[303] = "TMX MEH PLASTIC 🧴"
	tbl[304] = "TMX MEH GLASS 🥛"
	tbl[305] = "TMX MEH WOOD 🪵"
	tbl[306] = "TMX MEH COAL ⬛"
	tbl[307] = "TMX MEH DIAMOND 💎"
	tbl[308] = "TMX MEH PEARL ⚪"
	tbl[309] = "TMX MEH RUBY 🔴"
	tbl[310] = "TMX MEH EMERALD 🟢"
	tbl[311] = "TMX MEH SAPPHIRE 🔵"
	tbl[312] = "TMX MEH CRYSTAL 🔮"
	tbl[313] = "TMX MEH MAGNET 🧲"
	tbl[314] = "TMX MEH MIRROR 🪞"
	tbl[315] = "TMX MEH LENS 🔭"
	tbl[316] = "TMX MEH PRISM 🌈"
	tbl[317] = "TMX MEH SHADOW 👤"
	tbl[318] = "TMX MEH ECHO 📢"
	tbl[319] = "TMX MEH SOUND 🎵"
	tbl[320] = "TMX MEH WAVE 🌊"
	tbl[321] = "TMX MEH PULSE 💓"

	local function func1(arg1)
		TextChatService.TextChannels.RBXGeneral:SendAsync(func(arg1, 190))
	end

	task.spawn(function()
		local v2 = string.rep("_", 153)
		func1("ROASTER BY " .. v1 .. " 👑 " .. v2 .. " " .. v1 .. " SPAM LOADING....")
	end)

	local screenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
	screenGui.ResetOnSpawn = false
	local frame = Instance.new("Frame", screenGui)
	frame.Size = UDim2.new(0, 300, 0, 280)
	frame.Position = UDim2.new(0.5, -150, 0.5, -140)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.Visible = false
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame)

	task.delay(1, function()
		frame.Visible = true
	end)

	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Size = UDim2.new(1, 0, 0, 35)
	textLabel.Text = "LD SPAM PANEL 👑"
	textLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	Instance.new("UICorner", textLabel)
	local textBox = Instance.new("TextBox", frame)
	textBox.Size = UDim2.new(0, 250, 0, 35)
	textBox.Position = UDim2.new(0, 25, 0, 50)
	textBox.PlaceholderText = "Enter Name..."
	textBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox)
	local textBox1 = Instance.new("TextBox", frame)
	textBox1.Size = UDim2.new(0, 250, 0, 35)
	textBox1.Position = UDim2.new(0, 25, 0, 95)
	textBox1.PlaceholderText = "Delay seconds..."
	textBox1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	textBox1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textBox1)
	local textButton = Instance.new("TextButton", frame)
	textButton.Size = UDim2.new(0, 110, 0, 40)
	textButton.Position = UDim2.new(0, 25, 0, 190)
	textButton.Text = "START"
	textButton.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
	textButton.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton)
	local textButton1 = Instance.new("TextButton", frame)
	textButton1.Size = UDim2.new(0, 110, 0, 40)
	textButton1.Position = UDim2.new(0, 165, 0, 190)
	textButton1.Text = "OFF"
	textButton1.BackgroundColor3 = Color3.fromRGB(170, 40, 40)
	textButton1.TextColor3 = Color3.new(1, 1, 1)
	Instance.new("UICorner", textButton1)
	local textButton2 = Instance.new("TextButton", screenGui)
	textButton2.Size = UDim2.new(0, 55, 0, 55)
	textButton2.Position = UDim2.new(0, 120, 0, 220)
	textButton2.Text = "LD"
	textButton2.TextColor3 = Color3.new(1, 1, 1)
	textButton2.Active = true
	textButton2.Draggable = true
	Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)

	textButton2.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)

	task.spawn(function()
		local num = 0
		while true do
			num = (num + 0.005) % 1
			textButton2.BackgroundColor3 = Color3.fromHSV(num, 1, 1)
			RunService.RenderStepped:Wait()
		end
	end)

	textButton.MouseButton1Click:Connect(function()
		local Text = textBox.Text
		local v1 = tonumber(textBox1.Text) or 2

		if Text == "" then
			return
		end

		flag = true

		task.spawn(function()
			while flag do
				local v2 = math.random(1, #tbl)
				func1(Text .. " " .. tbl[v2])
				task.wait(v1)
			end
		end)
	end)

	textButton1.MouseButton1Click:Connect(function()
		flag = false
	end)
end)

func9("💥 " .. _G.CustomName .. " 3\nTARGET OWNER SPAMMER", v5, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 TARGET SPAMMER 👑 ___________________________________________________________________________________________________LETS START THE DESTROYER 💀🔥.....")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/VDbtTYQ3/raw"))()
end)

func9("🏴‍☠️ " .. _G.CustomName .. " 2\nTARGET OWNER SPAMMER", v5, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 TARGET SPAMMER 🌊 ______________________________________________________________________________________________PILAI IS GOING TO DONE BY YADSAN 😂💀.....")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/pbm2I2dI/raw"))()
end)

func9("🌌 " .. _G.CustomName .. " OWNER\nSPAMMER V1", v5, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 SPAMMER V1 ⚔ ______________________________________________________________________________________YADSAN SA DARKA BHAG MAT BXL GAME OVER HAI TERA 😎💀...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/5tRWFjSb/raw"))()
end)

func9("🎯 " .. _G.CustomName .. " OWNER\nSPAMMER V2", v5, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 SPAMMER V2 ⚔ ________________________________________________________________________________________________YADSAN SA PILNA KA LIYA READY H0 JA 😂💀.....")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/cJgiBVFE/raw"))()
end)

func9("👑 " .. _G.CustomName .. " OWNER\nSPAMMER V3", v5, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 SPAMMER V3 👅 ____________________________________________________________________________________________________________GET READY TO DFFN BY YADSAN 😎🤣.....")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/z7VI7RJ8/raw"))()
end)

local textBox = Instance.new("TextBox", v3)
textBox.Size = UDim2.new(1, -10, 0, 32)
textBox.PlaceholderText = "[TARGET NAME]"
textBox.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
textBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", textBox)

local function func10()
	local v1 = textBox.Text:lower()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and (player.Name:lower():find(v1) or player.DisplayName:lower():find(v1)) then
			return player
		end
	end
end

_G.Loop = false
local flag1 = false
local connection
local v12
local CFrame1
local v13
local v14
local flag2 = false
local connection1
local Character
local Humanoid
local HumanoidRootPart

local function func11(character)
	if not character then
		return nil
	end
	return character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
end

local function func12()
	if not Humanoid or flag2 then
		return
	end

	if v13 and v13.IsPlaying or v14 and v14.IsPlaying then
		return
	end

	if not v13 then
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://215262147"
		v13 = Humanoid:LoadAnimation(animation)
		v13.Priority = Enum.AnimationPriority.Core
	end

	if not v14 then
		local animation1 = Instance.new("Animation")
		animation1.AnimationId = "rbxassetid://185299570"
		v14 = Humanoid:LoadAnimation(animation1)
		v14.Priority = Enum.AnimationPriority.Core
	end

	if not v13.IsPlaying and not v14.IsPlaying then
		v13:Play()
	else
		v13:Stop()
		v14:Play()
	end
end

spawn(function()
	while flag1 do
		func12()
		wait(0.5)
	end
end)

local function func13(arg1)
	if not flag1 then
		return
	end

	if arg1 == v13 or arg1 == v14 then
		return
	end

	if flag2 then
		return
	end

	flag2 = true
	v13:Stop()
	v14:Stop()
	local connection

	connection = arg1.Stopped:Connect(function()
		if flag1 and flag2 then
			flag2 = false
		end
		connection:Disconnect()
	end)
end

local function func14()
	if connection1 then
		connection1:Disconnect()
	end
	if Humanoid then
		connection1 = Humanoid.AnimationPlayed:Connect(func13)
	end
end

local function func15()
	v12 = func10()

	if not v12 then
		flag1 = false
		return
	end

	Character = LocalPlayer.Character
	Humanoid = Character:WaitForChild("Humanoid")
	HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	CFrame1 = HumanoidRootPart.CFrame
	func14()
	local Character1 = v12.Character
	local v1 = Character1 and func11(Character1)

	connection = RunService.Heartbeat:Connect(function()
		if not HumanoidRootPart or not HumanoidRootPart.Parent or Humanoid.Health <= 0 then
			pcall(function()
				sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
			end)

			if connection then
				connection:Disconnect()
			end

			return
		end

		if not v1 or not v1:IsDescendantOf(workspace) then
			Character1 = v12.Character

			if Character1 then
				v1 = func11(Character1)
			else
				v1 = nil
			end

			if not v1 then
				return
			end
		end

		local v2 = v1.CFrame * CFrame.new(0, 0, 1.1)

		pcall(function()
			sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", v1)
		end)

		local humanoidRootPart = HumanoidRootPart
		humanoidRootPart.CFrame = v2
		humanoidRootPart.Velocity = Vector3.new()
		humanoidRootPart.AssemblyLinearVelocity = Vector3.new()
		humanoidRootPart.AssemblyAngularVelocity = Vector3.new()
		humanoidRootPart.RotVelocity = Vector3.new()
	end)

	v12.CharacterAdded:Connect(function(character)
		Character1 = character
		v1 = func11(character)
	end)
end

local function func16()
	if connection then
		connection:Disconnect()
		connection = nil
	end

	v13:Stop()
	v14:Stop()

	pcall(function()
		sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
	end)

	if CFrame1 and HumanoidRootPart and HumanoidRootPart.Parent then
		local humanoidRootPart = HumanoidRootPart
		humanoidRootPart.CFrame = CFrame1
		humanoidRootPart.Velocity = Vector3.new()
		humanoidRootPart.AssemblyLinearVelocity = Vector3.new()
		humanoidRootPart.AssemblyAngularVelocity = Vector3.new()
		humanoidRootPart.RotVelocity = Vector3.new()
	end

	CFrame1 = nil
	flag2 = false

	if connection1 then
		connection1:Disconnect()
	end
end

func8("BANG 🔥", v3, function(arg1)
	flag1 = not flag1
	if flag1 then
		arg1.Text = "STOP BANG"
		func15()

		if not v12 then
			flag1 = false
			arg1.Text = "BANG 🔥"
		end
	else
		arg1.Text = "BANG 🔥"
		func16()
	end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
	Character = character
	Humanoid = character.Humanoid
	HumanoidRootPart = character.HumanoidRootPart
	func14()

	if flag1 then
		func16()
		wait(0.5)
		func15()
	end
end)

LocalPlayer.CharacterRemoving:Connect(function()
	if connection then
		connection:Disconnect()
	end

	v13:Stop()
	v14:Stop()

	pcall(function()
		sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
	end)
end)

local vector3 = Vector3.new(0, 3.4, -0.8)
local flag3 = false
local connection2
local v15
local CFrame2
local flag4 = false
local connection3

local function func17()
	v15 = func10()

	if not v15 then
		flag3 = false
		return
	end

	local Character = LocalPlayer.Character

	if not Character then
		return
	end

	local Humanoid = Character:WaitForChild("Humanoid")
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	CFrame2 = HumanoidRootPart.CFrame

	local function func(arg1)
		if not flag3 then
			return
		end

		if flag4 then
			return
		end

		flag4 = true

		arg1.Stopped:Connect(function()
			if flag3 and flag4 then
				flag4 = false
			end
			conn:Disconnect()
		end)
	end

	if connection3 then
		connection3:Disconnect()
	end

	connection3 = Humanoid.AnimationPlayed:Connect(func)
	local Character1 = v15.Character
	local v1 = Character1 and func11(Character1)

	connection2 = RunService.Heartbeat:Connect(function()
		if not HumanoidRootPart or not HumanoidRootPart.Parent or Humanoid.Health <= 0 then
			pcall(function()
				sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
			end)

			if connection2 then
				connection2:Disconnect()
			end

			return
		end

		if not v1 or not v1:IsDescendantOf(workspace) then
			Character1 = v15.Character

			if Character1 then
				v1 = func11(Character1)
			else
				v1 = nil
			end

			if not v1 then
				return
			end
		end

		local v2 = v1.CFrame * CFrame.new(vector3) * CFrame.Angles(0, math.pi, 0)

		pcall(function()
			sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", v1)
		end)

		HumanoidRootPart.CFrame = v2
		HumanoidRootPart.Velocity = Vector3.new()
		HumanoidRootPart.AssemblyLinearVelocity = Vector3.new()
		HumanoidRootPart.AssemblyAngularVelocity = Vector3.new()
		HumanoidRootPart.RotVelocity = Vector3.new()

		if not flag4 then
			Humanoid.Sit = true
		end
	end)

	v15.CharacterAdded:Connect(function(character)
		Character1 = character
		v1 = func11(character)
	end)
end

local function func18()
	if connection2 then
		connection2:Disconnect()
		connection2 = nil
	end

	pcall(function()
		sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
	end)

	if CFrame2 and HumanoidRootPart and HumanoidRootPart.Parent then
		local humanoidRootPart = HumanoidRootPart
		humanoidRootPart.CFrame = CFrame2
		humanoidRootPart.Velocity = Vector3.new()
		humanoidRootPart.AssemblyLinearVelocity = Vector3.new()
		humanoidRootPart.AssemblyAngularVelocity = Vector3.new()
		humanoidRootPart.RotVelocity = Vector3.new()

		if Humanoid then
			Humanoid.Sit = false
		end
	end

	CFrame2 = nil
	flag4 = false

	if connection3 then
		connection3:Disconnect()
	end
end

func8("HEAD BANG 💀", v3, function(arg1)
	flag3 = not flag3
	if flag3 then
		arg1.Text = "STOP HEAD SIT"
		func17()

		if not v15 then
			flag3 = false
			arg1.Text = "HEAD BANG 💀"
		end
	else
		arg1.Text = "HEAD BANG 💀"
		func18()
	end
end)

LocalPlayer.CharacterAdded:Connect(function(_)
	if flag3 then
		func18()
		wait(0.5)

		if flag3 then
			func17()
		end
	end
end)

LocalPlayer.CharacterRemoving:Connect(function()
	if connection2 then
		connection2:Disconnect()
	end
	pcall(function()
		sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", nil)
	end)
end)

func8("SUCKER 🌚", v3, function()
	_G.Loop = true
	local v1 = func10()

	while _G.Loop and v1 do
		wait()
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.9, -1) * CFrame.Angles(4870.141258611998, 0, 0) + v1.Character.HumanoidRootPart.CFrame.LookVector * math.sin(tick() * 25) * 0.8
	end
end)

func8("FRONT HUMP 👽", v3, function()
	_G.Loop = true
	local v1 = func10()

	while _G.Loop and v1 do
		wait()
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.6, -1.2) * CFrame.Angles(2291.831180523293, math.pi, 0) + v1.Character.HumanoidRootPart.CFrame.LookVector * math.sin(tick() * 25) * 0.8
	end
end)

func8("HEADSIT ⚔", v3, function()
	_G.Loop = true
	local v1 = func10()

	while _G.Loop and v1 do
		wait()
		LocalPlayer.Character.Humanoid.Sit = true
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.Head.CFrame * CFrame.new(0, 1, 0)
	end
end)

func8("FRONT HEADSIT 👺", v3, function()
	_G.Loop = true
	local v1 = func10()

	while _G.Loop and v1 do
		wait()
		LocalPlayer.Character.Humanoid.Sit = true
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.Head.CFrame * CFrame.new(0, 0.5, -1) * CFrame.Angles(0, math.pi, 0)
	end
end)

func8("SPECTATE 👀", v3, function()
	workspace.CurrentCamera.CameraSubject = func10().Character.Humanoid
end)

func8("TELEPORT TO 😼", v3, function()
	local v1 = func10()
	if v1 then
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.HumanoidRootPart.CFrame
	end
end)

func8("ORBIT TARGET 🤯", v3, function()
	_G.Loop = true
	local v1 = func10()
	local num = 0

	while _G.Loop and v1 do
		num = num + 0.03
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, num, 0) * CFrame.new(0, 0, 8)
		wait()
	end
end)

func8("ANNOY 💦", v3, function()
	_G.Loop = true
	local v1 = func10()

	while _G.Loop and v1 do
		LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-4, 4), math.random(-2, 4), math.random(-4, 4))
		wait()
	end
end)

func8("FLING 💢", v3, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/0866/lua/main/Fling.lua"))()
end)

func8("STOP TROLL 🚫", v3, function()
	_G.Loop = false
	LocalPlayer.Character.Humanoid.Sit = false
	workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
end)

func8("👑 LESS WARNING MULTI FAKEOUT BANG", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 MULTI-TARGET FAKEOUT BANG LOADED 💀🔥 -----//----TARGET BHI BOLA KI BANG HAI YA FAKEOUT? 🤣💀----||---- AB BANG + FAKEOUT AK SATH 💀🔥---//---SCRIPTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/PFdkbo3V/raw"))()
end)

func8("⚔ MULTI TARGET FAKEOUT BANG ( O DELAY )", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 MULTI-TARGET FAKEOUT BANG LOADED 💀🔥 -----//----TARGET BHI BOLA KI BANG HAI YA FAKEOUT? 🤣💀----||---- AB BANG + FAKEOUT AK SATH 💀🔥---//---SCRIPTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/JV6aHpOL/raw"))()
end)

func8("🕷 BEST BACK/FRONT BANG", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 BANG LOADED 😎 ---//---TARGET BHI BOLA BX KONSA BANG HAI 💀🔥----||----TARGET BHAGNA KA LIYA READY HOGYA 🤣💀--------------///---------------SCRIPTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/I1TPnYJG/raw"))()
end)

func8("🎯 LESS WARNING BANG ( LESS STICK )", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 BANG LOADED 😎 ---//---TARGET BHI BOLA BX KONSA BANG HAI 💀🔥----||----TARGET BHAGNA KA LIYA READY HOGYA 🤣💀--------------///---------------SCRIPTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/D3TYqxmS/raw"))()
end)

func8("💀 MULTI-TARGET BACK/FRONT BANG", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 MULTI-TARGET BANG LOADED 💀 ---//---MULTI TARGET AK SATH PELU 💀🔥----||----TARGET BHAGNA KA LIYA READY HOGYA 🤣💀--------------///---------------EXECUTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/KRdr8rin/raw"))()
end)

func8("🚩 LESS WARNING MULTI BANG ( LESS STICK )", v6, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 MULTI-TARGET BANG LOADED 💀 ---//---MULTI TARGET AK SATH PELU 💀🔥----||----TARGET BHAGNA KA LIYA READY HOGYA 🤣💀--------------///---------------EXECUTED BY YADSAN 😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/FHe8jsnx/raw"))()
end)

func8("☣ MINI V1 ADMIN", v6, function()
	loadstring(game:HttpGet("https://pastefy.app/gCVTDaHs/raw"))()
end)

func8("💦 ONLY BANG ADMIN", v6, function()
	loadstring(game:HttpGet("https://pastefy.app/NqSMw2TV/raw"))()
end)

func8("🕸 INFINITY YIELD", v6, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

func8("🛍 OUTFIT REVEALER", v7, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 OUTFIT REVEALER 🤫 ___________________________SEARCH THE NAME OR ID IN THE AVATAR SHOP 🍃🍃____________________________GET WHOLE FIT INCLUDING BODY AND ANIMATIONS 😏...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/xqmGeByg/raw"))()
end)

func8("🎭 7YD7 EMOTE", v7, function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))()
end)

func8("✨ GAZE EMOTE", v7, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
end)

func8("💃 COPY EMOTE (UPDATED)", v7, function()
	loadstring(game:HttpGet("https://pastefy.app/WLn8fxQv/raw"))()
end)

func8("🪓 SKY DESTROYER", v7, function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-sky-destroyer-V2-AXEZZ-110640"))()
end)

func8("🧍‍♂️ STAND BY", v7, function()
	loadstring(game:HttpGet("https://pastefy.app/QQxZYduW/raw"))()
end)

func8("🎈 HEADSTAND", v7, function()
	loadstring(game:HttpGet("https://pastebin.com/raw/1zxuPzS4"))()
end)

local flag5 = false
local FallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight

local function func19()
	flag5 = not flag5
	if flag5 then
		workspace.FallenPartsDestroyHeight = (0/0)
		print("✅ [ANTI-VOID 2] ENABLED - You are now protected from void")
	else
		workspace.FallenPartsDestroyHeight = FallenPartsDestroyHeight
		print("❌ [ANTI-VOID 2] DISABLED")
	end
end

func8("💨 ANTI-VOID (BEST TO USE)", v8, function(arg1)
	func19()
	arg1.Text = flag5 and "💨 ANTI-VOID 2: ON" or "💨 ANTI-VOID 2: OFF"
end)

local connection4
local flag6 = false

local function func20()
	if connection4 then
		return
	end

	local function func(character)
		local Humanoid = character:WaitForChild("Humanoid")
		Humanoid.Sit = false
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	end

	if LocalPlayer.Character then
		func(LocalPlayer.Character)
	end

	connection4 = LocalPlayer.CharacterAdded:Connect(func)
end

local function func21()
	if not connection4 then
		return
	end

	connection4:Disconnect()
	connection4 = nil
	local v1 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")

	if v1 then
		v1.Sit = false
		v1:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
	end
end

func8("🚫 ANTI-SIT", v8, function(arg1)
	flag6 = not flag6
	if flag6 then
		func20()
		arg1.Text = "🪑 ANTI-SIT: ON"
	else
		func21()
		arg1.Text = "🚫 ANTI-SIT: OFF"
	end
end)

func8("👑 ANTIVOID (GOD MODE)", v8, function(arg1)
	_G.AntiVoid = not _G.AntiVoid
	arg1.Text = "👑 ANTI-VOID: " .. (_G.AntiVoid and "ON" or "OFF")
end)

func8("🔄 REVERSE FLING", v8, function()
	local bodyAngularVelocity = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
	bodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bodyAngularVelocity.AngularVelocity = Vector3.new(0, 999999, 0)
end)

func8("🔥 ANTI-FLING", v8, function()
	RunService.Stepped:Connect(function()
		for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end
	end)
end)

func8("😴 ANTI-AFK", v8, function()
	LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		wait(1)
	end)
end)

func8("🪐 TELEPORTER", v9, function()
	local v1 = func1("TELEPORTER V1 BY YADSAN 🚄 ____________________________________________________________________________________________________________________AJA TERI RAIL BNATA HU 💀😂...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastebin.com/raw/EUSknnAF"))()
end)

func8("⚓ TELEPORTER + VOID", v9, function()
	local v1 = func1("TELEPORTER V2 BY YADSAN 😈 ________________________________________________________________________________________________________CELESTIAL SYNDICATE GV1 🗿 KA TELEPORTER SA LAG HORA 😎😂 ?...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastebin.com/raw/216FSAFS"))()
end)

func8("🌪️ AUTO FAKEOUT (UNLIMITED)", v9, function()
	local v1 = func1("FAKEOUT BY YADSAN 🔥 ________________________________________________________________________________________________________________________________CELESTIAL SYNDICATE GV1 🗿 FAKEOUT Loaded...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/2tDbRvzo/raw"))()
end)

func8("😏 ANTI-BANG V1", v9, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 ANTI-BANG V1 LOADED 💀 ____________________________________________________________________________________________________________TABAHI MODE ON BANG KAR AB MX 😂💀")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/LWt8j0ex/raw"))()
end)

func8("🔥 ANTI-BANG V2", v9, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 ANTI-BANG V2 LOADED 🔥 _______________________________________________________________________________________________AO BETA YADSAN KA ANTI-BANG KI POWER DEKHO 💪😂")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/6XjwR6a0/raw"))()
end)

func8("🎃 ANTI-BANG V3", v9, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 ANTI-BANG V3 LOADED 😎 ___________________________________________________________________________________KYA HUA BETA ? BANG YADSAN KA ANTI-BANG SA DFFN H0 GYA 🤣💀")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/Kdj1vXgq/raw"))()
end)

func8("🕳 SKY AND VOID FALL", v9, function()
	local v1 = func1("SKY AND VOID FALLER BY YADSAN 🕳 ___________________________________________________________________________________________________________KOI SA BHI BANG KAR LE AB 💀😂...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/R19boYKQ/raw"))()
end)

func8("👻 CELESTIAL SYNDICATE GV1 SHIELD", v9, function()
	local v1 = func1("CELESTIAL SYNDICATE GV1 SHIELD LOADED 🛡________________________________________________________________________________________________________________________FULL SET OF SHIELDS 😎✨")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastefy.app/vmNCFqWA/raw"))()
end)

func8("🎵 MUSIC PLAYER", v10, function()
	local v1 = func1("MUSIC PLAYER EXECUTED 🎶____________________________________________________________________________________________FEEL THA AURA 🗿...")
	local TextChatService = game:GetService("TextChatService")

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(v1)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v1, "All")
	end

	loadstring(game:HttpGet("https://pastebin.com/raw/rnNdW3Hd"))()
end)

local textLabel1 = Instance.new("TextLabel", v11)
textLabel1.Size = UDim2.new(1, -5, 1, 0)
textLabel1.BackgroundTransparency = 1
textLabel1.TextColor3 = Color3.new(1, 1, 1)
textLabel1.TextSize = 20
textLabel1.Font = Enum.Font.GothamBold
textLabel1.TextWrapped = true
textLabel1.TextYAlignment = "Top"
textLabel1.Text = "👑 OWNER - YADSAN \n\n🔳 Rᴏʙʟᴏx ID- Univers_DaddyXD, luckyhuywr \n\n♣ Iɴsᴛᴀɢʀᴀᴍ ID- \n\n🌐 CELESTIAL X ASUKA X ZM \n\n🔥 Bᴀɴɢ ᴀɴᴅ Sᴘᴀᴍ ᴛᴏ Dᴇsᴛʀᴏʏ Aɴʏᴏɴᴇ 🔥\n\n▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\n\n💠 Rᴏʙʟᴏx Uѕᴇʀɴᴀᴍᴇ- Yadsan_Godverse\n\n💠 Sᴄʀɪᴘᴛ Wɪᴛʜ Uɴʙᴇʟɪᴇᴠᴀʙʟᴇ Fᴇᴀᴛᴜʀᴇs ♠"

RunService.Stepped:Connect(function()
	if _G.Noclip then
		for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end
	end

	if _G.Spin then
		local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
		HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, 1718.8733853924696, 0)
	end

	if _G.AntiTarget then
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				pcall(function()
					player.Character.HumanoidRootPart.CanCollide = false
				end)
			end
		end
	end
end)

RunService.Heartbeat:Connect(function()
	if
		_G.AntiVoid
		and LocalPlayer.Character
		and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		and LocalPlayer.Character.HumanoidRootPart.Position.Y < -50
	then
		LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
			LocalPlayer.Character.HumanoidRootPart.Position.X,
			45,
			LocalPlayer.Character.HumanoidRootPart.Position.Z
		)
	end
end)

UserInputService.JumpRequest:Connect(function()
	if _G.InfJump then
		LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

local textButton = Instance.new("TextButton", screenGui)
textButton.Size = UDim2.new(0, 70, 0, 70)
textButton.Position = UDim2.new(0, 20, 0.5, 0)
textButton.BackgroundColor3 = v1.mainBg
textButton.BackgroundTransparency = 0.2
textButton.Text = v2
textButton.TextColor3 = v1.accent
textButton.TextSize = 32
textButton.Font = Enum.Font.GothamBlack
Instance.new("UICorner", textButton).CornerRadius = UDim.new(1, 0)
local uIStroke2 = Instance.new("UIStroke", textButton)
uIStroke2.Thickness = 3
uIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uIStroke2.Color = v1.accent

spawn(function()
	while textButton.Parent do
		uIStroke2.Color = Color3.fromHSV(tick() % 5 / 5, 0.85, 1)
		wait(0.03)
	end
end)

func3(textButton)

textButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
