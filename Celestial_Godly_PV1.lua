BACKEND_URL = "https://widow-complicated-squirrel.abasthan.app"
LOADER_ID = "67bb60619797"
LOADER_NAME = "Life together"
KEYLESS = true


local v1 = "yadsan_" .. tostring(LOADER_ID) .. ".key"
local v2 = "yadsan_" .. tostring(LOADER_ID) .. ".session"
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
local HapticService = game:GetService("HapticService")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local PlaceId = game.PlaceId
local GameId = game.GameId
local tbl = {discord = "", website = ""}
local func24

local function func(arg1, arg2)
	if type(arg1) ~= "string" or arg1 == "" then
		local v1 = "No " .. arg2 .. " link set for this loader."
		local str = "Yadsan Key System"
		local num = 4

		if func24 then
			pcall(func24, "Yadsan Key System", v1, 4, "warn")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str, Text = v1, Duration = num or 4})
			end)
		end

		return
	end

	local v2 = setclipboard or toclipboard or syn and syn.write_clipboard

	if v2 and pcall(v2, arg1) then
		local v3 = arg2 .. " link copied to clipboard"
		local str1 = "Yadsan Key System"
		local num1 = 4

		if func24 then
			pcall(func24, "Yadsan Key System", v3, 4, "ok")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str1, Text = v3, Duration = num1 or 4})
			end)
		end
	else
		pcall(function()
			GuiService:OpenBrowserWindow(arg1)
		end)

		local v4 = "Opening " .. arg2 .. " link..."
		local str2 = "Yadsan Key System"
		local num2 = 4

		if func24 then
			pcall(func24, "Yadsan Key System", v4, 4, "ok")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str2, Text = v4, Duration = num2 or 4})
			end)
		end
	end
end

local tbl1 = {
	bg1 = Color3.fromRGB(18, 12, 34),
	bg2 = Color3.fromRGB(5, 3, 11),
	panel = Color3.fromRGB(20, 15, 34),
	card = Color3.fromRGB(30, 23, 48),
	stroke = Color3.fromRGB(56, 42, 88),
	violet = Color3.fromRGB(124, 58, 237),
	fuchsia = Color3.fromRGB(217, 70, 239),
	blue = Color3.fromRGB(59, 130, 246),
	soft = Color3.fromRGB(196, 181, 253),
	text = Color3.fromRGB(255, 255, 255),
	sub = Color3.fromRGB(161, 161, 176),
	muted = Color3.fromRGB(110, 106, 130),
	ok = Color3.fromRGB(52, 211, 153),
	warn = Color3.fromRGB(251, 191, 36),
	bad = Color3.fromRGB(248, 113, 113),
}

local tweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo1 = TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function func1(arg1)
	local v1 = syn and syn.request or http and http.request or http_request or request

	if not v1 then
		error("Executor does not support HTTP requests.")
	end

	return v1(arg1)
end

local function func2(arg1, arg2, arg3)
	local v1 = arg2 or 1
	local num = 1
	local str = "unknown error"

	if v1 == v1 then
		if not (1 > v1) then
			local v3

			while true do
				local v2
				v2, v3 = pcall(func1, arg1)

				if v2 and type(v3) == "table" and v3.Body and (v3.StatusCode or 0) < 500 then
					break
				end

				str = v2 and "HTTP " .. tostring(v3 and v3.StatusCode) or tostring(v3)

				if num < v1 then
					if arg3 then
						arg3(num)
					end
					task.wait(4)
				end

				num = num + 1

				if num > v1 then
					return nil, str
				end
			end

			return v3
		end
	end

	return nil, str
end

local function func3(arg1)
	local ok, result = pcall(function()
		return HttpService:JSONDecode(arg1)
	end)
	return ok and type(result) == "table" and result or nil
end

local function func4(arg1, arg2, arg3)
	local v1 = func2({
		Url = BACKEND_URL .. arg1,
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = HttpService:JSONEncode(arg2),
	}, arg3 or 1)
	return v1 and func3(v1.Body)
end

local function func5()
	local ok, result = pcall(function()
		if gethwid then
			return gethwid()
		end
		return game:GetService("RbxAnalyticsService"):GetClientId()
	end)
	return ok and result and tostring(result) or "unknown"
end

local function func6()
	local v2 = getgenv and getgenv().script_key or rawget(_G, "script_key")

	if type(v2) == "string" and v2 ~= "" then
		return v2
	end

	local ok, result = pcall(function()
		if isfile and readfile and isfile(v1) then
			return readfile(v1)
		end
	end)

	return ok and type(result) == "string" and result:gsub("%s+", "") or ""
end

local function func7()
	local ok, result = pcall(function()
		if isfile and readfile and isfile(v2) then
			return readfile(v2)
		end
	end)
	return ok and type(result) == "string" and result:gsub("%s+", "") or ""
end

local function func8(arg1)
	if type(arg1) ~= "function" then
		return false
	end

	local ok, result = pcall(iscclosure, arg1)

	if not ok then
		return true
	end

	return result == true
end

local v3

RAW_LOADSTRING, v3 = (function(arg1, arg2)
	local v1 = rawget(_G, arg1) or arg2

	if clonefunction then
		local ok, result = pcall(clonefunction, v1)
		if ok and type(result) == "function" then
			return result
		end
	end

	return v1
end)("loadstring", loadstring), nil

local ok, result = pcall(getrawmetatable, game)

if ok and result then
	local ok1, result1 = pcall(rawget, result, "__namecall")
	if ok1 then
		v3 = result1
	end
end

local tbl2 = {}
local raw_loadstring = RAW_LOADSTRING

if raw_loadstring ~= nil then
	if not func8(raw_loadstring) then
		table.insert(tbl2, "loadstring")
	end
end

local HttpGet = game.HttpGet

if HttpGet ~= nil then
	if not func8(HttpGet) then
		table.insert(tbl2, "HttpGet")
	end
end

local HttpGetAsync = game.HttpGetAsync

if HttpGetAsync ~= nil then
	if not func8(HttpGetAsync) then
		table.insert(tbl2, "HttpGetAsync")
	end
end

if v3 ~= nil then
	if not func8(v3) then
		table.insert(tbl2, "__namecall")
	end
end

local v4 = syn and syn.request or http and http.request or http_request or request

if v4 ~= nil then
	if not func8(v4) then
		table.insert(tbl2, "request")
	end
end

local flag = false
local ok2, result2 = pcall(iscclosure, tostring)

if ok2 and result2 == true and #tbl2 > 0 and #tbl2 < 4 then
	flag = true
end

if flag then
	task.spawn(function()
		pcall(function()
			func1({
				Url = BACKEND_URL .. "/api/report-hook",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = HttpService:JSONEncode({loader_id = LOADER_ID, findings = tbl2, userId = tostring(LocalPlayer.UserId), hwid = func5()}),
			})
		end)
	end)
end

