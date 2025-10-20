-- Create the main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MusicPlayerGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

-- Draggable functionality
local dragging = false
local dragInput, mousePos, framePos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - mousePos
        MainFrame.Position = framePos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

-- Audio Player
local Sound = Instance.new("Sound")
Sound.Parent = MainFrame
Sound.Looped = false

-- Play Button
local playBtn = Instance.new("TextButton")
playBtn.Size = UDim2.new(0, 50, 0, 50)
playBtn.Position = UDim2.new(0, 0, 1, -50)
playBtn.Text = "Play"
playBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
playBtn.Parent = MainFrame

playBtn.MouseButton1Click:Connect(function()
    Sound:Play()
end)

-- Pause Button
local pauseBtn = Instance.new("TextButton")
pauseBtn.Size = UDim2.new(0, 50, 0, 50)
pauseBtn.Position = UDim2.new(0, 60, 1, -50)
pauseBtn.Text = "Pause"
pauseBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
pauseBtn.Parent = MainFrame

pauseBtn.MouseButton1Click:Connect(function()
    Sound:Pause()
end)

-- Volume Slider
local volumeSlider = Instance.new("Slider")
volumeSlider.Size = UDim2.new(0, 200, 0, 20)
volumeSlider.Position = UDim2.new(0, 0, 1, -100)
volumeSlider.MinValue = 0
volumeSlider.MaxValue = 1
volumeSlider.Value = 0.5
volumeSlider.Parent = MainFrame

volumeSlider.Changed:Connect(function()
    Sound.Volume = volumeSlider.Value
end)

-- Pitch Slider
local pitchSlider = Instance.new("Slider")
pitchSlider.Size = UDim2.new(0, 200, 0, 20)
pitchSlider.Position = UDim2.new(0, 0, 1, -130)
pitchSlider.MinValue = 0.5
pitchSlider.MaxValue = 2
pitchSlider.Value = 1
pitchSlider.Parent = MainFrame

pitchSlider.Changed:Connect(function()
    Sound.PlaybackSpeed = pitchSlider.Value
end)

-- Speed Slider
local speedSlider = Instance.new("Slider")
speedSlider.Size = UDim2.new(0, 200, 0, 20)
speedSlider.Position = UDim2.new(0, 0, 1, -160)
speedSlider.MinValue = 0.5
speedSlider.MaxValue = 2
speedSlider.Value = 1
speedSlider.Parent = MainFrame

speedSlider.Changed:Connect(function()
    Sound.PlaybackSpeed = speedSlider.Value
end)

-- Audio ID Input
local audioIDInput = Instance.new("TextBox")
audioIDInput.Size = UDim2.new(0, 200, 0, 50)
audioIDInput.Position = UDim2.new(0, 0, 1, -210)
audioIDInput.PlaceholderText = "Enter Audio ID"
audioIDInput.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
audioIDInput.Parent = MainFrame

audioIDInput.FocusLost:Connect(function()
    Sound.SoundId = "rbxassetid://" .. audioIDInput.Text
end)

-- Marketplace Button
local marketplaceBtn = Instance.new("TextButton")
marketplaceBtn.Size = UDim2.new(0, 100, 0, 50)
marketplaceBtn.Position = UDim2.new(0, 0, 1, -260)
marketplaceBtn.Text = "Marketplace"
marketplaceBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
marketplaceBtn.Parent = MainFrame

marketplaceBtn.MouseButton1Click:Connect(function()
    -- Open Roblox Creator Marketplace in browser
    game:GetService("GuiService"):OpenBrowserWindow("https://create.roblox.com/marketplace/audio")
end)

-- Search Bar
local searchBar = Instance.new("TextBox")
searchBar.Size = UDim2.new(0, 200, 0, 50)
searchBar.Position = UDim2.new(0, 0, 1, -270)
searchBar.PlaceholderText = "Search Audio"
searchBar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
searchBar.Parent = MainFrame

searchBar.FocusLost:Connect(function()
    local searchQuery = searchBar.Text
    -- Implement search functionality here
    -- Note: Roblox does not provide a direct API to search audio assets
    -- You might need to use external tools or pre-defined lists for searching
end)
