local highlightScript = [[
    local highlightColor = BrickColor.new("Bright yellow") -- Change this to your desired color

    game.Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            wait(1) -- Wait for the character to load completely
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.BrickColor = highlightColor
                end
            end
        end)
    end)
]]