if KEYLESS == true then
	local token
	local num = 0
	local tbl3 = {}

	local function func9()
		if not token then
			return
		end
		pcall(func1, {
			Url = BACKEND_URL .. "/api/offline",
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({token = token}),
		})
	end

	tbl3.unsupported = "This game is not supported by this loader."
	tbl3.banned = "Your access to this loader is blocked."
	tbl3.maintenance = "This loader is in maintenance. Try again later."
	tbl3.key_required = "This loader now needs a key. Ask the owner."
	tbl3.no_script = "This loader has no script yet."
	tbl3.bad_request = "Loader setup error. Contact the owner."
	tbl3.unreachable = "Server is waking up. Run the loader again in a few seconds."

	local function func10()
		local message
		local reason
		local num = 1

		while true do
			local tbl = {
				Url = BACKEND_URL .. "/api/open/join",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
			}

			local tbl1 = {
				loader_id = tostring(LOADER_ID),
				userId = tostring(LocalPlayer.UserId),
				username = LocalPlayer.Name,
			}

			local ok, result = pcall(function()
				if gethwid then
					return gethwid()
				end
				return game:GetService("RbxAnalyticsService"):GetClientId()
			end)

			tbl1.hwid = ok and result and tostring(result) or "unknown"
			tbl1.gameId = tostring(GameId)
			tbl.Body = HttpService:JSONEncode(tbl1)
			local v1 = func2(tbl, 2)
			local v2 = v1

			if v1 then
				local Body = v1.Body

				local ok1, result1 = pcall(function()
					return HttpService:JSONDecode(Body)
				end)

				v2 = ok1 and type(result1) == "table" and result1 or nil
			end

			if v2 and v2.success then
				return v2
			end

			if v2 then
				message = v2.message
				reason = v2.reason
			end

			if not (v2 and (v2.reason == "banned" or v2.reason == "unsupported" or v2.reason == "maintenance" or v2.reason == "key_required" or v2.reason == "no_script")) then
				task.wait(num * 2)
				num = num + 1

				if not (num > 3) then
					continue
				end
			end

			break
		end

		return nil, reason, message
	end

	local function func11(arg1)
		if type(arg1) ~= "string" or arg1:match("^%s*$") then
			local str = "Yadsan Key System"
			local str1 = "This loader has no script yet."
			local num = 6

			if func24 then
				pcall(func24, "Yadsan Key System", "This loader has no script yet.", 6, "warn")
			else
				pcall(function()
					StarterGui:SetCore("SendNotification", {Title = str, Text = str1, Duration = num or 4})
				end)
			end

			return
		end

		local v1 = arg1:gsub("^\239\187\191", "")
		local v2 = v1

		if v1:match("^%s*https?://%S+%s*$") then
			local v3 = v1:match("^%s*(%S+)%s*$")

			local ok, result = pcall(function()
				return game:HttpGet(v3)
			end)

			if not ok or type(result) ~= "string" or result == "" then
				local str2 = "Yadsan Key System"
				local str3 = "Could not download the script."
				local num1 = 6

				if func24 then
					pcall(func24, "Yadsan Key System", "Could not download the script.", 6, "warn")
				else
					pcall(function()
						StarterGui:SetCore("SendNotification", {Title = str2, Text = str3, Duration = num1 or 4})
					end)
				end

				return
			end

			v2 = result
		end

		local tbl = {}

		if type(RAW_LOADSTRING) == "function" then
			table.insert(tbl, RAW_LOADSTRING)
		end

		if type(loadstring) == "function" and loadstring ~= RAW_LOADSTRING then
			table.insert(tbl, loadstring)
		end

		local v5

		for _, v4 in ipairs(tbl) do
			local ok1, result1 = pcall(v4, v2)
			if ok1 and type(result1) == "function" then
				v5 = result1
				break
			end
		end

		if not v5 then
			local str4 = "Yadsan Key System"
			local str5 = "Script failed to compile."
			local num2 = 8

			if func24 then
				pcall(func24, "Yadsan Key System", "Script failed to compile.", 8, "bad")
			else
				pcall(function()
					StarterGui:SetCore("SendNotification", {Title = str4, Text = str5, Duration = num2 or 4})
				end)
			end

			return
		end

		task.spawn(function()
			local ok, result = xpcall(v5, function(arg1)
				return tostring(arg1) .. "\n" .. debug.traceback()
			end)
			if not ok then
				local v1 = "Script error: " .. tostring(result):sub(1, 120)
				local str = "Yadsan Key System"
				local num = 8

				if func24 then
					pcall(func24, "Yadsan Key System", v1, 8, "bad")
				else
					pcall(function()
						StarterGui:SetCore("SendNotification", {Title = str, Text = v1, Duration = num or 4})
					end)
				end
			end
		end)
	end

	task.spawn(function()
		local v1, v2, v3 = func10()

		if not v1 then
			local v4 = v2 and tbl3[v2] or v3 or tbl3.unreachable
			local str = "Yadsan Key System"
			local num1 = 8

			if func24 then
				pcall(func24, "Yadsan Key System", v4, 8, "warn")
			else
				pcall(function()
					StarterGui:SetCore("SendNotification", {Title = str, Text = v4, Duration = num1 or 4})
				end)
			end

			return
		end

		local token1 = v1.token
		token = v1.token

		task.spawn(function()
			local v2

			while true do
				task.wait(15)
				local tbl = {}
				tbl.Url = BACKEND_URL .. "/api/open/heartbeat"
				tbl.Method = "POST"
				tbl.Headers = {["Content-Type"] = "application/json"}
				tbl.Body = HttpService:JSONEncode({token = token1})
				local v1 = func2(tbl, 2)
				v2 = v1

				if v1 then
					local Body = v1.Body

					local ok, result = pcall(function()
						return HttpService:JSONDecode(Body)
					end)

					v2 = ok and type(result) == "table" and result or nil
				end

				if v2 and v2.success == false and v2.reason ~= "disabled" then
					break
				end

				local v3 = v2 and v2.success and tonumber(v2.message_id)

				if v3 and v3 ~= 0 and v3 ~= num then
					num = v3
					local str = tostring(v2.message or "")
					local str1 = "Yadsan Key System announcement"
					local num1 = 8

					if func24 then
						pcall(func24, "Yadsan Key System announcement", str, 8, nil)
					else
						pcall(function()
							StarterGui:SetCore("SendNotification", {Title = str1, Text = str, Duration = num1 or 4})
						end)
					end
				end
			end

			local message = v2.message
			token = nil
			message = message or "Session ended."
			local str2 = "Yadsan Key System"
			local messageRef = message
			local num2 = 6

			if func24 then
				pcall(func24, "Yadsan Key System", messageRef, 6, "warn")
			else
				pcall(function()
					StarterGui:SetCore("SendNotification", {Title = str2, Text = messageRef, Duration = num2 or 4})
				end)
			end
		end)

		func11(v1.script)
	end)

	pcall(function()
		game:BindToClose(func9)
	end)

	Players.PlayerRemoving:Connect(function(player)
		if player == LocalPlayer then
			func9()
		end
	end)

	return
end

local function func12(parent, arg2)
	local uICorner = Instance.new("UICorner")
	uICorner.CornerRadius = arg2 or UDim.new(0, 12)
	uICorner.Parent = parent
	return uICorner
end

local function func13(parent, color, arg3)
	local uIStroke = Instance.new("UIStroke")
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = color
	uIStroke.Thickness = arg3 or 1
	uIStroke.Parent = parent
	return uIStroke
end

local function func14(parent, position, size, backgroundColor3, arg5)
	local frame = Instance.new("Frame")
	frame.BorderSizePixel = 0
	frame.Position = position
	frame.Size = size
	frame.BackgroundColor3 = backgroundColor3
	frame.Parent = parent

	if arg5 then
		func12(frame, UDim.new(0, arg5))
		func12(frame, UDim.new(0, arg5))
	end

	return frame
end

local function func15(parent, arg2, arg3, arg4)
	local uIGradient = Instance.new("UIGradient")
	uIGradient.Color = ColorSequence.new(arg2, arg3)
	uIGradient.Rotation = arg4 or 0
	uIGradient.Parent = parent
	return uIGradient
end

local function func16(parent, text, textSize, textColor3, font, position, size, arg8)
	local textLabel = Instance.new("TextLabel")
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.TextSize = textSize
	textLabel.TextColor3 = textColor3
	textLabel.Font = font
	textLabel.Position = position
	textLabel.Size = size
	textLabel.TextXAlignment = arg8 or Enum.TextXAlignment.Left
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.Parent = parent
	return textLabel
end

local tbl4 = {}

local function func17(parent, backgroundColor3, arg3)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Parent = parent

	for i = 1, arg3 do
		local frame1 = Instance.new("Frame")
		frame1.AnchorPoint = Vector2.new(0.5, 0.5)
		frame1.Position = UDim2.fromScale(0.5, 0.5)
		local v1 = (i - 1) / arg3
		local v2 = 1 - v1
		frame1.Size = UDim2.fromScale(v2, v2)
		frame1.BackgroundColor3 = backgroundColor3
		frame1.BackgroundTransparency = 0.955
		frame1.BorderSizePixel = 0
		frame1.Parent = frame
		func12(frame1, UDim.new(1, 0))
		func12(frame1, UDim.new(1, 0))
	end

	return frame
end

local function func18(arg1, arg2)
	local tbl = {}

	for i = 0, arg2 * 2 do
		local v1 = #tbl
		tbl[v1 + 1] = NumberSequenceKeypoint.new(i / (arg2 * 2), i % 2 == 0 and 0 or 1)
	end

	arg1.Transparency = NumberSequence.new(tbl)
end

local tbl5 = {core = tbl4, topbar = true, chatbar = false, touch = true, cg = {}}

for _, enumItem in ipairs(Enum.CoreGuiType:GetEnumItems()) do
	if enumItem ~= Enum.CoreGuiType.All then
		pcall(function()
			tbl5.core[enumItem] = StarterGui:GetCoreGuiEnabled(enumItem)
		end)
	end
end

pcall(function()
	tbl5.topbar = StarterGui:GetCore("TopbarEnabled") ~= false
end)

pcall(function()
	tbl5.chatbar = StarterGui:GetCore("ChatBarDisabled") == true
end)

local function func19()
	for _, enumItem in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		pcall(function()
			StarterGui:SetCoreGuiEnabled(enumItem, false)
		end)
	end

	pcall(function()
		StarterGui:SetCore("TopbarEnabled", false)
	end)

	pcall(function()
		StarterGui:SetCore("ChatBarDisabled", true)
	end)

	pcall(function()
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local v1 = PlayerGui and PlayerGui:FindFirstChild("TouchGui")

		if v1 then
			v1.Enabled = false
		end
	end)

	pcall(function()
		local CoreGui = game:GetService("CoreGui")
		for _, v1 in ipairs({"TopBarApp", "ExperienceChat"}) do
			local v2 = CoreGui:FindFirstChild(v1)
			if v2 and v2:IsA("ScreenGui") then
				if tbl5.cg[v1] == nil then
					tbl5.cg[v1] = v2.Enabled
				end
				v2.Enabled = false
			end
		end
	end)
end

local flag1 = true
func19()

task.spawn(function()
	while flag1 do
		task.wait(0.5)
		if flag1 then
			func19()
		end
	end
end)

