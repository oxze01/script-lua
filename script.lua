local Players = game:GetService("Players")

local function highlightPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            if head then
                head.BrickColor = BrickColor.new("Bright red") -- Change to your desired color
            end
        end
    end
end

-- Run the highlight function
highlightPlayers()

-- Optional: Connect the function to an event if you want it to update dynamically
Players.PlayerAdded:Connect(highlightPlayers)
