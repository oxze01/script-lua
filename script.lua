local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local function getNearestPlayer()
    local nearestPlayer = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (LocalPlayer.Character.Head.Position - player.Character.Head.Position).Magnitude
            if distance < shortestDistance then
                nearestPlayer = player
                shortestDistance = distance
            end
        end
    end

    return nearestPlayer
end

RunService.RenderStepped:Connect(function()
    local nearestPlayer = getNearestPlayer()
    if nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChild("Head") then
        local targetHead = nearestPlayer.Character.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
    end
end)