local function func20()
	flag1 = false

	for k, v1 in pairs(tbl5.core) do
		pcall(function()
			StarterGui:SetCoreGuiEnabled(k, v1)
		end)
	end

	pcall(function()
		StarterGui:SetCore("TopbarEnabled", tbl5.topbar)
	end)

	pcall(function()
		StarterGui:SetCore("ChatBarDisabled", tbl5.chatbar)
	end)

	pcall(function()
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		local v1 = PlayerGui and PlayerGui:FindFirstChild("TouchGui")

		if v1 then
			v1.Enabled = true
		end
	end)

	pcall(function()
		local CoreGui = game:GetService("CoreGui")
		for k, v1 in pairs(tbl5.cg) do
			local v2 = CoreGui:FindFirstChild(k)
			if v2 and v2:IsA("ScreenGui") then
				v2.Enabled = v1
			end
		end
	end)
end

local function func21()
	local ok, result = pcall(function()
		return gethui and gethui() or game:GetService("CoreGui")
	end)
	return ok and result or nil
end

local function func22(arg1)
	local v1 = func21()
	if not (v1 and pcall(function()
		arg1.Parent = v1
	end) and arg1.Parent) then
		arg1.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end
end

local tbl6 = {}
local CoreGui = game:GetService("CoreGui")
local v5 = func21()
local v6 = table.pack(LocalPlayer:FindFirstChild("PlayerGui"))
tbl6[1], tbl6[2] = CoreGui, v5
local v7 = table.pack(table.unpack(v6, 1, v6.n))
table.move(v7, 1, v7.n, 3, tbl6)

for _, v8 in ipairs(tbl6) do
	if v8 then
		for _, v9 in ipairs({"GX_KeyGui", "GX_Toasts"}) do
			local v10 = v8:FindFirstChild(v9)
			if v10 then
				v10:Destroy()
			end
		end
	end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GX_Toasts"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 2147483647
func22(screenGui)
local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.Position = UDim2.new(0.5, 0, 0, 18)
frame.Size = UDim2.fromOffset(340, 0)
frame.AutomaticSize = Enum.AutomaticSize.Y
frame.BackgroundTransparency = 1
frame.Parent = screenGui
local uIListLayout = Instance.new("UIListLayout")
uIListLayout.Padding = UDim.new(0, 8)
uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uIListLayout.Parent = frame
local tbl7 = {ok = tbl1.ok, warn = tbl1.warn, bad = tbl1.bad}
local num1 = 0

local function func23(arg1)
	return string.format(
		"#%02x%02x%02x",
		math.floor(arg1.R * 255 + 0.5),
		math.floor(arg1.G * 255 + 0.5),
		math.floor(arg1.B * 255 + 0.5)
	)
end

function func24(arg1, arg2, arg3, arg4)
	num1 = num1 + 1
	local Children = frame:GetChildren()
	local num = 0

	for _, v1 in ipairs(Children) do
		if v1:IsA("Frame") then
			num = num + 1
		end
	end

	if num >= 4 then
		for _, v2 in ipairs(Children) do
			if v2:IsA("Frame") then
				v2:Destroy()
				break
			end
		end
	end

	local v3 = tbl7[arg4] or tbl1.soft
	local frame1 = Instance.new("Frame")
	frame1.LayoutOrder = num1
	frame1.Size = UDim2.new(1, 0, 0, 0)
	frame1.AutomaticSize = Enum.AutomaticSize.Y
	frame1.BackgroundColor3 = Color3.fromRGB(26, 19, 44)
	frame1.BackgroundTransparency = 1
	frame1.BorderSizePixel = 0
	frame1.Parent = frame
	func12(frame1, UDim.new(0, 16))
	func12(frame1, UDim.new(0, 16))
	local uIGradient = Instance.new("UIGradient")
	uIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(170, 140, 255))
	uIGradient.Rotation = 90
	uIGradient.Parent = frame1
	local v4 = func13(frame1, Color3.new(1, 1, 1), 1)
	v4.Transparency = 1
	local uIPadding = Instance.new("UIPadding")
	local uDim = UDim.new(0, 11)
	local uDim1 = UDim.new(0, 12)
	uIPadding.PaddingTop = uDim
	uIPadding.PaddingBottom = uDim1
	local uDim2 = UDim.new(0, 16)
	local uDim3 = UDim.new(0, 16)
	uIPadding.PaddingLeft = uDim2
	uIPadding.PaddingRight = uDim3
	uIPadding.Parent = frame1
	local uIListLayout = Instance.new("UIListLayout")
	uIListLayout.Padding = UDim.new(0, 3)
	uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout.Parent = frame1
	local textLabel = Instance.new("TextLabel")
	textLabel.LayoutOrder = 1
	textLabel.BackgroundTransparency = 1
	textLabel.Size = UDim2.new(1, 0, 0, 16)
	textLabel.RichText = true
	local v5 = func23(v3)
	local v6 = table.pack(tostring(arg1))
	textLabel.Text = ('<font color="%s">●</font>  %s').format('<font color="%s">●</font>  %s', v5, table.unpack(v6, 1, v6.n))
	textLabel.TextColor3 = tbl1.soft
	textLabel.TextSize = 13
	textLabel.Font = Enum.Font.GothamBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.TextTransparency = 1
	textLabel.TextTruncate = Enum.TextTruncate.AtEnd
	textLabel.Parent = frame1
	local textLabel1 = Instance.new("TextLabel")
	textLabel1.LayoutOrder = 2
	textLabel1.BackgroundTransparency = 1
	textLabel1.Size = UDim2.new(1, 0, 0, 0)
	textLabel1.AutomaticSize = Enum.AutomaticSize.Y
	textLabel1.Text = tostring(arg2)
	textLabel1.TextColor3 = tbl1.text
	textLabel1.TextSize = 14
	textLabel1.Font = Enum.Font.GothamMedium
	textLabel1.TextWrapped = true
	textLabel1.TextXAlignment = Enum.TextXAlignment.Left
	textLabel1.TextYAlignment = Enum.TextYAlignment.Top
	textLabel1.TextTransparency = 1
	textLabel1.Parent = frame1

	local function func(arg1)
		local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(frame1, tweenInfo, {BackgroundTransparency = arg1 and 0.16 or 1}):Play()
		TweenService:Create(v4, tweenInfo, {Transparency = arg1 and 0.7 or 1}):Play()
		TweenService:Create(textLabel, tweenInfo, {TextTransparency = arg1 and 0 or 1}):Play()
		TweenService:Create(textLabel1, tweenInfo, {TextTransparency = arg1 and 0 or 1}):Play()
	end

	func(true)

	task.delay(arg3 or 4, function()
		if not frame1.Parent then
			return
		end

		func(false)
		task.wait(0.3)

		if frame1.Parent then
			frame1:Destroy()
		end
	end)
end

local screenGui1 = Instance.new("ScreenGui")
screenGui1.Name = "GX_KeyGui"
screenGui1.ResetOnSpawn = false
screenGui1.IgnoreGuiInset = true
screenGui1.DisplayOrder = 2147483645
func22(screenGui1)

local ok3, result3 = pcall(function()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "GX_Rim"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 2147483646
	func22(screenGui)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromScale(1, 1)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Parent = screenGui
	func12(frame, UDim.new(0, 40))
	func12(frame, UDim.new(0, 40))

	local tbl = {
		NumberSequenceKeypoint.new(0, 0.35),
		NumberSequenceKeypoint.new(0.2, 0.35),
		NumberSequenceKeypoint.new(0.25, 0),
		NumberSequenceKeypoint.new(0.3, 0.35),
		NumberSequenceKeypoint.new(0.7, 0.35),
		NumberSequenceKeypoint.new(0.75, 0),
		NumberSequenceKeypoint.new(0.8, 0.35),
		NumberSequenceKeypoint.new(1, 0.35),
	}

	local v1 = func13(frame, Color3.new(1, 1, 1), 4)
	local v2 = func15(v1, tbl1.violet, tbl1.fuchsia, 0)
	v2.Transparency = NumberSequence.new(tbl)
	local v3 = func13(frame, Color3.new(1, 1, 1), 14)
	local v4 = func15(v3, tbl1.violet, tbl1.fuchsia, 0)

	v4.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.2, 1),
		NumberSequenceKeypoint.new(0.25, 0.4),
		NumberSequenceKeypoint.new(0.3, 1),
		NumberSequenceKeypoint.new(0.7, 1),
		NumberSequenceKeypoint.new(0.75, 0.4),
		NumberSequenceKeypoint.new(0.8, 1),
		NumberSequenceKeypoint.new(1, 1),
	})

	local connection = RunService.RenderStepped:Connect(function()
		local v1 = os.clock()
		v2.Rotation = v1 * 75 % 360
		v4.Rotation = v1 * 75 % 360
	end)

	screenGui1.Destroying:Connect(function()
		connection:Disconnect()
		screenGui:Destroy()
	end)
end)

if not ok3 then
	warn("[GX rim] LED rim failed: " .. tostring(result3))
end

