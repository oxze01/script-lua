-- Oyuncu ve RunService hizmetlerini al
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Yerel oyuncuyu al
local LocalPlayer = Players.LocalPlayer

-- Işık efekti oluşturma
local function createLight(part)
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(255, 255, 0)
    light.Brightness = 2
    light.Range = 10
    light.Parent = part
end

-- En yakın oyuncuyu bulma fonksiyonu
local function findClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (player.Character.Head.Position - LocalPlayer.Character.Head.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

-- Sürekli olarak en yakın oyuncuyu kontrol et ve kafasına ışık ekle
RunService.RenderStepped:Connect(function()
    local closestPlayer = findClosestPlayer()
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
        local head = closestPlayer.Character.Head

        -- Eğer başta ışık yoksa, bir tane ekle
        if not head:FindFirstChildOfClass("PointLight") then
            createLight(head)
        end
    end
end)
