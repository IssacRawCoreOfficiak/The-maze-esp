local espEnabled = false

local function createESP(monster)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "MonsterESP"
    billboard.Adornee = monster:FindFirstChild("Head")
    billboard.Size = UDim2.new(0, 100, 0, 100)
    billboard.AlwaysOnTop = true

    local frame = Instance.new("Frame", billboard)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.new(1, 0, 0)

    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 0.2, 0)
    textLabel.Position = UDim2.new(0, 0, -0.2, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = monster.Name
    textLabel.TextColor3 = Color3.new(1, 0, 0)
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextScaled = true

    billboard.Parent = monster.Head
end

local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        for _, monster in pairs(workspace:GetChildren()) do
            if monster:FindFirstChild("Head") and (monster.Name == "Cave Crawler" or monster.Name == "Orotund") then
                if not monster.Head:FindFirstChild("MonsterESP") then
                    createESP(monster)
                end
            end
        end
    else
        for _, monster in pairs(workspace:GetChildren()) do
            if monster:FindFirstChild("Head") then
                local esp = monster.Head:FindFirstChild("MonsterESP")
                if esp then
                    esp:Destroy()
                end
            end
        end
    end
end

workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and child:FindFirstChild("Head") and (child.Name == "Cave Crawler" or child.Name == "Orotund") then
        if espEnabled then
            createESP(child)
        end
    end
end)