local v11 = func14(screenGui1, UDim2.new(), UDim2.fromScale(1, 1), Color3.new(0, 0, 0), nil)
v11.Active = false
v11.BackgroundTransparency = 1
local frame1 = Instance.new("Frame")
frame1.AnchorPoint = Vector2.new(0, 0)
frame1.Position = UDim2.fromScale(0, 0)
frame1.Size = UDim2.fromScale(1, 1)
frame1.BackgroundTransparency = 1
frame1.Parent = screenGui1
local uIScale = Instance.new("UIScale")
uIScale.Parent = frame1
local frame2 = Instance.new("Frame")
frame2.AnchorPoint = Vector2.new(0, 0)
frame2.Position = UDim2.fromScale(0, 0)
frame2.Size = UDim2.fromScale(1, 1)
frame2.BackgroundColor3 = Color3.new(1, 1, 1)
frame2.BorderSizePixel = 0
frame2.Parent = frame1
func15(frame2, tbl1.bg1, tbl1.bg2, 125)
func12(frame2, UDim.new(0, 40))
func12(frame2, UDim.new(0, 40))
local v12 = func13(frame2, Color3.new(1, 1, 1), 3)
local v13 = func15(v12, tbl1.violet, tbl1.fuchsia, 0)

v13.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0.5),
	NumberSequenceKeypoint.new(0.2, 0.5),
	NumberSequenceKeypoint.new(0.25, 0),
	NumberSequenceKeypoint.new(0.3, 0.5),
	NumberSequenceKeypoint.new(0.7, 0.5),
	NumberSequenceKeypoint.new(0.75, 0),
	NumberSequenceKeypoint.new(0.8, 0.5),
	NumberSequenceKeypoint.new(1, 0.5),
})

local canvasGroup = Instance.new("CanvasGroup")
canvasGroup.BackgroundTransparency = 1
canvasGroup.Size = UDim2.fromScale(1, 1)
canvasGroup.Parent = frame2
func12(canvasGroup, UDim.new(0, 40))
func12(canvasGroup, UDim.new(0, 40))

pcall(function()
	local v1 = func13(frame2, Color3.new(1, 1, 1), 9)
	local v2 = func15(v1, tbl1.violet, tbl1.fuchsia, 0)

	v2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.2, 1),
		NumberSequenceKeypoint.new(0.25, 0.45),
		NumberSequenceKeypoint.new(0.3, 1),
		NumberSequenceKeypoint.new(0.7, 1),
		NumberSequenceKeypoint.new(0.75, 0.45),
		NumberSequenceKeypoint.new(0.8, 1),
		NumberSequenceKeypoint.new(1, 1),
	})

	local connection = RunService.RenderStepped:Connect(function()
		v2.Rotation = os.clock() * 75 % 360
	end)

	screenGui1.Destroying:Connect(function()
		connection:Disconnect()
	end)
end)

local tbl8 = {f = func17(canvasGroup, tbl1.violet, 8), x = 0.15, y = 0.2, sp = 0.35, ph = 0, k = 1.3}
local tbl9 = {}
tbl9[2], tbl9[1], tbl9[3] = {f = func17(canvasGroup, tbl1.fuchsia, 8), x = 0.85, y = 0.85, sp = 0.28, ph = 2, k = 1.1}, tbl8, {f = func17(canvasGroup, tbl1.blue, 8), x = 0.6, y = 0.1, sp = 0.22, ph = 4, k = 0.8}
local tbl10 = {}
local random = Random.new(7)

for i = 1, 34 do
	local v14 = random:NextInteger(2, 5)
	local uDim2 = UDim2.new()
	local v15 = UDim2.fromOffset(v14, v14)
	local v16 = i % 3 == 0 and tbl1.fuchsia or tbl1.soft
	local frame3 = Instance.new("Frame")
	frame3.BorderSizePixel = 0
	frame3.Position = uDim2
	frame3.Size = v15
	frame3.BackgroundColor3 = v16
	frame3.Parent = canvasGroup
	func12(frame3, UDim.new(1, 0))
	func12(frame3, UDim.new(1, 0))
	frame3.BackgroundTransparency = random:NextNumber(0.55, 0.9)

	tbl10[i] = {
		f = frame3,
		x = random:NextNumber(),
		y = random:NextNumber(),
		v = random:NextNumber(0.015, 0.05),
		sw = random:NextNumber(0.5, 1.6),
		ph = random:NextNumber(0, 6),
	}
end

local frame4 = Instance.new("Frame")
frame4.AnchorPoint = Vector2.new(0.5, 0.5)
frame4.Position = UDim2.fromScale(0.5, 0.5)
frame4.Size = UDim2.fromOffset(880, 440)
frame4.BackgroundTransparency = 1
frame4.Parent = frame2
local uIScale1 = Instance.new("UIScale")
uIScale1.Parent = frame4

local function func25()
	local ViewportSize = CurrentCamera.ViewportSize
	local v1 = math.min((ViewportSize.X - 40) / 880, (ViewportSize.Y - 40) / 440, 1.5)
	uIScale1.Scale = math.max(0.3, v1)
end

func25()
CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func25)

local function func26(arg1, arg2, arg3)
	local Position = arg1.Position
	local v1 = UDim2.fromOffset(0, arg3 or 22)
	arg1.Position = Position + v1

	task.delay(arg2, function()
		if arg1.Parent then
			TweenService:Create(arg1, tweenInfo1, {Position = Position}):Play()
		end
	end)
end

local frame5 = Instance.new("Frame")
frame5.BackgroundTransparency = 1
frame5.Position = UDim2.fromOffset(28, 22)
frame5.Size = UDim2.fromOffset(96, 96)
frame5.Parent = frame4
local v17 = func17(frame5, tbl1.violet, 6)
v17.Position = UDim2.fromOffset(48, 48)
v17.Size = UDim2.fromOffset(150, 150)

local function func27(arg1, arg2, arg3, arg4, arg5)
	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.fromOffset(48, 48)
	frame.Size = UDim2.fromOffset(arg1, arg1)
	frame.BackgroundTransparency = 1
	frame.Parent = frame5
	func12(frame, UDim.new(1, 0))
	func12(frame, UDim.new(1, 0))
	local v1 = func13(frame, Color3.new(1, 1, 1), arg2)
	local v2 = func15(v1, arg3, arg4, 0)
	func18(v2, arg5)
	return frame
end

local v18 = func27(94, 2.5, tbl1.violet, tbl1.fuchsia, 2)
local v19 = func27(78, 1.5, tbl1.soft, tbl1.violet, 3)
local frame6 = Instance.new("Frame")
frame6.AnchorPoint = Vector2.new(0.5, 0.5)
frame6.Position = UDim2.fromOffset(48, 48)
frame6.Size = UDim2.fromOffset(94, 94)
frame6.BackgroundTransparency = 1
frame6.Parent = frame5
local v20 = func14(frame6, UDim2.new(0.5, 0, 0, 0), UDim2.fromOffset(9, 9), Color3.new(1, 1, 1), nil)
v20.AnchorPoint = Vector2.new(0.5, 0.5)
func12(v20, UDim.new(1, 0))
func12(v20, UDim.new(1, 0))

local function func28(rotation, backgroundTransparency)
	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Position = UDim2.fromOffset(48, 48)
	frame.Size = UDim2.fromOffset(46, 46)
	frame.Rotation = rotation
	frame.BackgroundColor3 = Color3.new(1, 1, 1)
	frame.BackgroundTransparency = backgroundTransparency
	frame.BorderSizePixel = 0
	frame.Parent = frame5
	func12(frame, UDim.new(0, 12))
	func12(frame, UDim.new(0, 12))
	func15(frame, tbl1.violet, tbl1.fuchsia, 135)
	return frame
end

local v21 = func28(0, 0)
local v22 = func28(45, 0.35)
func13(v21, Color3.new(1, 1, 1), 1).Transparency = 0.6
local imageLabel = Instance.new("ImageLabel")
imageLabel.BackgroundTransparency = 1
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.Position = UDim2.fromOffset(48, 48)
imageLabel.Image = "rbxassetid://94896010857183"
imageLabel.Size = UDim2.fromOffset(84, 84)
imageLabel.Parent = frame5
func12(imageLabel, UDim.new(1, 0))
func12(imageLabel, UDim.new(1, 0))
v21.Visible = false
v22.Visible = false

local v23 = func16(
	frame4,
	"Yadsan Key System",
	36,
	Color3.new(1, 1, 1),
	Enum.Font.GothamBlack,
	UDim2.fromOffset(140, 30),
	UDim2.fromOffset(360, 44)
)

local uIGradient = Instance.new("UIGradient")

uIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(196, 150, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
})

uIGradient.Parent = v23

local v24 = func16(
	frame4,
	"Key system",
	14,
	tbl1.sub,
	Enum.Font.Gotham,
	UDim2.fromOffset(142, 76),
	UDim2.fromOffset(300, 20)
)

pcall(function()
	local Text = v23.Text
	v23.Text = ""

	task.spawn(function()
		local num = 1
		local v1 = #Text

		if v1 == v1 then
			if not (1 > v1) then
				while v23.Parent do
					v23.Text = Text:sub(1, num)
					task.wait(0.06)
					num = num + 1



					if num > v1 then
						return
					end
				end
				return
			end
		end
	end)

	local connection = RunService.RenderStepped:Connect(function()
		local v1 = os.clock()
		v23.Position = UDim2.fromOffset(140, 30 + 2 * math.sin(v1 * 1.4))
		v24.TextTransparency = 0.1 + 0.2 * (0.5 + 0.5 * math.sin(v1 * 2.2))
	end)

	screenGui1.Destroying:Connect(function()
		connection:Disconnect()
	end)
end)

