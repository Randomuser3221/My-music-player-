-- LOADSTRING-FRIENDLY MY MUSIC PLAYER
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- MAIN UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyMusicPlayer"
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = true

-- Rounded corners
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Draggable
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "My Music Player"
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Parent = MainFrame

-- Audio ID input
local AudioBox = Instance.new("TextBox")
AudioBox.PlaceholderText = "Enter Audio ID here"
AudioBox.Text = ""
AudioBox.Font = Enum.Font.FredokaOne
AudioBox.TextSize = 18
AudioBox.TextColor3 = Color3.fromRGB(0, 0, 0)
AudioBox.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
AudioBox.Size = UDim2.new(1, -20, 0, 35)
AudioBox.Position = UDim2.new(0, 10, 0, 50)
AudioBox.Parent = MainFrame

-- Play Button
local PlayBtn = Instance.new("TextButton")
PlayBtn.Text = "Play"
PlayBtn.Font = Enum.Font.FredokaOne
PlayBtn.TextSize = 18
PlayBtn.Size = UDim2.new(0, 80, 0, 35)
PlayBtn.Position = UDim2.new(0, 10, 0, 100)
PlayBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
PlayBtn.Parent = MainFrame

-- Pause Button
local PauseBtn = Instance.new("TextButton")
PauseBtn.Text = "Pause"
PauseBtn.Font = Enum.Font.FredokaOne
PauseBtn.TextSize = 18
PauseBtn.Size = UDim2.new(0, 80, 0, 35)
PauseBtn.Position = UDim2.new(0, 100, 0, 100)
PauseBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 50)
PauseBtn.Parent = MainFrame

-- Stop Button
local StopBtn = Instance.new("TextButton")
StopBtn.Text = "Stop"
StopBtn.Font = Enum.Font.FredokaOne
StopBtn.TextSize = 18
StopBtn.Size = UDim2.new(0, 80, 0, 35)
StopBtn.Position = UDim2.new(0, 190, 0, 100)
StopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StopBtn.Parent = MainFrame

-- Volume Slider
local VolumeLabel = Instance.new("TextLabel")
VolumeLabel.Text = "Volume"
VolumeLabel.Font = Enum.Font.FredokaOne
VolumeLabel.TextSize = 16
VolumeLabel.Size = UDim2.new(0, 80, 0, 25)
VolumeLabel.Position = UDim2.new(0, 10, 0, 150)
VolumeLabel.BackgroundTransparency = 1
VolumeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VolumeLabel.Parent = MainFrame

local VolumeSlider = Instance.new("TextBox")
VolumeSlider.PlaceholderText = "1 (0-10)"
VolumeSlider.Text = "1"
VolumeSlider.Font = Enum.Font.FredokaOne
VolumeSlider.TextSize = 16
VolumeSlider.Size = UDim2.new(0, 80, 0, 25)
VolumeSlider.Position = UDim2.new(0, 100, 0, 150)
VolumeSlider.Parent = MainFrame

-- Speed Slider
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Text = "Speed"
SpeedLabel.Font = Enum.Font.FredokaOne
SpeedLabel.TextSize = 16
SpeedLabel.Size = UDim2.new(0, 80, 0, 25)
SpeedLabel.Position = UDim2.new(0, 10, 0, 180)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Parent = MainFrame

local SpeedSlider = Instance.new("TextBox")
SpeedSlider.PlaceholderText = "1"
SpeedSlider.Text = "1"
SpeedSlider.Font = Enum.Font.FredokaOne
SpeedSlider.TextSize = 16
SpeedSlider.Size = UDim2.new(0, 80, 0, 25)
SpeedSlider.Position = UDim2.new(0, 100, 0, 180)
SpeedSlider.Parent = MainFrame

-- Pitch Slider
local PitchLabel = Instance.new("TextLabel")
PitchLabel.Text = "Pitch"
PitchLabel.Font = Enum.Font.FredokaOne
PitchLabel.TextSize = 16
PitchLabel.Size = UDim2.new(0, 80, 0, 25)
PitchLabel.Position = UDim2.new(0, 10, 0, 210)
PitchLabel.BackgroundTransparency = 1
PitchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PitchLabel.Parent = MainFrame

local PitchSlider = Instance.new("TextBox")
PitchSlider.PlaceholderText = "1"
PitchSlider.Text = "1"
PitchSlider.Font = Enum.Font.FredokaOne
PitchSlider.TextSize = 16
PitchSlider.Size = UDim2.new(0, 80, 0, 25)
PitchSlider.Position = UDim2.new(0, 100, 0, 210)
PitchSlider.Parent = MainFrame

