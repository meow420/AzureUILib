local azureLib = {}

function azureLib:DraggingEnabled(frame, parent)
    parent = parent or frame

    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function azureLib:CreateWindow(hubnamee)
    local UI = Instance.new("ScreenGui")
    local MainWindow = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local ya = Instance.new("Frame")
    local XD = Instance.new("UIGradient")
    local UIGradient = Instance.new("UIGradient")
    local hubname = Instance.new("TextLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local ContainerFake = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TabContainer = Instance.new("Frame")
    local gameTitle = Instance.new("TextLabel")
    local SectionBackground = Instance.new("Frame")
    local SectionContainers = Instance.new("Folder")

    azure:DraggingEnabled(MainWindow, MainWindow)
    
    UI.Name = "UI"
    UI.Parent = game.CoreGui
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainWindow.Name = "MainWindow"
    MainWindow.Parent = UI
    MainWindow.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
    MainWindow.Position = UDim2.new(0, 361, 0, 262)
    MainWindow.Size = UDim2.new(0, 529, 0, 309)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = MainWindow

    UIStroke.Parent = MainWindow
    UIStroke.Transparency = 0.2
    UIStroke.Thickness = 2
    UIStroke.Color = Color3.fromRGB(140, 0, 255)
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    UIStroke.LineJoinMode = Enum.LineJoinMode.Round

    XD.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
    XD.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.90), NumberSequenceKeypoint.new(0.50, 0.75), NumberSequenceKeypoint.new(1.00, 0.90)}
    XD.Parent = UIStroke

    ya.Name = "ya"
    ya.Parent = MainWindow
    ya.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    ya.BorderSizePixel = 0
    ya.Position = UDim2.new(-0, 0, 0.104999997, 0)
    ya.Size = UDim2.new(1, 0, 0.00700000022, 0)

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
    UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.90), NumberSequenceKeypoint.new(0.50, 0.75), NumberSequenceKeypoint.new(1.00, 0.90)}
    UIGradient.Parent = ya

    hubname.Name = "hubname"
    hubname.Parent = MainWindow
    hubname.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
    hubname.BackgroundTransparency = 1.000
    hubname.Position = UDim2.new(0.0190437771, 0, 0, 0)
    hubname.Size = UDim2.new(0.966445208, 0, 0.111999989, 0)
    hubname.Font = Enum.Font.GothamBold
    hubname.Text = hubnamee
    hubname.TextColor3 = Color3.fromRGB(140, 0, 255)
    hubname.TextSize = 17.000
    hubname.TextWrapped = true
    hubname.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
    UIGradient_2.Parent = hubname

    ContainerFake.Name = "ContainerFake"
    ContainerFake.Parent = MainWindow
    ContainerFake.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ContainerFake.BorderSizePixel = 0
    ContainerFake.Position = UDim2.new(0, 7, 0, 41)
    ContainerFake.Size = UDim2.new(0, 147, 0, 260)

    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = ContainerFake

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = ContainerFake
    TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 2, 0, 39)
    TabContainer.Size = UDim2.new(0, 145, 0, 221)

    gameTitle.Name = "gameTitle"
    gameTitle.Parent = ContainerFake
    gameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    gameTitle.BackgroundTransparency = 1.000
    gameTitle.Position = UDim2.new(0.0209126379, 0, 0.0230769236, 0)
    gameTitle.Size = UDim2.new(0, 137, 0, 25)
    gameTitle.Font = Enum.Font.GothamBold
    gameTitle.Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    gameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameTitle.TextScaled = true
    gameTitle.TextSize = 15.000
    gameTitle.TextWrapped = true

    SectionBackground.Name = "SectionBackground"
    SectionBackground.Parent = ContainerFake
    SectionBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SectionBackground.BorderSizePixel = 0
    SectionBackground.Position = UDim2.new(0, 160, 0, 0)
    SectionBackground.Size = UDim2.new(0, 354, 0, 260)
    
    SectionContainers.Name = "SectionContainers"
    SectionContainers.Parent = SectionBackground
    
    local Tabs = {}

    function Tabs:CreateTab(tabname)
        local Tab = Instance.new("TextButton")
        local ya_2 = Instance.new("Frame")
        local UIGradient_3 = Instance.new("UIGradient")
        local UICorner_3 = Instance.new("UICorner")
        local UIGridLayout = Instance.new("UIGridLayout")
        local UICorner_4 = Instance.new("UICorner")
        local ScrollingFrame = Instance.new("ScrollingFrame")
    
        Tab.Name = tabname.." Container"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0, 19, 0, 0)
        Tab.Size = UDim2.new(0, 125, 0, 20)
        Tab.Font = Enum.Font.GothamBold
        Tab.Text = tabname
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 14.000
        Tab.TextWrapped = true
        Tab.TextXAlignment = Enum.TextXAlignment.Left
    
        ya_2.Name = "yeah"
        ya_2.Parent = Tab
        ya_2.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
        ya_2.BorderSizePixel = 0
        ya_2.Position = UDim2.new(0, -9, 0, 1)
        ya_2.Size = UDim2.new(0, 2, 0, 20)
        ya_2.BackgroundTransparency = 1
        ya_2.Visible = false

        UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
        UIGradient_3.Parent = ya_2
    
        UICorner_3.CornerRadius = UDim.new(0, 12)
        UICorner_3.Parent = ya_2
    
        UIGridLayout.Parent = TabContainer
        UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout.CellSize = UDim2.new(0.800000012, 0, 0.100000001, 0)
    
        UICorner_4.CornerRadius = UDim.new(0, 3)
        UICorner_4.Parent = SectionBackground
        
        ScrollingFrame.Name = tabname.." Container"
        ScrollingFrame.Parent = SectionContainers
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Size = UDim2.new(0, 354, 0, 260)
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollingFrame.ScrollBarThickness = 0
        ScrollingFrame.Visible = false

        Tab.MouseButton1Click:Connect(function()
            for i,v in next, SectionContainers:GetChildren() do
                v.Visible = false
            end 
            ScrollingFrame.Visible = true
            print(ScrollingFrame.Name)
            for i,v in next, TabContainer:GetChildren() do
                if v.Name ~= ya_2.Parent.Name and v:FindFirstChild("yeah") then
                    for ii = 0,1, 0.15 do
                        wait(0.025)
                        v.yeah.BackgroundTransparency = ii
                    end 
                    v.yeah.BackgroundTransparency = 1
                    v.yeah.Visible = false
                end
            end 
            if not ya_2.Visible then
                ya_2.Visible = true
                wait(0.175)
                for i = 1,0, -0.15 do
                    wait(0.025)
                    ya_2.BackgroundTransparency = i
                end 
                ya_2.BackgroundTransparency = 0
            end 
        end)
        local Sections = {}

        function Sections:CreateSection(sectionName)
            local Section = Instance.new("TextLabel")
            local ya_3 = Instance.new("Frame")
            local UIGradient_4 = Instance.new("UIGradient")
            local UIListLayout = Instance.new("UIListLayout")

            Section.Name = sectionName.." Section"
            Section.Parent = ScrollingFrame
            Section.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Section.BackgroundTransparency = 1.000
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(0, 353, 0, 32)
            Section.Font = Enum.Font.GothamBold
            Section.Text = sectionName
            Section.TextColor3 = Color3.fromRGB(250, 250, 250)
            Section.TextSize = 17.000
            
            ya_3.Name = "ya"
            ya_3.Parent = Section
            ya_3.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
            ya_3.BorderSizePixel = 0
            ya_3.Position = UDim2.new(0, 6, 0, 31)
            ya_3.Size = UDim2.new(0, 353, 0, 1)
            
            UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
            UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.90), NumberSequenceKeypoint.new(0.50, 0.75), NumberSequenceKeypoint.new(1.00, 0.90)}
            UIGradient_4.Parent = ya_3
            
            UIListLayout.Parent = ScrollingFrame
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 7)
            local FunctionLib = {}

            function FunctionLib:CreateToggle(toggleText, callback)
                local actions = {}
                local enabled = false

                local ToggleFrame = Instance.new("Frame")
                local ToggleText = Instance.new("TextLabel")
                local UICorner_5 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")
                local XDGradient = Instance.new("UIGradient")
                local ToggleSelect = Instance.new("Frame")
                local UIGradient_5 = Instance.new("UIGradient")
                local ToggleButton = Instance.new("TextButton")

                ToggleFrame.Name = "ToggleFrame"
                ToggleFrame.Parent = ScrollingFrame
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                ToggleFrame.Position = UDim2.new(0, -31, 0, 180)
                ToggleFrame.Size = UDim2.new(0, 336, 0, 23)
                
                ToggleText.Name = "ToggleText"
                ToggleText.Parent = ToggleFrame
                ToggleText.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                ToggleText.BorderSizePixel = 0
                ToggleText.Position = UDim2.new(0, 10, 0, 2)
                ToggleText.Size = UDim2.new(0, 283, 0, 20)
                ToggleText.Font = Enum.Font.GothamBold
                ToggleText.Text = toggleText
                ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.TextSize = 14.000
                ToggleText.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner_5.Parent = ToggleFrame

                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleFrame
                ToggleButton.BackgroundColor3 = Color3.fromRGB(54,54,54)
                ToggleButton.BorderSizePixel = 0
                ToggleButton.BackgroundTransparency = 1
                ToggleButton.TextTransparency = 1
                ToggleButton.Size = UDim2.new(1,0,1,0)
                ToggleButton.TextSize = 14.000
                ToggleButton.Position = UDim2.new(0,0,0,0)

                ToggleSelect.Name = "ToggleSelect"
                ToggleSelect.Parent = ToggleFrame
                ToggleSelect.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
                ToggleSelect.BackgroundTransparency = 1.000
                ToggleSelect.BorderColor3 = Color3.fromRGB(27, 42, 53)
                ToggleSelect.BorderSizePixel = 0
                ToggleSelect.Position = UDim2.new(0.930000007, 0, 0.224999994, 0)
                ToggleSelect.Selectable = false
                ToggleSelect.Size = UDim2.new(0.0415929109, 0, 0.578202426, 0)
                
                UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
                UIGradient_5.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.74), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.76)}
                UIGradient_5.Parent = ToggleSelect
                
                UIStroke_2.Parent = ToggleSelect
                UIStroke_2.Transparency = 0.2
                UIStroke_2.Thickness = 2
                UIStroke_2.Color = Color3.fromRGB(140, 0, 255)
                UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
                UIStroke_2.LineJoinMode = Enum.LineJoinMode.Round

                XDGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
                XDGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.74), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.76)}
                XDGradient.Parent = UIStroke_2
                local function fire()
                    enabled = not enabled
                    if enabled then 
                        spawn(function()
                            for i = 1,0, -0.15 do
                                wait(0.025)
                                ToggleSelect.BackgroundTransparency = i
                            end 
                            ToggleSelect.BackgroundTransparency = 0
                        end)
                    else
                        spawn(function()
                            for i = 0,1, 0.15 do
                                wait(0.025)
                                ToggleSelect.BackgroundTransparency = i
                            end 
                            ToggleSelect.BackgroundTransparency = 1
                        end)
                    end
                    pcall(callback, enabled)
                end
                ToggleButton.MouseButton1Click:Connect(fire)
            end
            function FunctionLib:CreateButton(buttonText, callback)
                local ButtonFrame = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local ButtonText = Instance.new("TextButton")
                local callback = callback or function() end

                ButtonFrame.Name = buttonText.." Button"
                ButtonFrame.Parent = ScrollingFrame
                ButtonFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                ButtonFrame.Position = UDim2.new(0, -31, 0, 180)
                ButtonFrame.Size = UDim2.new(0, 336, 0, 23)
                
                UICorner_6.Parent = ButtonFrame
                
                ButtonText.Name = "ButtonText"
                ButtonText.Parent = ButtonFrame
                ButtonText.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
                ButtonText.BackgroundTransparency = 1.000
                ButtonText.BorderColor3 = Color3.fromRGB(27, 42, 53)
                ButtonText.BorderSizePixel = 0
                ButtonText.Position = UDim2.new(0, 10, 0, 0)
                ButtonText.Selectable = false
                ButtonText.Size = UDim2.new(0, 316, 0, 23)
                ButtonText.Selected = true
                ButtonText.Font = Enum.Font.GothamBold
                ButtonText.Text = buttonText
                ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonText.TextSize = 14.000
                ButtonText.TextXAlignment = Enum.TextXAlignment.Left
                
                ButtonText.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)
            end 

            function FunctionLib:CreateSlider(text, minvalue, maxvalue, callback)
                minvalue = minvalue or 0
                maxvalue = maxvalue or 100

                callback = callback or function() end 

                local Slider = Instance.new("Frame")
                local SliderLabel = Instance.new("TextLabel")
                local UICorner_7 = Instance.new("UICorner")
                local SliderButton = Instance.new("TextButton")
                local UICorner_8 = Instance.new("UICorner")
                local SliderInner = Instance.new("Frame")
                local UICorner_9 = Instance.new("UICorner")
                local UIGradient_6 = Instance.new("UIGradient")
                local SliderText = Instance.new("TextLabel")
                local UICorner_10 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollingFrame
                Slider.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                Slider.Position = UDim2.new(0, 9, 0, 99)
                Slider.Size = UDim2.new(0, 336, 0, 55)
                
                SliderLabel.Name = "SliderLabel"
                SliderLabel.Parent = Slider
                SliderLabel.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
                SliderLabel.BorderSizePixel = 0
                SliderLabel.Position = UDim2.new(0, 10, 0, 0)
                SliderLabel.Size = UDim2.new(0, 222, 0, 24)
                SliderLabel.Font = Enum.Font.GothamBold
                SliderLabel.Text = text
                SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderLabel.TextSize = 14.000
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                UICorner_7.CornerRadius = UDim.new(0, 6)
                UICorner_7.Parent = Slider
                
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderButton.Position = UDim2.new(0.0297619049, 0, 0.563636363, 0)
                SliderButton.Size = UDim2.new(0, 315, 0, 18)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000
                SliderButton.TextTransparency = 1.000
                
                UICorner_8.CornerRadius = UDim.new(0, 6)
                UICorner_8.Parent = SliderButton
                
                SliderInner.Name = "SliderInner"
                SliderInner.Parent = SliderButton
                SliderInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderInner.Size = UDim2.new(0, 6, 0, 18)
                
                UICorner_9.CornerRadius = UDim.new(0, 6)
                UICorner_9.Parent = SliderInner
                
                UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(140, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 255))}
                UIGradient_6.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.90), NumberSequenceKeypoint.new(0.50, 0.75), NumberSequenceKeypoint.new(1.00, 0.90)}
                UIGradient_6.Parent = SliderInner
                
                SliderText.Name = "SliderText"
                SliderText.Parent = Slider
                SliderText.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                SliderText.Position = UDim2.new(0.746999979, 0, 0.108999997, 0)
                SliderText.Size = UDim2.new(0, 75, 0, 18)
                SliderText.Font = Enum.Font.GothamBold
                SliderText.Text = "0"
                SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.TextSize = 14.000
                
                UICorner_10.CornerRadius = UDim.new(0, 6)
                UICorner_10.Parent = SliderText
                local holding = false
                SliderButton.MouseButton1Down:Connect(function()
                    if not holding then
                        holding = true
                        Valueee = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 315) * SliderInner.AbsoluteSize.X) + tonumber(minvalue)) or 0
                        pcall(function()
                            callback(Valueee)
                        end)
                        SliderInner.Size = UDim2.new(0, math.clamp(Mouse.X - SliderInner.AbsolutePosition.X, 0, 315), 0, 16)
                        moveconnection = Mouse.Move:Connect(function()
                            SliderText.Text = Valueee
                            Valueee = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 315) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Valueee)
                            end)
                            SliderInner.Size = UDim2.new(0, math.clamp(Mouse.X - SliderInner.AbsolutePosition.X, 0, 315), 0, 16)
                        end)
                        releaseconnection = input.InputEnded:Connect(function(Mousee)
                            if Mousee.UserInputType == Enum.UserInputType.MouseButton1 then
                                holding = false
                                Valueee = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 315) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
                                pcall(function()
                                    callback(Valueee)
                                end)
                                SliderInner.Size = UDim2.new(0, math.clamp(Mouse.X - SliderInner.AbsolutePosition.X, 0, 315), 0, 16)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                        input.WindowFocusReleased:Connect(function()
                            holding = false
                            Valueee = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 315) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Valueee)
                            end)
                            SliderInner.Size = UDim2.new(0, math.clamp(Mouse.X - SliderInner.AbsolutePosition.X, 0, 315), 0, 16)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end)
                    else
                        holding = false
                        Valueee = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 315) * SliderInner.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Valueee)
                        end)
                        SliderInner.Size = UDim2.new(0, math.clamp(Mouse.X - SliderInner.AbsolutePosition.X, 0, 315), 0, 16)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end 

            return FunctionLib
        end 
        return Sections;
    end
    return Tabs;
end