local v25 = func14(frame4, UDim2.fromOffset(142, 102), UDim2.fromOffset(170, 26), tbl1.panel, 13)
func13(v25, tbl1.stroke, 1)
local v26 = func14(v25, UDim2.fromOffset(12, 9), UDim2.fromOffset(8, 8), tbl1.ok, 4)

func16(
	v25,
	"Secure connection",
	12,
	tbl1.soft,
	Enum.Font.GothamMedium,
	UDim2.fromOffset(28, 0),
	UDim2.fromOffset(140, 26)
)

local v27 = func14(frame4, UDim2.fromOffset(520, 24), UDim2.fromOffset(328, 176), tbl1.panel, 18)
v27.ClipsDescendants = true
func15(v27, Color3.fromRGB(34, 25, 58), tbl1.panel, 115)
local v28 = func13(v27, tbl1.violet, 1)
v28.Transparency = 0.55
v27.BackgroundTransparency = 0.18
func15(v28, tbl1.soft, tbl1.violet, 90)
local v29 = func14(v27, UDim2.fromOffset(16, 16), UDim2.fromOffset(56, 56), tbl1.card, 14)
v29.ClipsDescendants = true
func13(v29, tbl1.violet, 1.5).Transparency = 0.35
func15(v29, Color3.fromRGB(96, 62, 176), Color3.fromRGB(40, 28, 78), 135)
local soft = tbl1.soft
local GothamBold = Enum.Font.GothamBold
local uDim21 = UDim2.new()
local v30 = UDim2.fromScale(1, 1)
local v31 = func16(v29, "", 15, soft, GothamBold, uDim21, v30, Enum.TextXAlignment.Center)
local imageLabel1 = Instance.new("ImageLabel")
imageLabel1.BackgroundTransparency = 1
imageLabel1.Size = UDim2.fromScale(1, 1)
imageLabel1.ImageTransparency = 1
imageLabel1.ScaleType = Enum.ScaleType.Crop
imageLabel1.ZIndex = 2
imageLabel1.Parent = v29
func12(imageLabel1, UDim.new(0, 14))
func12(imageLabel1, UDim.new(0, 14))

local v32 = func16(
	v27,
	"Loading...",
	17,
	tbl1.text,
	Enum.Font.GothamBold,
	UDim2.fromOffset(78, 16),
	UDim2.fromOffset(230, 24)
)

v32.TextTruncate = Enum.TextTruncate.AtEnd
local sub = tbl1.sub
local GothamBlack = Enum.Font.GothamBlack
local v33 = UDim2.fromOffset(76, 38)
local v34 = UDim2.fromOffset(14, 14)
local v35 = func16(v27, "●", 10, sub, GothamBlack, v33, v34, Enum.TextXAlignment.Center)

local v36 = func16(
	v27,
	"Checking...",
	13,
	tbl1.sub,
	Enum.Font.GothamMedium,
	UDim2.fromOffset(94, 40),
	UDim2.fromOffset(200, 24)
)

local function func29(arg1)
	v35.Text = arg1 and "✓" or "✖"
	v35.TextColor3 = arg1 and tbl1.ok or tbl1.bad
	v35.TextSize = 14
end

func14(v27, UDim2.fromOffset(16, 78), UDim2.fromOffset(296, 1), tbl1.stroke, nil)

func16(
	v27,
	"Executor",
	13,
	tbl1.sub,
	Enum.Font.Gotham,
	UDim2.fromOffset(16, 86),
	UDim2.fromOffset(140, 22)
)

local v37 = identifyexecutor and select(1, identifyexecutor()) or "Unknown"
local text = tbl1.text
local GothamMedium = Enum.Font.GothamMedium
local v38 = UDim2.fromOffset(156, 86)
local v39 = UDim2.fromOffset(156, 22)
func16(v27, v37, 13, text, GothamMedium, v38, v39, Enum.TextXAlignment.Right)

func16(
	v27,
	"Status",
	13,
	tbl1.sub,
	Enum.Font.Gotham,
	UDim2.fromOffset(16, 110),
	UDim2.fromOffset(140, 22)
)

local v40 = func16(
	v27,
	"Key required",
	13,
	tbl1.warn,
	Enum.Font.GothamMedium,
	UDim2.fromOffset(156, 110),
	UDim2.fromOffset(156, 22),
	Enum.TextXAlignment.Right
)

local function func30(text, arg2, arg3)
	local textButton = Instance.new("TextButton")
	textButton.Position = UDim2.fromOffset(arg2, 138)
	textButton.Size = UDim2.fromOffset(144, 28)
	textButton.BackgroundColor3 = tbl1.card
	textButton.BorderSizePixel = 0
	textButton.Text = text
	textButton.TextColor3 = tbl1.soft
	textButton.TextSize = 13
	textButton.Font = Enum.Font.GothamMedium
	textButton.AutoButtonColor = false
	textButton.Visible = false
	textButton.Parent = v27
	func12(textButton, UDim.new(0, 10))
	func12(textButton, UDim.new(0, 10))
	func13(textButton, tbl1.stroke, 1)

	textButton.MouseEnter:Connect(function()
		local tbl = {BackgroundColor3 = Color3.fromRGB(46, 36, 74)}
		TweenService:Create(textButton, tweenInfo, tbl):Play()
	end)

	textButton.MouseLeave:Connect(function()
		TweenService:Create(textButton, tweenInfo, {BackgroundColor3 = tbl1.card}):Play()
	end)

	textButton.MouseButton1Click:Connect(function()
		func(tbl[arg3], text)
	end)

	return textButton
end

local v41 = func30("Discord", 16, "discord")
local v42 = func30("Website", 168, "website")

local function func31()
	local v1 = tbl.discord ~= ""
	local v2 = tbl.website ~= ""
	local v3
	v41.Visible, v3 = v1, v42
	v3.Visible = v2

	if v1 and v2 then
		local v4 = UDim2.fromOffset(16, 138)
		local v5 = UDim2.fromOffset(144, 28)
		v41.Position = v4
		v41.Size = v5
		local v6 = UDim2.fromOffset(168, 138)
		local v7 = UDim2.fromOffset(144, 28)
		v42.Position = v6
		v42.Size = v7
	elseif v1 then
		local v8 = UDim2.fromOffset(16, 138)
		local v9 = UDim2.fromOffset(296, 28)
		v41.Position = v8
		v41.Size = v9
	elseif v2 then
		local v10 = UDim2.fromOffset(16, 138)
		local v11 = UDim2.fromOffset(296, 28)
		v42.Position = v10
		v42.Size = v11
	end
end

func31()
local v43 = func14(v27, UDim2.fromOffset(10, 0), UDim2.fromOffset(308, 2), tbl1.soft, 1)
v43.BackgroundTransparency = 0.6
func15(v43, tbl1.violet, tbl1.fuchsia, 0)

local v44 = func16(
	frame4,
	"Key",
	13,
	tbl1.sub,
	Enum.Font.GothamMedium,
	UDim2.fromOffset(34, 222),
	UDim2.fromOffset(200, 18)
)

local v45 = func14(frame4, UDim2.fromOffset(32, 246), UDim2.fromOffset(816, 78), tbl1.panel, 22)
v45.BackgroundTransparency = 0.22
local v46 = func13(v45, Color3.fromRGB(78, 48, 140), 1.5)
local v47 = func14(v45, UDim2.fromOffset(18, 19), UDim2.fromOffset(40, 40), Color3.new(1, 1, 1), 12)
func15(v47, tbl1.violet, tbl1.fuchsia, 135)
local text1 = tbl1.text
local GothamBold1 = Enum.Font.GothamBold
local uDim22 = UDim2.new()
local v48 = UDim2.fromScale(1, 1)
func16(v47, "KEY", 11, text1, GothamBold1, uDim22, v48, Enum.TextXAlignment.Center)
local textBox = Instance.new("TextBox")
textBox.BackgroundTransparency = 1
textBox.Position = UDim2.fromOffset(74, 0)
textBox.Size = UDim2.new(1, -92, 1, 0)
textBox.PlaceholderText = "Paste your key here"
textBox.PlaceholderColor3 = tbl1.muted
textBox.Text = ""
textBox.TextColor3 = tbl1.text
textBox.TextSize = 20
textBox.Font = Enum.Font.GothamMedium
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.ClearTextOnFocus = false
textBox.Parent = v45

textBox.Focused:Connect(function()
	TweenService:Create(v46, tweenInfo, {Color = tbl1.soft, Thickness = 2.4}):Play()
end)

textBox.FocusLost:Connect(function()
	local tbl = {Color = Color3.fromRGB(78, 48, 140), Thickness = 1.5}
	TweenService:Create(v46, tweenInfo, tbl):Play()
end)