-- Marketplace Panel
local MarketBtn = Instance.new("TextButton")
MarketBtn.Text = "Marketplace"
MarketBtn.Font = Enum.Font.FredokaOne
MarketBtn.TextSize = 16
MarketBtn.Size = UDim2.new(0, 120, 0, 30)
MarketBtn.Position = UDim2.new(0, 280, 0, 210)
MarketBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
MarketBtn.Parent = MainFrame

-- Audio object
local Sound = Instance.new("Sound", workspace)
Sound.Looped = true
Sound.Volume = 1
Sound.PlaybackSpeed = 1

-- BUTTON FUNCTIONS
PlayBtn.MouseButton1Click:Connect(function()
	local id = tonumber(AudioBox.Text)
	if id then
		Sound.SoundId = "rbxassetid://"..id
		Sound:Play()
	end
end)

PauseBtn.MouseButton1Click:Connect(function()
	Sound:Pause()
end)

StopBtn.MouseButton1Click:Connect(function()
	Sound:Stop()
end)

VolumeSlider.FocusLost:Connect(function()
	local v = tonumber(VolumeSlider.Text)
	if v then
		Sound.Volume = math.clamp(v,0,10)
	end
end)

SpeedSlider.FocusLost:Connect(function()
	local s = tonumber(SpeedSlider.Text)
	if s then
		Sound.PlaybackSpeed = math.clamp(s,0.1,10)
	end
end)

PitchSlider.FocusLost:Connect(function()
	local p = tonumber(PitchSlider.Text)
	if p then
		Sound.PlaybackSpeed = math.clamp(p,0.1,10)
	end
end)

-- MARKETPLACE PANEL
local MarketFrame = Instance.new("Frame")
MarketFrame.Size = UDim2.new(0, 350, 0, 250)
MarketFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
MarketFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MarketFrame.BorderSizePixel = 0
MarketFrame.Visible = false
MarketFrame.Parent = ScreenGui
MarketFrame.ClipsDescendants = true

-- Rounded corners
local MarketCorner = Instance.new("UICorner", MarketFrame)
MarketCorner.CornerRadius = UDim.new(0, 12)

-- Draggable
MarketFrame.Active = true
MarketFrame.Draggable = true

-- Close button
local MarketClose = Instance.new("TextButton")
MarketClose.Text = "X"
MarketClose.Font = Enum.Font.FredokaOne
MarketClose.TextSize = 18
MarketClose.Size = UDim2.new(0, 30, 0, 30)
MarketClose.Position = UDim2.new(1, -35, 0, 5)
MarketClose.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
MarketClose.Parent = MarketFrame
MarketClose.MouseButton1Click:Connect(function()
	MarketFrame.Visible = false
end)

-- Search box
local SearchBox = Instance.new("TextBox")
SearchBox.PlaceholderText = "Search audios..."
SearchBox.Font = Enum.Font.FredokaOne
SearchBox.TextSize = 16
SearchBox.Size = UDim2.new(1, -20, 0, 30)
SearchBox.Position = UDim2.new(0, 10, 0, 40)
SearchBox.Parent = MarketFrame

-- Scrolling frame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -80)
ScrollFrame.Position = UDim2.new(0, 10, 0, 80)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Parent = MarketFrame

local UIListLayout = Instance.new("UIListLayout", ScrollFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0,5)

-- Sample audio list
local Audios = {
	{name="Epic Adventure", id=1837465},
	{name="Chill Vibes", id=2938475},
	{name="Fast Beat", id=9283746},
	{name="Relaxing Melody", id=5647382},
	{name="Battle Music", id=8374659}
}

-- Create audio buttons
local function UpdateAudioList()
	-- clear previous buttons
	for _,child in ipairs(ScrollFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	local query = SearchBox.Text:lower()
	for _, audio in ipairs(Audios) do
		if audio.name:lower():find(query) or query == "" then
			local btn = Instance.new("TextButton")
			btn.Text = audio.name.." ("..audio.id..")"
			btn.Font = Enum.Font.FredokaOne
			btn.TextSize = 16
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
			btn.Size = UDim2.new(1,0,0,30)
			btn.Parent = ScrollFrame
			btn.MouseButton1Click:Connect(function()
				AudioBox.Text = tostring(audio.id)
				MarketFrame.Visible = false
			end)
		end
	end
	ScrollFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
end

SearchBox.FocusLost:Connect(function()
	UpdateAudioList()
end)

MarketBtn.MouseButton1Click:Connect(function()
	MarketFrame.Visible = not MarketFrame.Visible
	UpdateAudioList()
end)

-- Initial update
UpdateAudioList()
