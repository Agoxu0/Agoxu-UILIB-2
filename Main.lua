-- Variables
local viewport = workspace.CurrentCamera.ViewportSize
local runService = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")

local Library = {}

function Library:CreateWindow(Name)
	for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
		if v.Name == "Agoxu UILIB3" then
			v:Destroy()
		end
	end
	local GUI = {
		CurrentTab = nil
	}
	local Name = Name or ""
	do -- Main
	-- StarterGui.bad name
	GUI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
	GUI["1"]["Name"] = [[Agoxu UILIB3]];

	-- StarterGui.bad name.Main
	GUI["2"] = Instance.new("Frame", GUI["1"]);
	GUI["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
	GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["2"]["Size"] = UDim2.new(0, 450, 0, 325);
	GUI["2"]["BorderColor3"] = Color3.fromRGB(41, 41, 41);
	GUI["2"]["Position"] = UDim2.new(0.5, 0, -1, 0);
	GUI["2"]["Name"] = [[Main]];
	local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Bounce)
	local goal = {
		Position = UDim2.new(0.5, 0, .5, 0)
	}
	local tween = TweenService:Create(GUI["2"], tweenInfo, goal)
		tween:Play()

	-- StarterGui.bad name.Main.UICorner
	GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);
	end
	do -- TopBar
		-- StarterGui.bad name.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["4"]["Name"] = [[TopBar]];
		do --Draggable
			local UserInputService = game:GetService("UserInputService")

			local gui = GUI["2"]

			local dragging
			local dragInput
			local dragStart
			local startPos

			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end

			GUI["4"].InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			GUI["4"].InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
		end

		-- StarterGui.bad name.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);
		GUI["5"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.bad name.Main.TopBar.Extension
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
		GUI["6"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["6"]["Name"] = [[Extension]];

		-- StarterGui.bad name.Main.TopBar.Title
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		-- GUI["7"]["FontFace"] = ;
		GUI["7"]["TextSize"] = 14;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["7"]["Text"] = Name
		GUI["7"]["Name"] = [[Title]];
		GUI["7"]["Font"] = Enum.Font.Ubuntu;
		GUI["7"]["BackgroundTransparency"] = 1;

		-- StarterGui.bad name.Main.TopBar.Title.UIPadding
		GUI["8"] = Instance.new("UIPadding", GUI["7"]);
		GUI["8"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.bad name.Main.TopBar.ExitBtn
		GUI["9"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["9"]["Image"] = [[http://www.roblox.com/asset/?id=7436812392]];
		GUI["9"]["Size"] = UDim2.new(0, 25, 0, 25);
		GUI["9"]["Name"] = [[ExitBtn]];
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Position"] = UDim2.new(1, -4, 0, 3);
		local MouseHovering = false
		local Frame = GUI["9"]
		Frame.MouseEnter:Connect(function ()
			MouseHovering = true
		end)
		Frame.MouseLeave:Connect(function ()
			MouseHovering = false
		end)
		game:GetService("UserInputService").InputEnded:Connect(function (input, gameProcessed)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and MouseHovering then
				local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear)
				local goal = {
					Transparent = 1
				}
				local tween = TweenService:Create(GUI["1"], tweenInfo, goal)
				tween:Play()
				tween.Completed:Wait()
				GUI["1"]:Destroy()
			end
		end)
	end
	do -- ContentContainer
		-- StarterGui.bad name.Main.ContentContainer
		GUI["14"] = Instance.new("Frame", GUI["2"]);
		GUI["14"]["BorderSizePixel"] = 0;
		GUI["14"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
		GUI["14"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["14"]["BackgroundTransparency"] = 1;
		GUI["14"]["Size"] = UDim2.new(1, -128, 1, -42);
		GUI["14"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["14"]["Name"] = [[ContentContainer]];
		
	end	
	do -- Navigation
		-- StarterGui.bad name.Main.Navigation
		GUI["a"] = Instance.new("Frame", GUI["2"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["a"]["Size"] = UDim2.new(0, 115, 1, -30);
		GUI["a"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["a"]["Name"] = [[Navigation]];

		-- StarterGui.bad name.Main.Navigation.UICorner
		GUI["b"] = Instance.new("UICorner", GUI["a"]);
		GUI["b"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.bad name.Main.Navigation.Hide
		GUI["c"] = Instance.new("Frame", GUI["a"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["c"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["c"]["Name"] = [[Hide]];

		-- StarterGui.bad name.Main.Navigation.Hide2
		GUI["d"] = Instance.new("Frame", GUI["a"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		GUI["d"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["d"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["d"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["d"]["Name"] = [[Hide2]];

		-- StarterGui.bad name.Main.Navigation.ButtonHolder
		GUI["e"] = Instance.new("Frame", GUI["a"]);
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["e"]["BackgroundTransparency"] = 1;
		GUI["e"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["e"]["Name"] = [[ButtonHolder]];

		-- StarterGui.bad name.Main.Navigation.ButtonHolder.UIPadding
		GUI["f"] = Instance.new("UIPadding", GUI["e"]);
		GUI["f"]["PaddingTop"] = UDim.new(0, 8);
		GUI["f"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.bad name.Main.Navigation.ButtonHolder.UIListLayout
		GUI["10"] = Instance.new("UIListLayout", GUI["e"]);
		GUI["10"]["Padding"] = UDim.new(0, 1);
		GUI["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		function GUI:CreateTab(Name,ID)
			local Tab = {
				Active = false
			}
			local Name = Name or ""
			local ID = ID or 0
			-- StarterGui.bad name.Main.Navigation.ButtonHolder.Home
			Tab["11"] = Instance.new("TextLabel", GUI["e"]);
			Tab["11"]["BorderSizePixel"] = 0;
			Tab["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			-- GUI["11"]["FontFace"] = ;
			Tab["11"]["TextSize"] = 14;
			Tab["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["11"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["11"]["Text"] = [[Home]];
			Tab["11"]["Name"] = [[Home]];
			Tab["11"]["Font"] = Enum.Font.Ubuntu;
			Tab["11"]["BackgroundTransparency"] = 1;
			local MouseHovering = false
			

			-- StarterGui.bad name.Main.Navigation.ButtonHolder.Home.UIPadding
			Tab["12"] = Instance.new("UIPadding", Tab["11"]);
			Tab["12"]["PaddingLeft"] = UDim.new(0, 28);

			-- StarterGui.bad name.Main.Navigation.ButtonHolder.Home.Icon
			Tab["13"] = Instance.new("ImageLabel", Tab["11"]);
			Tab["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["13"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["13"]["Image"] = "rbxassetid://"..ID;
			Tab["13"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["13"]["Name"] = [[Icon]];
			Tab["13"]["BackgroundTransparency"] = 1;
			Tab["13"]["Position"] = UDim2.new(0, -24, 0.5, 0);
			if ID == 0 then
				Tab["13"].Visible = false
			end

			-- StarterGui.bad name.Main.ContentContainer.HomeTab
			Tab["15"] = Instance.new("ScrollingFrame", GUI["14"]);
			Tab["15"]["BorderSizePixel"] = 0;
			Tab["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["15"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
			Tab["15"]["BackgroundTransparency"] = 1;
			Tab["15"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["15"]["Selectable"] = false;
			Tab["15"]["ScrollBarThickness"] = 0;
			Tab["15"]["Name"] = [[HomeTab]];
			Tab["15"].Visible = false
			-- StarterTab.bad name.Main.ContentContainer.HomeTab.UIListLayout
			Tab["1a"] = Instance.new("UIListLayout", Tab["15"]);
			Tab["1a"]["Padding"] = UDim.new(0, 5);
			Tab["1a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					Tab.Active = true
					Tab["11"].BackgroundTransparency = 0.8
					Tab["15"].Visible = true
					GUI.CurrentTab = Tab
				end
			end
			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab["11"].BackgroundTransparency = 1
					Tab["15"].Visible = false
				end
			end
			do
				local Frame = Tab["11"]

				Frame.MouseEnter:Connect(function ()
					MouseHovering = true
				end)

				Frame.MouseLeave:Connect(function ()
					MouseHovering = false
				end)

				game:GetService("UserInputService").InputEnded:Connect(function (input, gameProcessed)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and MouseHovering then
						Tab:Activate()
					end
				end)
			end
			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
			function Tab:CreateButton(Name,callback)
				local Name = Name or ""
				local callback = callback or function() end
				local Button = {}
				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Button
				Button["16"] = Instance.new("Frame", Tab["15"]);
				Button["16"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
				Button["16"]["Size"] = UDim2.new(1, 0, 0, 35);
				Button["16"]["Name"] = [[Button]]

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Button.UICorner
				Button["17"] = Instance.new("UICorner", Button["16"]);
				Button["17"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Button.Title
				Button["18"] = Instance.new("TextLabel", Button["16"]);
				Button["18"]["BorderSizePixel"] = 0;
				Button["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				-- Tab["18"]["FontFace"] = ;
				Button["18"]["TextSize"] = 14;
				Button["18"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["18"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["18"]["Text"] = Name
				Button["18"]["Name"] = [[Title]];
				Button["18"]["Font"] = Enum.Font.Ubuntu;
				Button["18"]["BackgroundTransparency"] = 1;

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["19"] = Instance.new("UIPadding", Button["16"]);
				Button["19"]["PaddingTop"] = UDim.new(0, 6);
				Button["19"]["PaddingRight"] = UDim.new(0, 6);
				Button["19"]["PaddingBottom"] = UDim.new(0, 6);
				Button["19"]["PaddingLeft"] = UDim.new(0, 6);
				local MouseHovering = false
				local Frame = Button["16"]

				Frame.MouseEnter:Connect(function ()
					MouseHovering = true
				end)

				Frame.MouseLeave:Connect(function ()
					MouseHovering = false
				end)

				game:GetService("UserInputService").InputEnded:Connect(function (input, gameProcessed)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and MouseHovering then
						callback()
					end
				end)
				return Button
			end
			function Tab:CreateLabel(Text)
				local Text = Text or ""
				local Label = {}
				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Label
				Label["1b"] = Instance.new("Frame", Tab["15"]);
				Label["1b"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
				Label["1b"]["Size"] = UDim2.new(1, 0, 0, 35);
				Label["1b"]["Name"] = [[Label]];

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Label.UICorner
				Label["1c"] = Instance.new("UICorner", Label["1b"]);
				Label["1c"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Label.Title
				Label["1d"] = Instance.new("TextLabel", Label["1b"]);
				Label["1d"]["BorderSizePixel"] = 0;
				Label["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				-- Tab["1d"]["FontFace"] = ;
				Label["1d"]["TextSize"] = 14;
				Label["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["1d"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["1d"]["Name"] = [[Title]];
				Label["1d"]["Font"] = Enum.Font.Ubuntu;
				Label["1d"]["BackgroundTransparency"] = 1;

				-- StarterTab.bad name.Main.ContentContainer.HomeTab.Label.UIPadding
				Label["1e"] = Instance.new("UIPadding", Label["1b"]);
				Label["1e"]["PaddingTop"] = UDim.new(0, 6);
				Label["1e"]["PaddingRight"] = UDim.new(0, 6);
				Label["1e"]["PaddingBottom"] = UDim.new(0, 6);
				Label["1e"]["PaddingLeft"] = UDim.new(0, 6);
				return Label
			end
			function Tab:CreateSlider(Name,min,max,callback)
				local Name = Name or ""
				local callback = callback or function() end
				local min = min or 0
				local max = max or 50
				local Slider = {
					Connection = nil
				}
				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider
				Slider["1f"] = Instance.new("Frame", Tab["15"]);
				Slider["1f"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
				Slider["1f"]["Size"] = UDim2.new(1, 0, 0, 35);
				Slider["1f"]["Name"] = [[Slider]];

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.UICorner
				Slider["20"] = Instance.new("UICorner", Slider["1f"]);
				Slider["20"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.Title
				Slider["21"] = Instance.new("TextLabel", Slider["1f"]);
				Slider["21"]["BorderSizePixel"] = 0;
				Slider["21"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				-- Slider["21"]["FontFace"] = ;
				Slider["21"]["TextSize"] = 14;
				Slider["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["21"]["Size"] = UDim2.new(1, 0, 1, -10);
				Slider["21"]["Text"] = Name
				Slider["21"]["Name"] = [[Title]];
				Slider["21"]["Font"] = Enum.Font.Ubuntu;
				Slider["21"]["BackgroundTransparency"] = 1;

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.UIPadding
				Slider["22"] = Instance.new("UIPadding", Slider["1f"]);
				Slider["22"]["PaddingTop"] = UDim.new(0, 6);
				Slider["22"]["PaddingRight"] = UDim.new(0, 6);
				Slider["22"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["22"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.Value
				Slider["23"] = Instance.new("TextLabel", Slider["1f"]);
				Slider["23"]["BorderSizePixel"] = 0;
				Slider["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				-- Slider["23"]["FontFace"] = ;
				Slider["23"]["TextSize"] = 14;
				Slider["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["23"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["23"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["23"]["Text"] = [[0]];
				Slider["23"]["Name"] = [[Value]];
				Slider["23"]["Font"] = Enum.Font.Ubuntu;
				Slider["23"]["BackgroundTransparency"] = 1;
				Slider["23"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.SliderBack
				Slider["24"] = Instance.new("Frame", Slider["1f"]);
				Slider["24"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
				Slider["24"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["24"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["24"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["24"]["Name"] = [[SliderBack]];

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.SliderBack.UIStroke
				Slider["25"] = Instance.new("UIStroke", Slider["24"]);
				Slider["25"]["Color"] = Color3.fromRGB(51, 51, 51);
				Slider["25"]["Thickness"] = 1.5;

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.SliderBack.Draggable
				Slider["26"] = Instance.new("Frame", Slider["24"]);
				Slider["26"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
				Slider["26"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["26"]["Name"] = [[Draggable]];

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.SliderBack.Draggable.UICorner
				Slider["27"] = Instance.new("UICorner", Slider["26"]);
				Slider["27"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterSlider.bad name.Main.ContentContainer.HomeSlider.Slider.SliderBack.UICorner
				Slider["28"] = Instance.new("UICorner", Slider["24"]);
				Slider["28"]["CornerRadius"] = UDim.new(0, 4);
				function Slider:SetValue(v)
					if v == nil then
						local percentage = math.clamp((mouse.X - Slider["24"].AbsolutePosition.X) / (Slider["24"].AbsoluteSize.X),0,1)
						local value = math.floor(((max - min) * percentage) + min)
					
						Slider["23"].Text = tostring(value)
						Slider["26"].Size = UDim2.fromScale(percentage,1)
					else
						Slider["23"].Text = tostring(v)
						Slider["26"].Size = UDim2.fromScale(((v - min) / (max - min)),1)
					end
					callback(Slider:GetValue())
				end
				function Slider:GetValue()
					return tonumber(Slider["23"].Text)
				end
				local MouseHovering = false
				local Frame = Slider["1f"]

				Frame.MouseEnter:Connect(function ()
					MouseHovering = true
				end)

				Frame.MouseLeave:Connect(function ()
					MouseHovering = false
				end)
				
				uis.InputBegan:Connect(function(input,gne)
					if gne then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and MouseHovering then
						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)
				
				uis.InputEnded:Connect(function(input,gne)
					if gne then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
				
				
				return Slider
			end
			function Tab:CreateToggle(Name,callback)
				local Name = Name or ""
				local callback = callback or function() end
				local Toggle = {}
				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle
				Toggle["29"] = Instance.new("Frame", Tab["15"]);
				Toggle["29"]["BackgroundColor3"] = Color3.fromRGB(22, 22, 22);
				Toggle["29"]["Size"] = UDim2.new(1, 0, 0, 35);
				Toggle["29"]["Name"] = [[Toggle]];

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.UICorner
				Toggle["2a"] = Instance.new("UICorner", Toggle["29"]);
				Toggle["2a"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.Title
				Toggle["2b"] = Instance.new("TextLabel", Toggle["29"]);
				Toggle["2b"]["BorderSizePixel"] = 0;
				Toggle["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				-- Toggle["2b"]["FontFace"] = ;
				Toggle["2b"]["TextSize"] = 14;
				Toggle["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["2b"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["2b"]["Text"] = Name
				Toggle["2b"]["Name"] = [[Title]];
				Toggle["2b"]["Font"] = Enum.Font.Ubuntu;
				Toggle["2b"]["BackgroundTransparency"] = 1;

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.UIPadding
				Toggle["2c"] = Instance.new("UIPadding", Toggle["29"]);
				Toggle["2c"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["2c"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["2c"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["2c"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.ToggleSwitch
				Toggle["2d"] = Instance.new("Frame", Toggle["29"]);
				Toggle["2d"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
				Toggle["2d"]["AnchorPoint"] = Vector2.new(1, 0);
				Toggle["2d"]["Size"] = UDim2.new(0, 70, 0, 23);
				Toggle["2d"]["Position"] = UDim2.new(1, 0, 0, 1);
				Toggle["2d"]["Name"] = [[ToggleSwitch]];

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.ToggleSwitch.UICorner
				Toggle["2e"] = Instance.new("UICorner", Toggle["2d"]);
				Toggle["2e"]["CornerRadius"] = UDim.new(1, 0);

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.ToggleSwitch.Switch
				Toggle["2f"] = Instance.new("Frame", Toggle["2d"]);
				Toggle["2f"]["BackgroundColor3"] = Color3.fromRGB(255,0,0);
				Toggle["2f"]["Size"] = UDim2.new(0, 30, 0, 23);
				Toggle["2f"]["Position"] = UDim2.new(0, 0, 0, 0);
				Toggle["2f"]["Name"] = [[Switch]];

				-- StarterToggle.bad name.Main.ContentContainer.HomeToggle.Toggle.ToggleSwitch.Switch.UICorner
				Toggle["30"] = Instance.new("UICorner", Toggle["2f"]);
				Toggle["30"]["CornerRadius"] = UDim.new(1, 0);
				local MouseHovering = false
				local Frame = Toggle["2d"]

				Frame.MouseEnter:Connect(function ()
					MouseHovering = true
				end)

				Frame.MouseLeave:Connect(function ()
					MouseHovering = false
				end)
				local ts = false
				game:GetService("UserInputService").InputEnded:Connect(function (input, gameProcessed)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and MouseHovering then
						if ts == true then
							ts = false
							callback(false)
							local tweenInfo = TweenInfo.new(.3, Enum.EasingStyle.Linear)
							local goal = {
								BackgroundColor3 = Color3.fromRGB(255,0,0),
								Position = UDim2.new(0,0,0,0)
							}
							local tween = TweenService:Create(Toggle["2f"], tweenInfo, goal)
							tween:Play()
						else
							ts = true
							callback(true)
							local tweenInfo = TweenInfo.new(.3, Enum.EasingStyle.Linear)
							local goal = {
								BackgroundColor3 = Color3.fromRGB(55,200,0),
								Position = UDim2.new(.6,0,0,0)
							}
							local tween = TweenService:Create(Toggle["2f"], tweenInfo, goal)
							tween:Play()
						end
					end
				end)
				return Toggle
			end
			return Tab
		end
	end
	
	return GUI
end

return Library