local v49 = func14(frame4, UDim2.fromOffset(32, 344), UDim2.fromOffset(500, 56), Color3.new(1, 1, 1), 18)
v49.ClipsDescendants = true
local v50 = func15(v49, tbl1.violet, tbl1.fuchsia, 0)
local v51 = func14(v49, UDim2.new(-0.4, 0, -0.3, 0), UDim2.new(0.3, 0, 1.6, 0), Color3.new(1, 1, 1), nil)
v51.Rotation = 18
v51.BackgroundTransparency = 0.82
v51.Visible = false
local textButton = Instance.new("TextButton")
textButton.BackgroundTransparency = 1
textButton.Size = UDim2.fromScale(1, 1)
textButton.Text = "Submit"
textButton.TextColor3 = tbl1.text
textButton.TextSize = 18
textButton.Font = Enum.Font.GothamBold
textButton.AutoButtonColor = false
textButton.ZIndex = 3
textButton.Parent = v49
local textButton1 = Instance.new("TextButton")
textButton1.Position = UDim2.fromOffset(548, 344)
textButton1.Size = UDim2.fromOffset(300, 56)
textButton1.BackgroundColor3 = tbl1.panel
textButton1.BorderSizePixel = 0
textButton1.Text = "Get a key"
textButton1.TextColor3 = tbl1.soft
textButton1.TextSize = 16
textButton1.Font = Enum.Font.GothamMedium
textButton1.AutoButtonColor = false
textButton1.Parent = frame4
func12(textButton1, UDim.new(0, 18))
func12(textButton1, UDim.new(0, 18))
func13(textButton1, tbl1.stroke, 1)

textButton1.MouseEnter:Connect(function()
	TweenService:Create(textButton1, tweenInfo, {BackgroundColor3 = tbl1.card}):Play()
end)

textButton1.MouseLeave:Connect(function()
	TweenService:Create(textButton1, tweenInfo, {BackgroundColor3 = tbl1.panel}):Play()
end)

textButton1.MouseButton1Click:Connect(function()
	if tbl.discord ~= "" then
		func(tbl.discord, "Discord")
	elseif tbl.website ~= "" then
		func(tbl.website, "Website")
	else
		local str = "Yadsan Key System"
		local str1 = "No key link has been set for this loader yet."
		local num = 4

		if func24 then
			pcall(func24, "Yadsan Key System", "No key link has been set for this loader yet.", 4, "warn")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str, Text = str1, Duration = num or 4})
			end)
		end
	end
end)

local v52 = func16(frame4, "", 13, tbl1.sub, Enum.Font.Gotham, UDim2.fromOffset(34, 410), UDim2.fromOffset(460, 20))
local muted = tbl1.muted
local Gotham = Enum.Font.Gotham
local v53 = UDim2.fromOffset(500, 410)
local v54 = UDim2.fromOffset(348, 20)
func16(frame4, "Yadsan  /  secure key system", 11, muted, Gotham, v53, v54, Enum.TextXAlignment.Right)
local v55 = func14(frame4, UDim2.fromOffset(32, 436), UDim2.fromOffset(816, 3), tbl1.stroke, 2)
local v56 = func14(v55, UDim2.new(), UDim2.fromScale(0, 1), tbl1.ok, 2)
local textLabel = Instance.new("TextLabel")
textLabel.AnchorPoint = Vector2.new(0.5, 0)
textLabel.Position = UDim2.new(0.5, 0, 1, 14)
textLabel.Size = UDim2.new(1, -64, 0, 0)
textLabel.AutomaticSize = Enum.AutomaticSize.Y
textLabel.BackgroundColor3 = Color3.fromRGB(28, 14, 44)
textLabel.BackgroundTransparency = 0.1
textLabel.Font = Enum.Font.GothamMedium
textLabel.RichText = true
textLabel.Text = ""
textLabel.TextColor3 = Color3.fromRGB(235, 215, 255)
textLabel.TextSize = 13
textLabel.TextWrapped = true
textLabel.Visible = false
textLabel.Parent = frame4
func12(textLabel, UDim.new(0, 10))
func12(textLabel, UDim.new(0, 10))
local uIPadding = Instance.new("UIPadding")
local uDim = UDim.new(0, 8)
local uDim1 = UDim.new(0, 8)
uIPadding.PaddingTop = uDim
uIPadding.PaddingBottom = uDim1
local uDim3 = UDim.new(0, 12)
local uDim4 = UDim.new(0, 12)
uIPadding.PaddingLeft = uDim3
uIPadding.PaddingRight = uDim4
uIPadding.Parent = textLabel
func13(textLabel, tbl1.violet, 1)
local num2 = 0

local function func32(arg1, arg2)
	local v1 = tonumber(arg2) or 0
	local str = tostring(arg1 or "")

	if v1 == 0 or str == "" then
		textLabel.Visible = false
		return
	end

	if v1 == num2 and textLabel.Visible then
		return
	end

	num2 = v1
	local v2 = str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
	textLabel.Text = '<font color="#EB50FF"><b>ANNOUNCEMENT</b></font>\n' .. v2
	textLabel.Visible = true
	textLabel.Size = UDim2.new(1, -64, 0, 0)
	textLabel.Position = UDim2.new(0.5, 0, 1, 14)
end

func26(frame5, 0.1)
func26(v23, 0.18)
func26(v24, 0.24)
func26(v25, 0.28)
func26(v27, 0.22)
func26(v44, 0.34)
func26(v45, 0.38, 28)
func26(v49, 0.46, 28)
func26(textButton1, 0.5, 28)
local v57 = func14(screenGui1, UDim2.new(), UDim2.fromScale(1, 1), Color3.new(0, 0, 0), nil)
v57.ZIndex = 50
local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad)
TweenService:Create(v57, tweenInfo2, {BackgroundTransparency = 1}):Play()

task.delay(0.8, function()
	v57.Visible = false
end)

local tbl11 = {}
tbl11[1], tbl11[2] = Enum.UserInputType.Touch, Enum.UserInputType.Gamepad1
local num3 = 0

local function func33(arg1, arg2)
	local v1 = math.clamp(arg1 or 0.5, 0, 1)
	local v2 = arg2 or 0.04

	for _, v3 in ipairs(tbl11) do
		pcall(function()
			if HapticService:IsVibrationSupported(v3) then
				local Small = Enum.VibrationMotor.Small

				if not HapticService:IsMotorSupported(v3, Small) then
					Small = Enum.VibrationMotor.Large
				end

				HapticService:SetMotor(v3, Small, v1)
				num3 = num3 + 1
				local v4 = num3

				task.delay(v2, function()
					if num3 == v4 then
						pcall(function()
							HapticService:SetMotor(v3, Small, 0)
						end)
					end
				end)
			end
		end)
	end
end

UserInputService.InputBegan:Connect(function(input)
	local UserInputType = input.UserInputType
	if UserInputType == Enum.UserInputType.Touch or UserInputType == Enum.UserInputType.MouseButton1 then
		func33(0.45, 0.035)
	end
end)

local function func34(arg1)
	local str = ""

	for k in arg1:gmatch("%S+") do
		if k:match("^%a") then
			str = str .. k:sub(1, 1):upper()
		end
		if #str >= 2 then
			break
		end
	end

	return str ~= "" and str or arg1:sub(1, 2):upper()
end

local function func35(image)
	if not imageLabel1.Parent then
		return true
	end

	imageLabel1.Image = image
	local flag = false

	pcall(function()
		ContentProvider:PreloadAsync({imageLabel1}, function(_, arg2)
			if arg2 == Enum.AssetFetchStatus.Success then
				flag = true
			end
		end)
	end)

	if not flag then
		return false
	end

	TweenService:Create(imageLabel1, tweenInfo1, {ImageTransparency = 0}):Play()
	TweenService:Create(v31, tweenInfo, {TextTransparency = 1}):Play()
	return true
end

task.spawn(function()
	local ok, result = pcall(function()
		return MarketplaceService:GetProductInfo(PlaceId)
	end)
	if ok and result and type(result.Name) == "string" and result.Name ~= "" then
		local Name = result.Name
		v32.Text = Name
		v31.Text = func34(Name)
	else
		v32.Text = "This game"
		v31.Text = func34("This game")
	end
end)

local flag2 = true

task.spawn(function()
	local v1 = func4("/api/check", {loader_id = tostring(LOADER_ID), game_id = tostring(GameId)}, 4)

	if v1 then
		tostring(v1.supported)
		tostring(v1.message or "")
	end

	if not screenGui1.Parent then
		return
	end

	if not v1 then
		local warn1
		v36.Text, warn1 = "Backend unreachable", tbl1.warn
		v36.TextColor3 = warn1
		v35.Text, v35.TextColor3 = "!", tbl1.warn
		return
	end

	if v1.supported == false then
		flag2 = false
		local bad
		v36.Text, bad = "Not supported", tbl1.bad
		v36.TextColor3 = bad
		func29(false)
		v40.Text, v40.TextColor3 = "Unavailable", tbl1.bad
		local bad1
		v52.Text, bad1 = v1.message or "This game is not supported.", tbl1.bad
		v52.TextColor3 = bad1
		return
	end

	local ok
	v36.Text, ok = "Supported", tbl1.ok
	v36.TextColor3 = ok
	func29(true)

	if type(v1.discord) == "string" and v1.discord ~= "" then
		tbl.discord = v1.discord
	end

	if type(v1.website) == "string" and v1.website ~= "" then
		tbl.website = v1.website
	end

	func31()

	if v1.loader_id then
		LOADER_ID = v1.loader_id
	end

	func32(v1.message, v1.message_id)
end)

task.spawn(function()
	if GameId ~= 0 and func35(("rbxthumb://type=GameIcon&id=%d&w=256&h=256").format("rbxthumb://type=GameIcon&id=%d&w=256&h=256", GameId)) then
		return
	end

	local ok, result = pcall(function()
		return MarketplaceService:GetProductInfo(PlaceId)
	end)

	local v1 = ok and result and tonumber(result.IconImageAssetId)

	if v1 and v1 > 0 then
		func35("rbxassetid://" .. v1)
	end
end)

local v59
local flag5

local function func36()
	if not v59 then
		return
	end
	pcall(function()
		func1({
			Url = BACKEND_URL .. "/api/offline",
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({token = v59}),
		})
	end)
end

pcall(function()
	game:BindToClose(func36)
end)

Players.PlayerRemoving:Connect(function(player)
	if player == LocalPlayer then
		if v59 then
			pcall(function()
				func1({
					Url = BACKEND_URL .. "/api/offline",
					Method = "POST",
					Headers = {["Content-Type"] = "application/json"},
					Body = HttpService:JSONEncode({token = v59}),
				})
			end)
		end
	end
end)

local function func37()
	if flag5 then
		return
	end

	flag5 = true

	task.spawn(function()
		while flag5 and v59 do
			task.wait(15)

			if flag5 and v59 then
				local tbl = {}
				tbl.Url = BACKEND_URL .. "/api/heartbeat"
				tbl.Method = "POST"
				tbl.Headers = {["Content-Type"] = "application/json"}
				tbl.Body = HttpService:JSONEncode({token = v59})
				local v3 = func2(tbl, 2)
				local v4 = v3

				if v3 then
					local Body = v3.Body

					local ok, result = pcall(function()
						return HttpService:JSONDecode(Body)
					end)

					v4 = ok and type(result) == "table" and result or nil
				end

				if v4 and v4.success == false then
					if v4.reason ~= "disabled" then
						pcall(function()
							if delfile and isfile and isfile(v2) then
								delfile(v2)
							end
						end)
					end

					if v4.forget then
						pcall(function()
							if delfile and isfile and isfile(v1) then
								delfile(v1)
							end
						end)
					end

					v59 = nil
					local message = v4.message
					flag5 = nil
					message = message or "Session ended."
					local str = "Yadsan Key System"
					local messageRef = message
					local num = 6

					if func24 then
						pcall(func24, "Yadsan Key System", messageRef, 6, "warn")
					else
						pcall(function()
							StarterGui:SetCore("SendNotification", {Title = str, Text = messageRef, Duration = num or 4})
						end)
					end
				else
					if v4 and v4.message_id and tonumber(v4.message_id) ~= num2 and tonumber(v4.message_id) ~= 0 then
						local num1 = tonumber(v4.message_id)
						num2 = num1
						local str1 = tostring(v4.message or "")
						local str2 = "Yadsan Key System announcement"
						local num3 = 8

						if func24 then
							pcall(func24, "Yadsan Key System announcement", str1, 8, nil)
						else
							pcall(function()
								StarterGui:SetCore("SendNotification", {Title = str2, Text = str1, Duration = num3 or 4})
							end)
						end
					end
					continue
				end
			end

			break
		end
	end)
end

local function func38()
	local v1 = UDim2.fromOffset(32, 246)
	for _, v2 in ipairs({10, -10, 8, -8, 4, -4, 0}) do
		local tweenInfo = TweenInfo.new(0.04)
		local tbl = {Position = v1 + UDim2.fromOffset(v2, 0)}
		TweenService:Create(v45, tweenInfo, tbl):Play()
		task.wait(0.04)
	end
end

local flag3 = false

local function func39()
	v51.Visible = true
	task.spawn(function()
		while flag3 do
			v51.Position = UDim2.new(-0.4, 0, -0.3, 0)
			local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear)
			local tbl = {Position = UDim2.new(1.2, 0, -0.3, 0)}
			TweenService:Create(v51, tweenInfo, tbl):Play()
			task.wait(0.75)
		end
		v51.Visible = false
	end)
end

local flag4 = false

local function func40()
	flag4 = true
	local tweenInfo = TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
	TweenService:Create(uIScale, tweenInfo, {Scale = uIScale.Scale * 0.9}):Play()
end

local function func41(arg1)
	local v3, v4 = func2({
		Url = BACKEND_URL .. "/api/verify",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = HttpService:JSONEncode({
			loader_id = tostring(LOADER_ID),
			key = arg1,
			hwid = func5(),
			userId = tostring(LocalPlayer.UserId),
			gameId = tostring(GameId),
			username = LocalPlayer.Name,
		}),
	}, 3, function(arg1)
		v52.Text = "Backend waking up, retrying (" .. arg1 .. ")..."
		v52.TextColor3 = tbl1.sub
	end)

	if not v3 then
		tostring(v4)
		return false, "Could not reach the backend: " .. tostring(v4)
	end

	local v5 = func3(v3.Body)

	if not v5 then
		tostring(v3.StatusCode)
		tostring(v3.Body):sub(1, 160)
		return false, "Bad response from backend (HTTP " .. tostring(v3.StatusCode) .. ")."
	end

	tostring(v5.success)
	tostring(v5.reason)

	if v5.success then
		v59 = v5.token

		pcall(function()
			if writefile then
				writefile(v1, arg1)
			end
		end)

		local token = v5.token

		pcall(function()
			if writefile and type(token) == "string" then
				writefile(v2, token)
			end
		end)

		func37()
		return true, "Key accepted. Launching...", v5.script
	end

	if v5.forget then
		pcall(function()
			if delfile and isfile and isfile(v1) then
				delfile(v1)
			end
		end)
		pcall(function()
			if delfile and isfile and isfile(v2) then
				delfile(v2)
			end
		end)
	end

	return false, v5.message or "Verification failed (" .. tostring(v5.reason) .. ")"
end

local function func42(arg1)
	local v1 = func2({
		Url = BACKEND_URL .. "/api/resume",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = HttpService:JSONEncode({token = arg1}),
	}, 2)

	local v3 = v1 and func3(v1.Body)

	if v3 and v3.success and type(v3.script) == "string" then
		v59 = v3.token or arg1
		local v4 = v59

		pcall(function()
			if writefile and type(v4) == "string" then
				writefile(v2, v4)
			end
		end)

		func37()
		return true, v3
	end

	if v3 then
		pcall(function()
			if delfile and isfile and isfile(v2) then
				delfile(v2)
			end
		end)
	end

	return false, v3
end

local function func43(arg1)
	if type(arg1) ~= "string" then
		local str = "Yadsan Key System"
		local str1 = "Key accepted, but the server sent no script. Ask the owner to check the loader's script."
		local num = 8

		if func24 then
			pcall(
				func24,
				"Yadsan Key System",
				"Key accepted, but the server sent no script. Ask the owner to check the loader's script.",
				8,
				"warn"
			)
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str, Text = str1, Duration = num or 4})
			end)
		end

		return
	end

	local v1 = arg1:gsub("^\239\187\191", "")
	local v2 = v1

	if v1:match("^%s*$") then
		local str2 = "Yadsan Key System"
		local str3 = "Key accepted, but the delivered script is empty."
		local num1 = 8

		if func24 then
			pcall(func24, "Yadsan Key System", "Key accepted, but the delivered script is empty.", 8, "warn")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str2, Text = str3, Duration = num1 or 4})
			end)
		end

		return
	end

	if v1:match("^%s*https?://%S+%s*$") then
		local v3 = v1:match("^%s*(%S+)%s*$")

		local ok, result = pcall(function()
			return game:HttpGet(v3)
		end)

		if not ok or type(result) ~= "string" or result == "" then
			tostring(result)
			local str4 = "Yadsan Key System"
			local str5 = "Could not download the script URL."
			local num2 = 8

			if func24 then
				pcall(func24, "Yadsan Key System", "Could not download the script URL.", 8, "warn")
			else
				pcall(function()
					StarterGui:SetCore("SendNotification", {Title = str4, Text = str5, Duration = num2 or 4})
				end)
			end

			return
		end

		v2 = result
	end

	local tbl = {}

	if type(RAW_LOADSTRING) == "function" then
		table.insert(tbl, RAW_LOADSTRING)
	end

	if type(loadstring) == "function" and loadstring ~= RAW_LOADSTRING then
		table.insert(tbl, loadstring)
	end

	if #tbl == 0 then
		local str6 = "Yadsan Key System"
		local str7 = "Your executor doesn't support loadstring."
		local num3 = 8

		if func24 then
			pcall(func24, "Yadsan Key System", "Your executor doesn't support loadstring.", 8, "warn")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str6, Text = str7, Duration = num3 or 4})
			end)
		end

		return
	end

	local v6
	local v5

	for _, v4 in ipairs(tbl) do
		local ok1, result1, result2 = pcall(v4, v2)

		if ok1 and type(result1) == "function" then
			v5 = result1
			break
		end

		v6 = ok1 and result2 or result1
	end

	if type(v5) ~= "function" then
		tostring(v6)
		local v7 = "Script failed to compile: " .. tostring(v6):sub(1, 120)
		local str8 = "Yadsan Key System"
		local num4 = 8

		if func24 then
			pcall(func24, "Yadsan Key System", v7, 8, "bad")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str8, Text = v7, Duration = num4 or 4})
			end)
		end

		return
	end

	local ok2, result3 = xpcall(v5, function(arg1)
		return tostring(arg1) .. "\n" .. debug.traceback()
	end)

	if not ok2 then
		tostring(result3)
		local v8 = "Script error: " .. tostring(result3):sub(1, 120)
		local str9 = "Yadsan Key System"
		local num5 = 8

		if func24 then
			pcall(func24, "Yadsan Key System", v8, 8, "bad")
		else
			pcall(function()
				StarterGui:SetCore("SendNotification", {Title = str9, Text = v8, Duration = num5 or 4})
			end)
		end
	end
end

local function func44(arg1, arg2)
	if flag3 or flag4 then
		if not arg2 then
			local warn1 = tbl1.warn
			local str = "Still checking your key, please wait..."

			pcall(function()
				v52.Text = str
				v52.TextColor3 = warn1 or tbl1.sub
			end)
		end
		return
	end

	local v1 = (arg1 or ""):gsub("%s+", "")

	if v1 == "" then
		if not arg2 then
			local tbl = {{0.8, 0.06}}

			task.spawn(function()
				for _, v1 in ipairs(tbl) do
					func33(v1[1], v1[2])
					task.wait(v1[2] + (v1[3] or 0.05))
				end
			end)

			v52.Text = "Paste a key first."
			v52.TextColor3 = tbl1.warn
			func38()
		end
		return
	end

	if not flag2 then
		v52.Text = "This game is not supported."
		v52.TextColor3 = tbl1.bad
		return
	end

	flag3 = true
	v56.Size = UDim2.fromScale(0, 1)
	v52.Text = ""
	v40.Text, v40.TextColor3 = "Verifying", tbl1.warn
	textButton.Text = "Checking..."
	func39()
	local flag = false
	local flag1 = false

	task.delay(35, function()
		if flag then
			return
		end

		flag1 = true
		flag3 = false
		textButton.Text = "Submit"
		v40.Text, v40.TextColor3 = "Key required", tbl1.warn
		local bad = tbl1.bad
		local str = "Timed out contacting the backend. Press Submit to try again."

		pcall(function()
			v52.Text = str
			v52.TextColor3 = bad or tbl1.sub
		end)
	end)

	task.spawn(function()
		local ok, result, result1, result2 = pcall(func41, v1)
		local result2Ref = result2
		flag = true

		if flag1 then
			return
		end

		flag3 = false

		if not ok then
			tostring(result)
			local v2 = tostring(result):sub(1, 90)
			result2Ref = nil
			result1 = "Internal error: " .. v2
			result = false
		end

		if result then
			local tbl = {}
			tbl[1], tbl[2] = {0.6, 0.05}, {1, 0.09}

			task.spawn(function()
				for _, v1 in ipairs(tbl) do
					func33(v1[1], v1[2])
					task.wait(v1[2] + (v1[3] or 0.05))
				end
			end)

			textButton.Text = "Verified"
			v50.Color = ColorSequence.new(tbl1.ok, Color3.fromRGB(16, 185, 129))
			v40.Text, v40.TextColor3 = "Verified", tbl1.ok
			v52.Text = result1 or "Key accepted. Launching..."
			v52.TextColor3 = tbl1.ok
			local tweenInfo = TweenInfo.new(0.9, Enum.EasingStyle.Quad)
			local tbl2 = {Size = UDim2.fromScale(1, 1)}
			TweenService:Create(v56, tweenInfo, tbl2):Play()
			local flag2 = false

			local function func()
				if flag2 then
					return
				end

				flag2 = true

				if screenGui1.Parent then
					screenGui1:Destroy()
				end

				task.spawn(func43, result2Ref)
			end

			task.delay(0.45, function()
				func40()
				func()
			end)

			task.delay(3.5, func)
		else
			if not arg2 then
				local tbl3 = {}
				tbl3[3], tbl3[1], tbl3[2] = {1, 0.07}, {1, 0.07, 0.04}, {1, 0.07, 0.04}

				task.spawn(function()
					for _, v1 in ipairs(tbl3) do
						func33(v1[1], v1[2])
						task.wait(v1[2] + (v1[3] or 0.05))
					end
				end)
			end

			textButton.Text = "Submit"
			v40.Text, v40.TextColor3 = "Key required", tbl1.warn
			v52.Text = result1 or "Verification failed. Please try again."
			v52.TextColor3 = tbl1.bad

			if not arg2 then
				func38()
			end
		end
	end)
end

local function func45(arg1, arg2)
	tostring(#tostring(arg1 or ""))
	local ok, result = pcall(func44, arg1, arg2)

	if not ok then
		flag3 = false
		tostring(result)

		pcall(function()
			textButton.Text = "Submit"
			v52.Text = "Error: " .. tostring(result):sub(1, 90)
			v52.TextColor3 = tbl1.bad
		end)
	end
end

textButton.Activated:Connect(function()
	func45(textBox.Text, false)
end)

textButton.MouseButton1Click:Connect(function()
	func45(textBox.Text, false)
end)

textBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		func45(textBox.Text, false)
	end
end)

screenGui1.Destroying:Connect(function()
	func20()
end)

task.spawn(function()
	local v2 = func6()
	local v3 = func7()

	if v3 ~= "" then
		v52.Text = "Resuming your session..."
		v52.TextColor3 = tbl1.sub
		local ok, result, result1 = pcall(func42, v3)

		if ok and result then
			v40.Text, v40.TextColor3 = "Verified", tbl1.ok
			v52.Text = "Session resumed. Launching..."
			v52.TextColor3 = tbl1.ok

			if screenGui1.Parent then
				screenGui1:Destroy()
			end

			task.spawn(func43, result1.script)
			return
		end

		if ok and type(result1) == "table" and result1.forget then
			pcall(function()
				if delfile and isfile and isfile(v1) then
					delfile(v1)
				end
			end)
			v2 = ""
		end

		if ok and type(result1) == "table" and result1.message and v2 == "" then
			v52.Text = result1.message
			v52.TextColor3 = tbl1.warn
		end
	end

	if v2 ~= "" then
		textBox.Text = v2
		v52.Text = "Found a saved key, checking..."
		v52.TextColor3 = tbl1.sub
		func44(v2, true)
	end
end)

local v58 = os.clock()

local connection = RunService.RenderStepped:Connect(function(deltaTime)
	local v1 = os.clock() - v58
	local AbsoluteSize = frame2.AbsoluteSize

	for _, v2 in ipairs(tbl9) do
		local v3 = AbsoluteSize.Y * 1.25 * v2.k
		v2.f.Size = UDim2.fromOffset(v3, v3)
		local f = v2.f
		local fromOffset = UDim2.fromOffset
		local X = AbsoluteSize.X
		local x = v2.x
		local sp = v2.sp
		local sin = math.sin
		local ph = v2.ph
		local v4 = x + 0.12 * sin(v1 * sp + ph)
		local Y = AbsoluteSize.Y
		local y = v2.y
		local v5 = X * v4
		local cos = math.cos
		local v6 = v1 * v2.sp
		local ph1 = v2.ph
		f.Position = fromOffset(v5, Y * (y + 0.12 * cos(v6 * 0.8 + ph1)))
	end

	for _, v7 in ipairs(tbl10) do
		v7.y = v7.y - v7.v * deltaTime

		if v7.y < -0.03 then
			v7.y = 1.03
			v7.x = random:NextNumber()
		end

		local f1 = v7.f
		local fromScale = UDim2.fromScale
		local x1 = v7.x
		local v8 = 0.012 * math.sin(v1 * v7.sw + v7.ph)
		local y1 = v7.y
		f1.Position = fromScale(x1 + v8, y1)
	end

	v13.Rotation = v1 * 75 % 360
	v18.Rotation = v1 * 50 % 360
	v19.Rotation = -(v1 * 80 % 360)
	frame6.Rotation = v1 * 150 % 360
	v22.Rotation = 45 + v1 * 25 % 360
	local v9 = 0.05 * math.sin(v1 * 2.4)
	local v10 = 1 + v9
	v21.Size = UDim2.fromOffset(46 * v10, 46 * v10)
	local fromOffset1 = UDim2.fromOffset
	v22.Size = fromOffset1(46 * v10, 46 * v10)
	v17.Size = UDim2.fromOffset(150 * (0.95 + 0.08 * math.sin(v1 * 2.4)), 150 * (0.95 + 0.08 * math.sin(v1 * 2.4)))
	uIGradient.Offset = Vector2.new(v1 * 0.5 % 2.4 - 1.2, 0)
	local v11 = 0.5 + 0.5 * math.sin(v1 * 3)
	v35.TextTransparency = 0.5 * v11
	v26.BackgroundTransparency = 0.6 * v11
	local v12 = v1 * 0.55 % 1.8
	v43.Position = UDim2.fromOffset(10, 8 + math.min(v12, 1) * 160)
	v43.Visible = v12 < 1
end)

screenGui1.Destroying:Connect(function()
	connection:Disconnect()
end)
--// AUTO CHAT MESSAGE
task.spawn(function()
    local chatMsg = "------------//// Celestial Godly PV1 LOADED Made by Yadsan_Godverse (CELESTIAL SYNDICATE ON TOP ⚡) ////-----------------"
    pcall(function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(chatMsg)
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(chatMsg, "All")
        end
    end)
end)
