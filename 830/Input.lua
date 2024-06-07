--[[

 _____ ______  _____  _____  _   _       __     __  _____  _____  _      _       ___  ______  _____  _____ 
|  _  || ___ \|_   _||  _  || \ | |     / /    / / /  __ \|  _  || |    | |     / _ \ | ___ \/  ___||  ___|
| | | || |_/ /  | |  | | | ||  \| |    / /    / /  | /  \/| | | || |    | |    / /_\ \| |_/ /\ `--. | |__  
| | | ||    /   | |  | | | || . ` |   / /    / /   | |    | | | || |    | |    |  _  ||  __/  `--. \|  __| 
\ \_/ /| |\ \  _| |_ \ \_/ /| |\  |  / /    / /    | \__/\\ \_/ /| |____| |____| | | || |    /\__/ /| |___ 
 \___/ \_| \_| \___/  \___/ \_| \_/ /_/    /_/      \____/ \___/ \_____/\_____/\_| |_/\_|    \____/ \____/ 
                                                                                                           
	twigkid: Scripted: Input, UI, Effects, Mode Switch, Animated: BREAKDOWN, MELLIOQUENT, 404-ERROR%$^$%FORBIDDEN
	Chip: Scripted: Multiple Modes, Animated: (Too many to count..)
	Maximilito: Animated: Walk, Run, Side 3, Jump, Multiple modes.

Chip: 


	Credits:
	|	Scripting[
	|	.	twigkid;
	|	.	Chip;
	|	.	]
	|	.	
	|	Animating[
	|	.	twigkid;
	|	.	Chip;
	|	.	Maximilito;
	|	.	]
	|	.
	|	Mode Ideas[
	|	.	twigkid;
	|	.	Chip;
	|	.	Maximilito;
	|	.	]
	|
	
	
	Started on: 11/30/2023
	Ended on: Not done.
	
	

                                      

]]

local Songs_S1 = {
	"Team Grimoire // I can't put this name.";
	"CREEP-P - DOGWALK [POSCA VON GABBA VS. CHU CHU’S DEATH]";
	"The Quick Brown Fox // SHUT DOWN EVERYTHING (Bootleg)";
	"The Quick Brown Fox // Gotsta Terrify";
	"The Quick Brown Fox // Louder!! Louder!!!! Louder!!!!!!";
	"NegaRen // D.A.A.N.C.C.E.";
	"PLURR-DEAD RAVEYARD // LABEL ME A FREAK";
	"Camellia // landgridding (DX - ★★)";
	"m1dy // MAD SPEEDY DISORDER";
	"RIOT // OVERKILL";
	"KgZ- // [Dark/Trance] Black Snow (Violin Arrangement)";
	"403 ERROR (a.k.a. xi vs ZUMMER) - Forbidden";
	"SigSig [Dark Side Remix] /DJ TECHNORCH";
	"RUMBLERAGGA - COMPLETE AND TOTAL PERCUSSIVE DOMINANCE [POSCA VON GABBA'S HARDCORE NEVER DIES RMX]";
	"Yooh // Dignity -alzando-";
	"Camellia // NUCLEAR-STAR";
	"XIANO // Blue Zenith";
	"Negaren // Operation Deflounge";
	"The Sickest Squad // The World is Mine";
	"Promo // Thunderstorm";
	"COTILES // ENA MIX [CHU CHU'S KILL EM' ALL RMX]";
	"EMERGENCY (Frenchcore) // NOTORIETY";
	"Noah ft.大瀬良あい // Rebirth the end Part I // Sasanqua & Rebirth the end Part II // Starcluster";
	"The Quick Brown Fox // Burning Brain";
	"Unknown Author // Behemoth (Extended Mix)";
	"OZIGIRI // Ozigiri Garegga";
	"Camellia // Berserkerz' Warfare 345";
	"Cold Kiss Sound // Duality Rave";
	"-Satori Komeiji- // [Arch] Answer";
	"G*reSh*t // I Love You More Each Time You Die";
	"NO.9 // END OF THE CENTURY (DDR 3RD MIX)"
}

local Songs_S2 = {
	"Monstercat // Cheat Codes";
	"Monstercat // Breakdown VIP";
	"Pegboard Nerds // Hero";
	"Excision & Pegboard Nerds // Bring The Madness (Noisestorm Remix)";
	"Stephen Walking // Dads In Space";
}

local Songs_S3 = {
	"Promo // Thunderstorm";
	"Ophidian // Love Is Digital";
	"Nagazaki - Iblis [PR011]";
	"Unknown Author // Behemoth (Extended Mix)";
	"Remzcore // Take Me High";
	"Interstellar // Main Theme (Envy - Frenchcore)";
}

local Side_Names = {
	"Accel";
	"Core";
	"Origin.";
}

wait(6)

local multi = 0
local cf_0=CFrame.new(0,0,0)
local angles = CFrame.Angles
local function getMetamethodFromErrorStack(userdata,f,test) -- mw, please stop changing the lerps every god-damn week.
	local ret=nil
	xpcall(f,function()
		ret=debug.info(2,"f")
	end,userdata,nil,0)
	if (type(ret)~="function") or not test(ret) then
		return f
	end
	return ret
end


local cfMul=getMetamethodFromErrorStack(cf_0,function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character  = LocalPlayer.Character
local Mouse = LocalPlayer:GetMouse()
local Side = 1


local Main = script.Parent.Parent
local Events = Main:WaitForChild("Events")

local cf_0=CFrame.new(0,0,0)

local Inverse=cf_0.Inverse
local Lerp=cf_0.Lerp

local rad = math.rad

local deltaTime = tonumber(script.Parent.Parent.VAR.DT.Value)

Mouse.KeyDown:Connect(function(Key)
	Events.KeyDown:FireServer(Key)
end)
Mouse.KeyUp:Connect(function(Key)
	Events.KeyUp:FireServer(Key)
end)
Mouse.Button1Down:Connect(function()
	Events.MouseDown:FireServer()
end)
Mouse.Button1Up:Connect(function()
	Events.MouseUp:FireServer()
end)
local Move = false
Mouse.Move:Connect(function()
	Move=true
end)
Mouse.Idle:Connect(function()
	Move=false
end)

task.spawn(function()
	while true do
		task.wait()
		if Move == true then
			Events.Mouse:FireServer(Mouse.Hit)
			Events.Target:FireServer(Mouse.Target)
			task.wait(0.25 / 2)
		end
	end
end)

Mouse.KeyUp:Connect(function(Key)
	Events.KeyUp:FireServer(Key)
end)

local ModeUI = Character:WaitForChild("Head"):FindFirstChildOfClass("BillboardGui")
local ModeText = ModeUI:FindFirstChildOfClass("TextLabel")

local Color1 = ModeText.TextColor3
local Color2 = ModeText.TextStrokeColor3

local UI = script.Parent.Parent:WaitForChild("OC")
UI.Parent = LocalPlayer.PlayerGui



local H = Character:FindFirstChildOfClass("Humanoid")

local addition = 0
local VAR = script.Parent.Parent:WaitForChild("VAR")


local RS = game["Run Service"]
for _, x in pairs(UI.HP:GetChildren()) do
	if x:IsA("GuiObject") then
		local a = x.Position
		if x.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
			local Type = Instance.new("NumberValue",x)
		end
		if x:IsA("TextLabel") then
			if x.TextColor3 == Color3.fromRGB(255, 0, 0) then
				local Type = Instance.new("NumberValue",x)
			end
		end
		RS.Heartbeat:Connect(function()
			if x:IsA("TextLabel") and x:FindFirstChildOfClass("NumberValue") then
				x.TextColor3 = Color1
				x.TextStrokeColor3 = Color3.new(0,0,0)
			end
			if x:IsA("Frame") then
				if x:FindFirstChildOfClass("NumberValue") then
					x.BackgroundColor3 = Color1
				end
			end
		if Side == 1 then
			
		if tonumber(script.Parent.Parent.VAR.MOG.Value) ~= 24 then
				if ModeText.Text == "ABSOLUTATION" or ModeText.Text == "ULTRA-FRENZY!" and tonumber(script.Parent.Parent.VAR.MOG.Value) ~= 12 then
					x.Rotation = 0 + 7 * math.sin(os.clock() * 1.625 + addition * 2)
					x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 8) * 1.625 + addition * 4), 0,  0 - 15 * math.sin((os.clock() + 3) * 1.625 + addition * 4))
				else
					x.Rotation = 0 + 7 * math.sin(os.clock() * 1.625)
					x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 8) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 3) * 1.625))
				end
			else
					x.Rotation = 0 + 15 * math.sin(os.clock() * 731)
					x.Position = a + UDim2.new(0, 0 + 25 * math.sin((os.clock() + 8) * 1651), 0,  0 - 25 * math.sin((os.clock() + 3) * 951))
					
		end	
			if tonumber(script.Parent.Parent.VAR.MOG.Value) == 12 then
				x.Rotation = 0 - 15 * math.sin(os.clock() * 872)
				x.Position = a + UDim2.new(0, 0 + 25 * math.sin((os.clock() + 16) * 1254), 0,  0 - 25 * math.sin((os.clock() + 5) * 612))
			end
			
			elseif Side == 2  then
				x.Rotation = 0 + 7 * math.sin(os.clock() * 1.625)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 8) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 3) * 1.625))
			elseif Side == 3  then
				x.Rotation = 0 + 7 * math.sin(os.clock() * 1.625)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 8) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 3) * 1.625))	
			end
		end)
	end
end
for _, x in pairs(UI.Mus:GetChildren()) do
	if x:IsA("GuiObject") then
		local a = x.Position
		if x.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
			local Type = Instance.new("NumberValue",x)
		end
		if x:IsA("TextLabel") then
			if x.TextColor3 == Color3.fromRGB(255, 0, 0) then
				local Type = Instance.new("NumberValue",x)
			end
		end
		RS.Heartbeat:Connect(function()
			if x:IsA("TextLabel") and x:FindFirstChildOfClass("NumberValue") then
				x.TextColor3 = Color1
				x.TextStrokeColor3 = Color3.new(0,0,0)
			end
			if x:IsA("Frame") then
				if x:FindFirstChildOfClass("NumberValue") then
					x.BackgroundColor3 = Color1
				end
			end	
		if Side == 1 then
			if tonumber(script.Parent.Parent.VAR.MOG.Value) ~= 24 then
				if ModeText.Text == "ABSOLUTATION" or ModeText.Text == "ULTRA-FRENZY!" and tonumber(script.Parent.Parent.VAR.MOG.Value) ~= 12 then
				x.Rotation = 0 - 7 * math.sin(os.clock() * 1.625 + addition * 2)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 16) * 1.625 + addition * 4), 0,  0 - 15 * math.sin((os.clock() + 5) * 1.625 + addition * 4))
			else
				x.Rotation = 0 - 7 * math.sin(os.clock() * 1.625)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 16) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 5) * 1.625))
			end
			else
				x.Rotation = 0 - 15 * math.sin(os.clock() * 872)
				x.Position = a + UDim2.new(0, 0 + 25 * math.sin((os.clock() + 16) * 1254), 0,  0 - 25 * math.sin((os.clock() + 5) * 612))
			end
			if tonumber(script.Parent.Parent.VAR.MOG.Value) == 12 then
				x.Rotation = 0 - 15 * math.sin(os.clock() * 872)
				x.Position = a + UDim2.new(0, 0 + 25 * math.sin((os.clock() + 16) * 1254), 0,  0 - 25 * math.sin((os.clock() + 5) * 612))
			end
			elseif Side == 2  then
				x.Rotation = 0 - 7 * math.sin(os.clock() * 1.625)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 16) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 5) * 1.625))
			elseif  Side == 3 then
				x.Rotation = 0 - 7 * math.sin(os.clock() * 1.625)
				x.Position = a + UDim2.new(0, 0 + 15 * math.sin((os.clock() + 16) * 1.625), 0,  0 - 15 * math.sin((os.clock() + 5) * 1.625))	
		end
		end)
	end
end
for _, x in pairs(UI.TopBar:GetChildren()) do
	if x:IsA("GuiObject") then
		if x.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
			local Type = Instance.new("NumberValue",x)
			RS.RenderStepped:Connect(function()
				x.BackgroundColor3 = Color1
				if x:IsA("TextLabel") then
					x.TextColor3 = Color1
					x.TextStrokeColor3 = Color3.new(0,0,0)
					x.Text = ModeText.Text.." // !ORION COLLAPSE!  WIELDER: "..LocalPlayer.DisplayName.." CORE: ".. tostring(H.Health).." // "..tostring(H.MaxHealth).. " // " .. Side_Names[Side]
				end
			end)
		end
		if x:IsA("TextLabel") then
			RS.RenderStepped:Connect(function()
				if x:IsA("TextLabel") then
					x.TextColor3 = Color1
					x.TextStrokeColor3 = Color3.new(0,0,0)
					x.Text = ModeText.Text.." // !ORION COLLAPSE!  WIELDER: "..LocalPlayer.DisplayName.." CORE: ".. tostring(H.Health).." // "..tostring(H.MaxHealth).. " // " .. Side_Names[Side]
				end
			if Side == 1 then
				if tonumber(script.Parent.Parent.VAR.MOG.Value) ~= 24 then
				x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*1.25),0.02, 0)
				x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1.25)
				else
					x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*645),0.02, 0)
					x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1251)
				end
				if  tonumber(script.Parent.Parent.VAR.MOG.Value) == 24 then
					x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*645),0.02, 0)
					x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1251)
				end
				x.BackgroundColor3 = Color1
					x.TextColor3 = Color1
					x.TextStrokeColor3 = Color3.new(0,0,0)
					x.Text = ModeText.Text.." // !ORION COLLAPSE!  WIELDER: "..LocalPlayer.DisplayName.." // CORE: ".. tostring(H.Health).." // "..tostring(H.MaxHealth).. " // " .. Side_Names[Side]
				if  tonumber(script.Parent.Parent.VAR.MOG.Value) == 12	 then
					x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*645),0.02, 0)
					x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1251)
				end
			 elseif Side == 2  then
					x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*1.25),0.02, 0)
					x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1.25)
			 elseif Side == 3  then
					x.Position = UDim2.new(0, 0 + 15 * math.sin(os.clock()*1.25),0.02, 0)
					x.Rotation = 0 + 1 * math.sin((os.clock()+8) * 1.25)		
			end	
			end)
		end
	end
end



for _, x in pairs(Songs_S1) do
	print("SONG:".. x)
end

task.spawn(function()
	while true do
		task.wait()
		if Side == 1 then
			local Val = VAR.MOG
			if tonumber(Val.Value) then
				if tonumber(VAR.MOG.Value) == 1000 then
					UI.Mus.SONG.Text="..."
				elseif tonumber(VAR.MOG.Value) == 1001 then
					UI.Mus.SONG.Text="Calamari Inkantation 3MIX // @Squid Sisters feat. Deep Cut"
				elseif 	tonumber(VAR.MOG.Value) ~= 1000 and tonumber(VAR.MOG.Value) ~= 10001 then
					UI.Mus.SONG.Text = Songs_S1[tonumber(VAR.MOG.Value)]
				end

			end
		elseif Side == 2  then
			UI.Mus.SONG.Text = Songs_S2[tonumber(VAR.MOG.Value)]
		elseif Side == 3 then
			UI.Mus.SONG.Text = Songs_S3[tonumber(VAR.MOG.Value)]
		end
		
	end
end)


H.Changed:Connect(function(HP)
	if HP == "Health" then
		UI.HP.HP.Text = tostring(H.Health).." // "..tostring(H.MaxHealth)
	end
end)

function transform(seconds)
	seconds = math.floor(seconds+.5)
	local minutes,extra = 0,""

	if seconds >= 60 then
		repeat
			if seconds >= 60 then
				seconds = seconds - 60
				minutes = minutes + 1
			end
		until seconds < 60
	end
	if seconds < 10 then
		extra = "0"
	end
	return(minutes..":"..extra..seconds)
end

local M =Character:FindFirstChild("Torso"):FindFirstChildOfClass("Sound")
M.Parent = Character


RS.RenderStepped:Connect(function()
	Color1 = ModeText.TextColor3
	Color2 = ModeText.TextStrokeColor3
	addition = M.PlaybackLoudness / 1000
end)


task.spawn(function()
	while wait(1) do
		UI.Mus.Pos.Text = transform(M.TimePosition).." // "..transform(M.TimeLength)
	end
end)

workspace.CurrentCamera.CameraSubject = H


Character:WaitForChild("VFX"):Destroy()
local NEffects = Instance.new("Folder", Character)
Effects = script.Parent.Parent.Effects

local function MultiTween(Objects, Style, Dir, Time, Repeat, Reverse, Goal, DestroyObjectsOnFinish)
	if typeof(Objects) == "table" then
		for _, x in pairs(Objects) do
			if x:IsA("BasePart") then
				local Tween = game:GetService("TweenService"):Create(x, TweenInfo.new(Time, Style, Dir, Repeat, Reverse, 0), Goal)
				Tween:Play()
				Tween.Completed:Connect(function()
					Tween:Destroy()
					Tween = nil
					if DestroyObjectsOnFinish == true then
						x:Destroy()
					end
				end)
			end
		end
	elseif typeof(Objects) == "Instance" then
		local Tween = game:GetService("TweenService"):Create(Objects, TweenInfo.new(Time, Style, Dir, Repeat, Reverse, 0), Goal)
		Tween:Play()
		Tween.Completed:Connect(function()
			Tween:Destroy()
			Tween = nil
			if DestroyObjectsOnFinish == true then
				Objects:Destroy()
			end
		end)
	end
end


local function Block3D(StartCFrame, BeginSize, EndSize, CFrameMove, Material, Parent, StartColor, EndColor, TransparentSpeed, TransparentRoof, Lifetime)
	local Block = Instance.new("Part", Parent)
	Block.Material = Material
	Block.Anchored = true Block.CanCollide = false Block.CanTouch = false Block.CanQuery = false
	Block.CFrame = StartCFrame
	Block.Size = BeginSize
	Block.Color = StartColor
	if TransparentSpeed == nil then
		Tween(Block,"Linear","Out",Lifetime,{Color = EndColor, Transparency = 1.01, Size = EndSize})
	else
		Tween(Block,"Linear","Out",Lifetime,{Color = EndColor, Size = EndSize})
	end
	task.spawn(function()
		while Block do
			game["Run Service"].Heartbeat:Wait()
			Block.CFrame = Block.CFrame * CFrameMove
			if TransparentSpeed ~= nil then
				Block.Transparency = Block.Transparency + TransparentSpeed
			end
			if Block.Transparency > TransparentRoof then
				Block:Destroy() Block=nil
				break
			end
		end
	end)
end

local function EffectSphere(CF, Speed, Color, Size, EndSize, Parent, Trans)
	local P = Instance.new("Part", Parent)
	P.Size = Size
	P.Color = Color
	P.CFrame = CF
	P.Material = Enum.Material.Neon
	P.Anchored = true P.CanCollide = false P.CanTouch = false P.CanQuery = false
	local Msh = Instance.new("SpecialMesh", P)
	Msh.MeshType = Enum.MeshType.Sphere
	local p = Instance.new("PointLight", P)
	p.Color = Color
	p.Shadows = true
	p.Range=Size.X*20
	task.spawn(function()
		while P do
			task.wait()
			P.CFrame = P.CFrame * CFrame.new(0, 0, -Speed)
			P.Size = P.Size:Lerp(EndSize, 0.15)
			P.Transparency = P.Transparency + Trans
			p.Brightness = 1 - P.Transparency
			if P.Transparency > 1 then
				P:Destroy() P = nil
				break
			end
		end
	end)
end

function Tween(Object, Style, Direction, Time, Goal)
	local tweenInfo = TweenInfo.new(Time, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
	local tween = game:GetService("TweenService"):Create(Object, tweenInfo, Goal)

	tween.Completed:Connect(function()
		tween:Destroy()
	end)

	tween:Play()

	return tween
end

local function Slash3DX(CF, Direction, Offset, Rot,StartSize, EndSize, SizeDelta, TransparencySpeed, Color,Par)
	local Slash = Effects.Slash2DX:Clone()
	Slash.Parent = workspace.Terrain
	if Par ~= nil then
		Slash.Parent = Par
	end
	Slash.CFrame = CF
	Slash.Size=StartSize
	task.spawn(function()
		Slash.T.ImageLabel.ImageColor3=Color
		Slash.B.ImageLabel.ImageColor3=Color
		local TV=0
		while Slash do
			game:GetService("RunService").Heartbeat:Wait()
			Slash.CFrame=Slash.CFrame*CFrame.Angles(math.rad(0.5), math.rad(0.1), 0)
			Slash.Size=Slash.Size:Lerp(EndSize,SizeDelta)
			TV=TV+TransparencySpeed
			Slash.T.ImageLabel.ImageTransparency=TV
			Slash.B.ImageLabel.ImageTransparency=TV
			if TV > 1 then
				Slash:Destroy() Slash=nil TV=nil
			end
		end
	end)
end

local function Slash2DX(Root, Direction, Offset, Rot,StartSize, EndSize, SizeDelta, TransparencySpeed, Color, Rot2)
	local RC = workspace:Raycast(Root.Position, Root.CFrame.UpVector*Direction, RaycastParams.new())
	if RC then
		local Slash = Effects.Slash2DX:Clone()
		Slash.Parent = Effects
		Slash.Position = RC.Position
		Slash.Size=StartSize
		Slash.Orientation=RC.Instance.Orientation+Vector3.new(180,Rot,math.random(-0.5,0.5))
		if Rot2 ~= nil then
			Slash.Orientation=Rot2
			Slash.Parent=Character
		end
		task.spawn(function()
			Slash.T.ImageLabel.ImageColor3=Color
			Slash.B.ImageLabel.ImageColor3=Color
			local TV=0
			while Slash do
				game:GetService("RunService").Heartbeat:Wait()
				Slash.CFrame=Slash.CFrame*CFrame.Angles(math.rad(0.5), math.rad(0.1), 0)
				Slash.Size=Slash.Size:Lerp(EndSize,SizeDelta)
				TV=TV+TransparencySpeed
				Slash.T.ImageLabel.ImageTransparency=TV
				Slash.B.ImageLabel.ImageTransparency=TV
				if TV > 1 then
					Slash:Destroy() Slash=nil TV=nil
				end
			end
		end)
	end
end



RS.Heartbeat:Connect(function()
	local Torso = Character:FindFirstChild("Torso")
	local HumanoidRootPart = Character:FindFirstChildOfClass("Humanoid").RootPart
	HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(20, 0.3, 0.5, 1, 1)
	local C1 = Color1
	local MOG = tonumber(VAR.MOG.Value)
	if Side == 1 then
	if MOG == 2 then
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(275,0.0001,275), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(175,0.0001,175), 0.1, 0.04, C1)
	end
	if MOG == 3 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-150, 150), -4, math.random(-150, 150)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.035)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(205,0.0001,205), 0.1, 0.04, C1)
	end
	if MOG == 6 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-15,15), -4, math.random(-15, 15)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.035)
	end
	if MOG == 5 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-45,45), -4, math.random(-45, 45)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
	end
	if MOG == 7 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-45,45), -4, math.random(-45, 45)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(305,0.0001,305), 0.1, 0.04, C1)
	end
	if MOG == 1001 then
		--Block3D(HumanoidRootPart.CFrame * cf(math.random(-500, 500), 0, math.random(-500, 500))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(2.5, 2.5, 2.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-145,145), -4, math.random(-145, 145)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.1, 0.04, C1)
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-145,145), -4, math.random(-145, 145)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(1365,0.0001,1365), 0.125, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(1305,0.0001,1305), 0.125, 0.04, C1)
	end
	if MOG == 11 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color3.new(0.0588235, 0.2, 1),Color3.new(0,0,0),nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color3.new(0.0588235, 0.2, 1),Color3.new(0,0,0),nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(100,0.0001,100), 0.1, 0.04, C1)
	end
		if MOG == 12 then
			EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-250,250), -4, math.random(-250, 250)) * CFrame.Angles(math.rad(90+math.random(-25, 25)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
			
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-85, 85), -3.5, math.random(-85, 85))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-85, 85), -3.5, math.random(-85, 85))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-85, 85), -3.5, math.random(-85, 85))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-85, 85), -3.5, math.random(-85, 85))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		
		
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(400,0.0001,400), 0.1, 0.04, Color2)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(250,0.0001,250), 0.1, 0.04, C1)
	end
	if MOG == 24 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(400,0.0001,400), 0.1, 0.04, Color1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(200,0.0001,200), 0.1, 0.04, Color1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(100,0.0001,100), 0.1, 0.04, Color1)
	end
	if MOG == 25 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(250,0.0001,250), 0.1, 0.04, Color1)
		
	end
	if MOG == 28 then
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(250,0.0001,250), 0.1, 0.04, Color1)
	end
	
		if MOG == 15 then
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.08, 0.04, Color2)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			
		end
		if MOG == 17 then
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color2)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))

		end
		if MOG == 13 then
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color2)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))

		end
		if MOG == 14 then
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(165,0.0001,165), 0.08, 0.04, Color2)
		end
	if MOG == 8 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color1,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(125,0.0001,125), 0.08, 0.04, Color1)
	end
	if MOG == 20 then
			EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-45,45), -4, math.random(-45, 45)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.08, 0.04, Color2)
	end
	
	if MOG == 27 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(565,0.0001,565), 0.08, 0.04, Color1)
	end
		if MOG == 31 then
			--Block3D(HumanoidRootPart.CFrame * cf(0 + 0.5 * sin(os.clock() * 2), -3, 0 - 4 * sin((os.clock() + 6.5) * 2)) * angles(rad(0), rad(-multi), rad(0)), Vector3.new(0.95, 0.95, 0.95), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			--Block3D(HumanoidRootPart.CFrame * cf(0 + 0.5 * sin(os.clock() * 2), -3, 0 - 4 * sin((os.clock() + 6.5) * 2)) * angles(rad(0), rad(multi), rad(0)), Vector3.new(0.95, 0.95, 0.95), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-135, 135), -3.5, math.random(-135, 135))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.08, 0.04, Color1)
		end
	elseif Side == 2 then
		if MOG == 2 then
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(765,0.0001,765), 0.08, 0.04, Color1)
			Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(765,0.0001,765), 0.08, 0.04, Color2)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-75, 75), -3.5, math.random(-75, 75))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color2,nil,1,math.random(0.25,1))
		end
	end
	

end)


-- FAKE_JOINT

function Conv(Joint)
	local Fake = Joint:Clone()
	Fake.Parent = Joint.Parent
	local C0,C1=Joint.C0,Joint.C1
	RS.RenderStepped:Connect(function()
		if Joint ~= nil then
			Joint.C0=C0
			Joint.C1=C1
		end
	end)
	Fake.Name=Joint.Name.."_fJ"
	return Fake
end

local LeftArm, RightArm = Character:FindFirstChild("Left Arm"), Character:FindFirstChild("Right Arm")
local LeftLeg, RightLeg = Character:FindFirstChild("Left Leg"), Character:FindFirstChild("Right Leg")
local Torso, Head = Character:FindFirstChild("Torso"), Character:FindFirstChild("Head")
local HumanoidRootPart = Character:FindFirstChildOfClass("Humanoid").RootPart

local LeftShoulder = Torso:FindFirstChild("Left Shoulder")
local RightShoulder = Torso:FindFirstChild("Right Shoulder")
local LeftHip = Torso:FindFirstChild("Left Hip")
local RightHip = Torso:FindFirstChild("Right Hip")
local Neck = Torso:FindFirstChild("Neck")
local RootJoint = HumanoidRootPart:FindFirstChildOfClass("Motor6D")

LeftShoulder = Conv(LeftShoulder) RightShoulder = Conv(RightShoulder) LeftHip = Conv(LeftHip) RightHip = Conv(RightHip) RootJoint = Conv(RootJoint) Neck = Conv(Neck)

cf, angles, sin = CFrame.new, CFrame.Angles, math.sin

local Sprint = false

Mouse.KeyDown:Connect(function(K)
	if K == "0" then
		Sprint = true
	end
end)
Mouse.KeyUp:Connect(function(K)
	if K == "0" then
		Sprint = false
	end
end)


local Camera = workspace.CurrentCamera
RS.RenderStepped:Connect(function()
	Side = tonumber(script.Parent.Parent.VAR.S.Value)
	local MoveDir = H.MoveDirection
	local MoveType = script.Parent.Parent.VAR.MoveT.Value
	local Attack = script.Parent.Parent.VAR.Attack.Value
	local Mag = HumanoidRootPart.Velocity.Magnitude
	local AttackID = tonumber(script.Parent.Parent.VAR.AttackID.Value)
	local Mag=HumanoidRootPart.Velocity.Magnitude
	
	if Side == 1 then
	if Mag > 1000 and Sprint == true and script.Parent.Parent.VAR.MoveT.Value == "BFloat" and Attack == false then
		workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*cf(math.random(-1,1)/5,math.random(-1,1)/5,math.random(-1,1)/5)
	end
	if tonumber(script.Parent.Parent.VAR.MOG.Value) == 1001 and (workspace.CurrentCamera.CFrame.Position - HumanoidRootPart.Position).Magnitude < 90 and Attack == false then
		workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*cf(math.random(-1,1)/20,math.random(-1,1)/20,math.random(-1,1)/20)
	end
	
	if tonumber(script.Parent.Parent.VAR.MOG.Value) == 24 or tonumber(script.Parent.Parent.VAR.MOG.Value) == 12 then
		workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*cf(math.random(-1,1)/5,math.random(-1,1)/5,math.random(-1,1)/5)
	end 
	end
	
	--if MoveDir.X < 0.5
	--RootJoint.C1 = RootJoint.C1:Lerp()
	
	-- Default camera movement
	
	if Mag < 0.5 then
		H.CameraOffset =  H.CameraOffset:Lerp(Vector3.new(-RootJoint.C0.X / 4, RootJoint.C0.Y + 0.25 * sin(os.clock()*1), 0 + 0.25 * sin((os.clock()+6)*1)), 0.1) 
		Camera.CFrame = Camera.CFrame * angles(rad(0 + 00.05 * sin(os.clock()*1.25)),rad(0 - 00.07 * sin((os.clock()+2)*1.25)),0)
		elseif Mag > 0.5 then
		H.CameraOffset =  H.CameraOffset:Lerp(Vector3.new(-RootJoint.C0.X / 4, RootJoint.C0.Y + 0.25 * sin(os.clock()*3), 0 + 0.25 * sin((os.clock()+6)*3)), 0.1) 
		Camera.CFrame = Camera.CFrame * angles(rad(0 + 00.05 * sin(os.clock()*1.25)),rad(0 - 00.07 * sin((os.clock()+2)*3.25)),0)
	end
	
	if AttackID == 4  and Attack == true then
		workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*cf(math.random(-1,1)/2,math.random(-1,1)/2,math.random(-1,1)/2)
	elseif AttackID == 6 and Attack == true then
		workspace.CurrentCamera.CFrame=workspace.CurrentCamera.CFrame*cf(math.random(-1,1)/2,math.random(-1,1)/2,math.random(-1,1)/2)
	end
	
	Tween(Camera, "Linear", "Out", 0.04, {FieldOfView = 70 + M.PlaybackLoudness / 300})
end)

local Direction="F"
local LC1, RC1 = LeftHip.C1, RightHip.C1
RS.Heartbeat:Connect(function()
	deltaTime = tonumber(script.Parent.Parent.VAR.DT.Value)
	local sine = os.clock()
	local C1 = Color1
	local VS=HumanoidRootPart.Velocity.Y
	local MOG = tonumber(script.Parent.Parent.VAR.MOG.Value)
	local MoveType = script.Parent.Parent.VAR.MoveT.Value
	local Attack = script.Parent.Parent.VAR.Attack.Value
	local Mag = HumanoidRootPart.Velocity.Magnitude
	local AttackID = tonumber(script.Parent.Parent.VAR.AttackID.Value)
	
	local relativeVelocity = (HumanoidRootPart.CFrame - HumanoidRootPart.Position):Inverse() * Vector3.new(HumanoidRootPart.AssemblyLinearVelocity.X, HumanoidRootPart.AssemblyLinearVelocity.Y, HumanoidRootPart.AssemblyLinearVelocity.Z)
	
	local X = math.round(relativeVelocity.X)/16
	local Y = math.round(relativeVelocity.Y)/16
	local Z = math.round(relativeVelocity.Z)/16
	
	if Z < -.75 then --front
		Direction = "F"
	end
	if Z > .75 then --back
		Direction = "B"
	end
	if X < -.75 then --right?
		Direction = "R"
	end
	if X > .75 then --left?
		Direction = "L"
	end
	
	local YHeight = RootJoint.C0.Y
	
	multi = multi + 2
	if Attack == true then
		if AttackID == 3 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, -0.6485389471054077, 0.6804534196853638),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, 0.6485389471054077, -0.6804534196853638),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-2.4434609413146973, 6.69697328703478e-08, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackID == 4 then
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,Color2,NEffects)
			Slash3DX(Torso.CFrame * cf(0, -3, 0) * CFrame.Angles(rad(math.random(-15, 15)), math.random(-360, 360), 0),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,Color1,NEffects)
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,Color1,NEffects)
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, -0.4891166687011719, -1.375839114189148),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, 0.4891166687011719, 1.375839114189148),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159518718719482, -1.182133436203003, -1.6104704141616821),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.0471974611282349, 4.371139183945161e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-1.3962633609771729, -1.518080772200392e-08, 3.141592502593994),0.15)
		end
		
		if AttackID == 5 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, -0.6485389471054077, 0.6804534196853638),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, 0.6485389471054077, -0.6804534196853638),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.25, -0.6499999761581421)*CFrame.Angles(-1.5707964897155762, -1.2217304706573486, -1.134464144706726),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-1.5707964897155762, 1.2217304706573486, 1.134464144706726),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-2.4434609413146973, 6.69697328703478e-08, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, 4.5, 0)*CFrame.Angles(-2.268928050994873, -5.61942812282723e-08, -3.141592502593994),0.15)
		elseif AttackID == 6 then
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,Color2,NEffects)
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,Color1,NEffects)
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, -0.4891166687011719, -1.375839114189148),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, 0.4891166687011719, 1.375839114189148),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, 0, -1)*CFrame.Angles(-3.1415927410125732, -1.396263599395752, -2.7052602767944336),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.2217305898666382, 0, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, 4.5, 0)*CFrame.Angles(-1.3962632417678833, -1.5180820156501795e-08, -3.141592502593994),0.15)
		elseif AttackID == 7 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, -0.5)*CFrame.Angles(2.4434609413146973, 1.1566949353891687e-07, 0.9599313735961914),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0.5, 1)*CFrame.Angles(-0, 1.2217307090759277, 2.181661367416382),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.3962633609771729, 1.518080772200392e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackID == 8 then
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
			Slash3DX(HumanoidRootPart.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,C1,Effects)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,Color2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,Color1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1, 0, 0)*CFrame.Angles(-1.5707963705062866, -1.0471975803375244, -2.4434609413146973),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0.5, -1)*CFrame.Angles(-1.125640630722046, 1.182133436203003, 3.0146520137786865),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.2217304706573486, 2.9900348863520776e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackID == 9 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1, 0, 0)*CFrame.Angles(-1.5707963705062866, -1.0471975803375244, -2.4434609413146973),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0, 0)*CFrame.Angles(-1.5707963705062866, 1.0471975803375244, 2.4434609413146973),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.2217304706573486, 2.9900348863520776e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)	
		end
	end
	
	if VS > 1 and Attack == false then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0)*angles(-1.5707963267948966,1.3962634015954636+0.04363323129985824*sin(sine*-50),1.3962634015954636),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0)*angles(-1.5707963267948966,-1.3962634015954636+0.04363323129985824*sin(sine*50),-1.3962634015954636),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.175,0)*angles(-0.3490658503988659,-1.5707963267948966,0),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.25,-0.75)*angles(-0.1308996938995747,1.5707963267948966,0),deltaTime) 
	end
	if VS < -1 and Attack == false then
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1+0.05*sin(sine*50),1.25,-0.2)*angles(0.3490658503988659+0.08726646259971647*sin(sine*-50),1.3962634015954636+0.08726646259971647*sin(sine*-50),-4.014257279586958),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.08726646259971647*sin((sine+1)*-50),0,3.141592653589793),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.0471975511965976+0.04363323129985824*sin((sine+0.5)*50),0,3.141592653589793),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.25,-0.75)*angles(-0.9599310885968813,1.2217304763960306,0.5235987755982988),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1,0.025)*angles(-0.8726646259971648+0.08726646259971647*sin(sine*-50),-1.0471975511965976,-0.3490658503988659),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1+0.05*sin(sine*-50),1.25,-0.2)*angles(0.3490658503988659+0.08726646259971647*sin((sine+1)*-50),-1.3962634015954636+0.08726646259971647*sin(sine*50),4.014257279586958),deltaTime) 
	end
	
	if Side == 1  and VS < 1.5 and VS > -1.5 then
	
	if Attack == false then
	if Mag < 0.35 and MOG == 3 then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.2181661564992912*sin((sine+0.75)*4),0,3.141592653589793),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.325+0.1*sin((sine - 0.25)*4),-0.2)*angles(0.6981317007977318+0.3490658503988659*sin((sine+0.75)*4),1.9634954084936207,-0.17453292519943295),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.325+0.1*sin((sine - 0.25)*4),-0.2)*angles(0.6981317007977318+0.3490658503988659*sin((sine+0.75)*4),-1.9634954084936207,0.17453292519943295),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5)*angles(-0.6981317007977318+0.39269908169872414*sin((sine+0.35)*4),-1.0471975511965976,0),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-1,-0.1)*angles(-0.6108652381980153+0.2181661564992912*sin((sine+0.75)*4),1.0471975511965976+0.17453292519943295*sin((sine-0.5)*2),0.3490658503988659),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,4+1*sin(sine*4),0)*angles(-2.2689280275926285+0.2181661564992912*sin((sine+0.5)*-4),0.08726646259971647*sin((sine-0.75)*2),3.141592653589793),deltaTime) 
	end
	if Mag < 0.35 and MOG == 2 then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.443460952792061+0.17453292519943295*sin((sine+0.75)*-1.75),-0.17453292519943295,-4.014257279586958+0.17453292519943295*sin(sine*-1.75)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1,-0.1)*angles(-0.9599310885968813+0.4363323129985824*sin((sine+0.25)*1.75),-1.0471975511965976+0.17453292519943295*sin(sine*-1.75),-0.5235987755982988),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.25+0.25*sin((sine - 0.5)*1.75),-0.75)*angles(-0.8726646259971648+0.3490658503988659*sin((sine+0.75)*1.75),1.0471975511965976+0.17453292519943295*sin((sine-0.25)*-1.75),0.6108652381980153),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(1 * sin((sine+0.5)*1.75),6+1*sin(sine*1.75),1 * sin(sine*1.75))*angles(-1.5707963267948966+0.17453292519943295*sin((sine+0.75)*1.75),0.8726646259971648+0.3490658503988659*sin((sine+0.75)*1.75),4.014257279586958+0.17453292519943295*sin(sine*1.75)),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.25,0.75,0)*angles(1.5707963267948966+0.17453292519943295*sin((sine-0.5)*-1.75),0.8726646259971648+0.3490658503988659*sin((sine-0.25)*1.75),0.5235987755982988+0.17453292519943295*sin((sine+1)*1.75)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.25,0)*angles(-0.3490658503988659+0.3490658503988659*sin((sine-0.75)*-1.75),-1.0471975511965976+0.3490658503988659*sin((sine+0.25)*1.75),-0.3490658503988659),deltaTime) 
	end
	if Mag < 0.35 and MOG == 1 then
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.35+0.15*sin((sine + 0.8)*-2),0)*angles(-0.6981317007977318,1.2217304763960306+0.17453292519943295*sin(sine*2),0.6981317007977318),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.075*sin((sine + 0.9)*2),-0.9+0.175*sin((sine - 0.1)*-2),0.075 * sin((sine+0.9)*-2))*angles(-0.8726646259971648+0.13962634015954636*sin((sine+0.8)*-2),-1.2217304763960306+0.04799655442984406*sin((sine+0.8)*2),-0.7417649320975901+0.08726646259971647*sin((sine+0.8)*-2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.75,-0.125)*angles(0.8726646259971648+0.05235987755982989*sin(sine*2),-2.2689280275926285+0.05235987755982989*sin(sine*2),-1.9198621771937625),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.075*sin((sine + 0.9)*2),-0.925+0.19*sin((sine + 0.225)*-2),0.075 * sin((sine-0.675)*2))*angles(-0.4799655442984406,0.8290313946973066+0.02181661564992912*sin((sine+0.8)*2),0.4886921905584123+0.07853981633974483*sin((sine+0.8)*-2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1325+0.175*sin((sine + 0.1)*2),0.2 * sin((sine+0.9)*2))*angles(-1.6144295580947547+0.08726646259971647*sin((sine+0.8)*2),0,3.883357585687383),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6406094968746698+0.05235987755982989*sin(sine*2),0.017453292519943295+0.05235987755982989*sin(sine*-2),2.443460952792061),deltaTime) 
	end
	if Mag < 0.35 and MOG == 4 then
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.025*sin((sine + 0.75)*2),-0.875+0.235*sin((sine - 0.025)*-2),0.1+0.15*sin((sine + 0.775)*-2))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.7)*-2),-1.1780972450961724+0.026179938779914945*sin((sine+0.7)*2),-0.3490658503988659+0.008726646259971648*sin((sine+0.7)*2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.175+0.25*sin(sine*2),0.25 * sin((sine+0.7)*2))*angles(-1.5271630954950384+0.09599310885968812*sin((sine+0.7)*2),0,3.4033920413889427),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295+0.1308996938995747*sin((sine-0.75)*2),0.017453292519943295*sin((sine-0.75)*-2),2.8797932657906435),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin((sine + 0.75)*2),-0.9+0.25*sin((sine + 0.075)*-2),-0.1+0.15*sin((sine + 0.75)*-2))*angles(-0.6981317007977318+0.017453292519943295*sin((sine+0.7)*-2),1.1344640137963142+0.008726646259971648*sin((sine+0.8)*2),0.6544984694978736+0.07853981633974483*sin((sine+0.7)*-2)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.125 * sin((sine+0.25)*-2),-0.0325+0.075*sin(sine*2))*angles(0.3490658503988659,-0.9599310885968813+0.1308996938995747*sin((sine-0.25)*2),-1.7453292519943295+0.1308996938995747*sin((sine-1)*-2)),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.125 * sin((sine+0.25)*-2),-0.0325+0.075*sin(sine*2))*angles(0.3490658503988659,1.0471975511965976+0.1308996938995747*sin((sine-0.25)*-2),1.7453292519943295+0.1308996938995747*sin((sine-1)*2)),deltaTime) 
	end
	if Mag < 0.35 and MOG == 5 then
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,-0.2+0.3*sin((sine + 3)*3),0)*angles(-1.3089969389957472,-1.1344640137963142+0.3490658503988659*sin((sine+0.5)*3),-1.3089969389957472),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.9-0.3*sin(sine*3),-0.7+0.3*sin((sine + 0.5)*3),-0.7)*angles(-1.3089969389957472,-0.9599310885968813+0.4363323129985824*sin((sine+1.75)*3),-1.3089969389957472),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,0.2 * sin((sine+1)*3),-0.7+0.2*sin(sine*3))*angles(-0.7853981633974483,0.9599310885968813,0.6108652381980153+0.3490658503988659*sin((sine+0.75)*3)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.75*sin((sine + 0.5)*3),1 * sin(sine*3))*angles(-1.9198621771937625+0.2617993877991494*sin(sine*3),-0.17453292519943295+0.08726646259971647*sin((sine+0.75)*3),4.101523742186674),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.2,0.4+0.2*sin(sine*3),-0.6)*angles(0,0.7853981633974483+0.05235987755982989*sin(sine*3),1.9198621771937625-0.2617993877991494*sin((sine+0.75)*3)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295-0.08726646259971647*sin((sine+0.5)*3),-0.20943951023931956+0.17453292519943295*sin(sine*3),2.356194490192345),deltaTime) 
	end
	if Mag < 0.35 and MOG == 6 then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636-0.1308996938995747*sin((sine+0.2)*1.85),-0.2617993877991494,3.141592653589793),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.95+0.15*sin((sine + 8)*1.85),-0.15 * sin((sine+0.5)*1.85))*angles(-0.3490658503988659+0.2617993877991494*sin(sine*1.85),-1.0471975511965976+0.17453292519943295*sin(sine*1.85),0.3490658503988659),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,4.5+0.45*sin((sine + 7.9)*1.85),0.15 * sin((sine+2)*1.85))*angles(-1.9198621771937625+0.1308996938995747*sin(sine*1.85),0.2617993877991494+0.026179938779914945*sin((sine+6)*1.85),3.141592653589793+0.07853981633974483*sin((sine+2)*1.85)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-0.08726646259971647,0.7853981633974483),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,1,0.35)*angles(-0.1308996938995747*sin((sine+0.2)*1.85),2.6179938779914944,2.530727415391778),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.35+0.1*sin((sine + 7.9)*1.85),-0.75)*angles(0.17453292519943295*sin((sine+0.5)*1.85),0.9599310885968813+0.04363323129985824*sin((sine+2)*1.85),-0.5235987755982988),deltaTime) 
	end
	if Mag < 0.35 and MOG == 7 then
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.2+0.1*sin(sine*2),0)*angles(0.6981317007977318,-0.7853981633974483+0.17453292519943295*sin((sine+0.75)*2),-1.2217304763960306),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.7-0.2*sin((sine + 1)*2),-0.5)*angles(-1.0471975511965976,1.3089969389957472,0.7853981633974483-0.17453292519943295*sin((sine+0.5)*2)),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461-0.08726646259971647*sin((sine+0.75)*2),-0.05235987755982989-0.05235987755982989*sin((sine+2)*2),3.4033920413889427-0.10471975511965978*sin(sine*2)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-0.7)*angles(-1.0471975511965976+0.004363323129985824*sin(sine*10),-1.3089969389957472+0.08726646259971647*sin(sine*2),-0.9599310885968813+0.05235987755982989*sin(sine*2)),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1-0.1*sin(sine*2),0.2-0.2*sin((sine + 0.75)*2),0)*angles(-1.5707963267948966,1.2217304763960306+0.17453292519943295*sin(sine*2),1.5707963267948966),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(-1 * sin((sine+0.75)*2),6+1*sin(sine*2),0)*angles(-1.5707963267948966+0.10471975511965978*sin((sine+0.5)*2),-0.08726646259971647+0.06981317007977318*sin((sine+0.25)*2),2.792526803190927+0.10471975511965978*sin(sine*2)),deltaTime) 
	end
	if Mag < 0.35 and MOG == 8 then
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.7,0,0)*angles(0.3490658503988659,-2.443460952792061,-1.9198621771937625+0.17453292519943295*sin(sine*2)),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.1-0.05*sin(sine*2),0.2-0.15*sin(sine*2),-0.5)*angles(-0.3490658503988659,0.5235987755982988+0.12217304763960307*sin((sine+0.4)*2),1.7453292519943295-0.17453292519943295*sin((sine+0.5)*2)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.7853981633974483,-1.3089969389957472-0.17453292519943295*sin((sine+1)*2),-1.3089969389957472),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.2 * sin((sine+0.5)*2),-0.7)*angles(-1.5707963267948966,1.3089969389957472+0.1308996938995747*sin(sine*2),1.8325957145940461),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461,-0.05235987755982989-0.08726646259971647*sin((sine+1)*2),2.9670597283903604),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(-0.5 * sin((sine+0.5)*2),3+0.5*sin(sine*2),0)*angles(-1.3089969389957472,0.17453292519943295+0.17453292519943295*sin((sine+0.5)*2),3.4033920413889427),deltaTime) 
	end
	if Mag < 0.35 and MOG == 9 then
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.2 * sin(sine*2),0)*angles(1.0471975511965976,-0.7853981633974483+0.2617993877991494*sin((sine+0.5)*2),-1.5707963267948966),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,-0.08726646259971647*sin((sine+0.5)*2),3.6651914291880923),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.45-0.1*sin(sine*2),0.4+0.075*sin((sine + 0.75)*2),0)*angles(1.3089969389957472,0.7853981633974483+0.1308996938995747*sin(sine*2),-0.7853981633974483),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1-0.15*sin((sine + 0.25)*2),-1.4+0.05*sin(sine*2),-0.3-0.075*sin(sine*2))*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.25)*2),1.0471975511965976-0.08726646259971647*sin(sine*2),1.1344640137963142-0.08726646259971647*sin((sine+0.25)*2)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-0.9-0.15*sin((sine + 0.25)*2),-1.2-0.05*sin(sine*2),-0.6+0.075*sin(sine*2))*angles(-1.3089969389957472+0.08726646259971647*sin((sine+0.25)*2),-1.0471975511965976-0.08726646259971647*sin(sine*2),-1.3089969389957472+0.08726646259971647*sin((sine+0.25)*2)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0.2 * sin((sine+0.25)*2),0,0)*angles(-1.5707963267948966,0.08726646259971647*sin(sine*2),2.530727415391778-0.05235987755982989*sin(sine*2)),deltaTime) 
	end
	if Mag < 0.35 and MOG == 10 then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6231562043547265-0.03490658503988659*sin((sine+0.5)*2.5),0,3.141592653589793),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.1+0.2*sin((sine + 0.7)*2.5),0)*angles(0.17453292519943295,2.6179938779914944,1.9198621771937625+0.17453292519943295*sin(sine*2.5)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin((sine + 0.75)*2.5),0.025 * sin(sine*2.5))*angles(-0.9599310885968813-0.03490658503988659*sin(sine*2.5),1.3089969389957472,0.9162978572970231),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,-0.2+0.2*sin((sine + 0.5)*2.5),0)*angles(-0.17453292519943295,-2.9670597283903604,-1.9198621771937625-0.17453292519943295*sin(sine*2.5)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin((sine + 0.75)*2.5),0.025 * sin(sine*2.5))*angles(-0.9599310885968813-0.03490658503988659*sin(sine*2.5),-1.3089969389957472,-0.9162978572970231),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.75)*2.5),0)*angles(-1.5184364492350666+0.03490658503988659*sin(sine*2.5),0,3.141592653589793),deltaTime) 
	end
	if Mag < 0.35 and MOG == 11 then
		RootJoint.C0=RootJoint.C0:Lerp(cf(0.2 * sin((sine+0.5)*2.5),-0.15+0.15*sin((sine - 0.1)*2.5),0.15 * sin((sine+0.15)*2.5))*angles(-1.3962634015954636+0.08726646259971647*sin((sine+0.15)*2.5),0.5235987755982988+0.08726646259971647*sin((sine+0.5)*2.5),3.839724354387525),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.138028333693054+0.08726646259971647*sin((sine-0.2)*2.5),-0.08726646259971647,2.443460952792061),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.05*sin(sine*2.5),-1.1+0.15*sin((sine + 0.15)*-2.5),0.025 * sin((sine-0.15)*2.5))*angles(-1.7453292519943295+0.08726646259971647*sin((sine-0.15)*-2.5),-1.2217304763960306+0.03490658503988659*sin(sine*2.5),-1.2217304763960306+0.08726646259971647*sin((sine+0.75)*2.5)),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.2 * sin(sine*2.5),-0.1+0.1*sin(sine*2.5))*angles(0,-0.6981317007977318,-1.0471975511965976+0.30543261909900765*sin((sine+0.5)*2.5)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin((sine - 0.2)*2.5),-0.8+0.19*sin((sine + 0.1)*-2.5),-0.1+0.1*sin((sine - 0.5)*2.5))*angles(-1.3962634015954636+0.05235987755982989*sin((sine-0.6)*2.5),0.9599310885968813+0.03490658503988659*sin((sine+0.6)*-2.5),0.8726646259971648+0.08726646259971647*sin((sine+0.1)*-2.5)),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1+0.1*sin(sine*-2.5),0.25+0.125*sin(sine*2.5),0)*angles(1.5707963267948966+0.08726646259971647*sin(sine*2.5),0.8726646259971648+0.2181661564992912*sin((sine+0.75)*2.5),0.6981317007977318),deltaTime) 
	end
	if Mag < 0.35 and MOG == 12 then
		RightHip.C0=Lerp(RightHip.C0,cf(1,-0.25+0.25*sin(sine*1.35),-0.765)*angles(-0.4363323129985824+0.2617993877991494*sin((sine+8)*1.35),1.3089969389957472,0),deltaTime) 
		Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.181661564992912,0,3.141592653589793+0.2617993877991494*sin(sine*2)),deltaTime) 
		RootJoint.C0=Lerp(RootJoint.C0,cf(1.25 * sin(sine*1.35),7.5+0.85*sin((sine+6)*1.35),-1.25 * sin(sine*1.35))*angles(-2.181661564992912+0.14835298641951802*sin(sine*1.35),0.4363323129985824+0.2617993877991494*sin(sine*1.35),3.141592653589793),deltaTime) 
		LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-0.95+0.25*sin((sine+12)*1.35),0)*angles(0.2617993877991494-0.3490658503988659*sin((sine+8)*1.35),-0.7853981633974483,0.2617993877991494),deltaTime) 
		RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.5,0)*angles(-0.4363323129985824+0.08726646259971647*sin((sine+6)*2),2.8797932657906435,2.530727415391778-0.08726646259971647*sin(sine*2)),deltaTime) 
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0,0)*angles(0.7853981633974483+0.14835298641951802*sin((sine+1.5)*1.35),-0.6108652381980153,-0.7853981633974483),deltaTime) 
	end
	if Mag < 0.35 and MOG == 13 then
		RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1.5,0.1+0.1*sin((sine+0.75)*6),0),angles(-1.5707963267948966,-0.17453292519943295+0.1308996938995747*sin(sine*6),1.5707963267948966-0.06981317007977318*sin(sine*6))),deltaTime) 
		RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.1+0.4*sin((sine+0.3)*6),-0.7),angles(-1.1344640137963142,1.3089969389957472+0.17453292519943295*sin((sine+1)*6),1.090830782496456-0.17453292519943295*sin((sine-0.75)*6))),deltaTime) 
		LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.15*sin((sine+0.3)*6),0),angles(-1.1344640137963142,-1.3089969389957472,-1.0471975511965976+0.2617993877991494*sin((sine-0.75)*6))),deltaTime) 
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.5,0.1+0.1*sin((sine+0.75)*6),0),angles(-1.5707963267948966,0.17453292519943295-0.1308996938995747*sin(sine*6),-1.5707963267948966+0.06981317007977318*sin(sine*6))),deltaTime) 
		Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.9198621771937625+0.05235987755982989*sin(sine*3),0,2.705260340591211)),deltaTime) 
		RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(2 * sin(sine*3),4+1*sin(sine*6),0),angles(-1.1344640137963142-0.05235987755982989*sin((sine+0.6)*6),0.06981317007977318*sin(sine*3),3.490658503988659)),deltaTime) 
	end
	if Mag < 0.35 and MOG == 1000 then -- Now It's a real thing!
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * cf(math.random(-1, 1)/0.5,math.random(-1, 1)/0.5,math.random(-1, 1)/0.5)
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953,0,3.141592653589793),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0,550+1*sin(sine*2),0)*angles(-2.0943951023931953-0.08726646259971647*sin((sine+0.75)*2),0,3.141592653589793),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.3,-1)*angles(-0.7853981633974483,1.3089969389957472,0.5235987755982988),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.3,-1)*angles(-0.7853981633974483,-1.3089969389957472,-0.5235987755982988),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,0.5,0)*angles(0.17453292519943295,-2.443460952792061,-2.0943951023931953),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.8,0.5,0)*angles(0.17453292519943295,2.443460952792061,2.0943951023931953),deltaTime) 
	end
	if Mag < 0.35 and MOG == 14 then
		RootJoint.C0=RootJoint.C0:Lerp(cf(0.25 * sin(sine*2),9+0.5*sin((sine - 0.5)*2),0.25 * sin((sine+0.75)*-2))*angles(0.3490658503988659+0.10471975511965978*sin(sine*2),1.9198621771937625+0.20943951023931956*sin((sine+0.5)*-2),-3.7524578917878086+0.08726646259971647*sin(sine*2)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin(sine*2),-1.1,0.2 * sin((sine+0.9)*2))*angles(-2.2689280275926285+0.10471975511965978*sin((sine-0.25)*-2),1.0471975511965976+0.2181661564992912*sin(sine*-2),1.2217304763960306+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5+0.1*sin((sine + 0.5)*2))*angles(-0.9599310885968813+0.2617993877991494*sin((sine+0.5)*-2),-1.2217304763960306+0.1308996938995747*sin((sine+0.75)*2),-0.6981317007977318),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0.25)*angles(-1.6580627893946132,1.0471975511965976,0.5235987755982988),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.9,0.1)*angles(-1.5707963267948966,-0.6981317007977318,1.7453292519943295),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.08726646259971647*sin((sine+0.325)*-2),0,1.9198621771937625+0.08726646259971647*sin(sine*-2)),deltaTime) 
	end
	if Mag < 0.35 and MOG == 25 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,0.175 * sin((sine+0.5)*2),-0.25)*angles(-0.5235987755982988,-1.0471975511965976+0.08726646259971647*sin(sine*-100),-0.6108652381980153+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-0.6981317007977318+0.17453292519943295*sin((sine+0.5)*-2),1.0471975511965976+0.17453292519943295*sin((sine+0.5)*2),0.6108652381980153+0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,1+0.25*sin(sine*2),0)*angles(3.490658503988659,2.0943951023931953,-0.3490658503988659+0.08726646259971647*sin((sine-0.25)*-2)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.125+0.175*sin((sine+0.5)*2),0)*angles(-0.17453292519943295,-2.443460952792061,-2.6179938779914944),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295+0.08726646259971647*sin(sine*2),-0.08726646259971647+0.06981317007977318*sin(sine*2),-2.356194490192345+0.08726646259971647*sin((sine+0.5)*60)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+0.5*sin(sine*2),0)*angles(-1.8762289458939043+0.05235987755982989*sin((sine+0.5)*-2),-0.08726646259971647+0.12217304763960307*sin(sine*100),2.2689280275926285+0.13962634015954636*sin((sine+0.2)*70)),deltaTime) 
	end
		--START OF BOSS MODES
		if Mag < 0.35 and MOG == 15 then
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5)*angles(-0.6981317007977318+0.04363323129985824*sin((sine+0.75)*-2),-1.0471975511965976+0.1308996938995747*sin(sine*-2),-0.6981317007977318+0.17453292519943295*sin(sine*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7889624832941877+0.08726646259971647*sin((sine+0.75)*2),-0.17453292519943295+0.1308996938995747*sin((sine+0.75)*2),-2.2689280275926285),deltaTime)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,4+0.5*sin(sine*2),0)*angles(-1.6580627893946132+0.08726646259971647*sin((sine+0.75)*-2),0,2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.1*sin(sine*2),0)*angles(-1.5707963267948966,1.2217304763960306+0.17453292519943295*sin((sine+0.75)*2),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.1*sin(sine*2),0)*angles(-1.5707963267948966+0.17453292519943295*sin((sine+0.75)*2),-1.2217304763960306+0.17453292519943295*sin((sine+0.75)*-2),-1.5707963267948966+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-1.0471975511965976,1.090830782496456+0.17453292519943295*sin(sine*-2),0.8726646259971648),deltaTime) 
		end
		if Mag < 0.35 and MOG == 16 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.85,0.25+0.1*sin((sine + 0.1)*-3),0)*angles(0,-0.3490658503988659,0.8726646259971648+0.08726646259971647*sin((sine+0.6)*3)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1325+0.2*sin(sine*-3),-0.05)*angles(-1.4835298641951802+0.08726646259971647*sin((sine+0.55)*3),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.85,0.25+0.1*sin((sine + 0.1)*-3),0)*angles(0,0.3490658503988659,-0.8726646259971648+0.08726646259971647*sin((sine+0.6)*-3)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.875+0.19*sin(sine*3),0.075+0.0825*sin((sine + 0.725)*3))*angles(-0.6981317007977318+0.0916297857297023*sin((sine+0.55)*-3),-1.3089969389957472,-0.6108652381980153),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7889624832941877+0.08726646259971647*sin((sine-0.1)*3),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.875+0.2*sin(sine*3),0.075+0.0825*sin((sine + 0.725)*3))*angles(-0.6981317007977318+0.08726646259971647*sin((sine+0.55)*-3),1.3089969389957472,0.6108652381980153),deltaTime) 
		end
		if Mag < 0.35 and MOG == 17 then
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.75 * sin((sine+1)*2),4+1*sin(sine*2),0)*angles(-1.2217304763960306,0.2181661564992912+0.1308996938995747*sin((sine+0.75)*2),3.6651914291880923-0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.075-0.25*sin((sine + 1)*2),0.4+0.1*sin(sine*2))*angles(-1.8325957145940461,1.0471975511965976+0.2617993877991494*sin((sine+0.5)*2),1.3089969389957472),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.1*sin((sine + 0.75)*2),-0.8+0.2*sin((sine + 0.25)*2),-0.5)*angles(-1.3089969389957472,-1.3089969389957472-0.2181661564992912*sin((sine+0.75)*2),-1.3089969389957472-0.2617993877991494*sin(sine*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461+0.05235987755982989*sin(sine*2),0,2.5743606466916362),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.2*sin((sine + 0.75)*2),0.3 * sin((sine+0.25)*2),-1-0.2*sin((sine + 0.75)*2))*angles(-1.8325957145940461,1.2217304763960306-0.1308996938995747*sin((sine+1)*2),1.5707963267948966+0.3490658503988659*sin(sine*2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.1+0.1*sin(sine*2),1+0.2*sin((sine + 0.5)*2),-0.4)*angles(0.7853981633974483,-1.1519173063162575+0.2181661564992912*sin((sine+1.5)*2),-1.9198621771937625),deltaTime) 
		end
		--END OF BOSS MODES
		if Mag < 0.35 and MOG == 18 then
			RootJoint.C0=Lerp(RootJoint.C0,cf(1.5 * sin(sine*1.5),2.5+0.75*sin(sine*3),0)*angles(-2.0943951023931953+0.10471975511965978*sin(sine*3),0.17453292519943295-0.17453292519943295*sin((sine+0.5)*1.5),3.6651914291880923),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3+0.1*sin(sine*3),-0.7)*angles(1.3089969389957472,2.792526803190927,1.8325957145940461-0.17453292519943295*sin((sine+1.25)*1.5)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.1344640137963142,-0.17453292519943295+0.17453292519943295*sin((sine+1.25)*1.5),2.6179938779914944),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.15*sin(sine*1.5),0.4 * sin(sine*3),-0.9)*angles(-0.9599310885968813+0.2617993877991494*sin(sine*1.5),1.3962634015954636-0.2617993877991494*sin((sine-0.75)*1.5),0.8726646259971648),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.15*sin(sine*1.5),-1+0.2*sin(sine*3),0)*angles(-1.2217304763960306,-1.3962634015954636-0.2617993877991494*sin((sine-0.75)*1.5),-1.1344640137963142),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.15 * sin((sine+0.75)*3),0)*angles(0,-0.5235987755982988,0.9162978572970231-0.1308996938995747*sin(sine*3)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 19 then
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.5 * sin(sine*1),3+0.5*sin((sine-0.1)*3),0.325 * sin(sine*1.5))*angles(-2.0943951023931953+0.08726646259971647*sin((sine+0.6)*-3),0.04363323129985824*sin(sine*1),3.141592653589793+0.09599310885968812*sin((sine+0.1)*1)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.975,0.4+0.125*sin((sine+0.5)*-3),-0.325+0.075*sin((sine+0.25)*3))*angles(0.04363323129985824+0.1308996938995747*sin((sine+0.5)*-3),-1.2217304763960306+0.1308996938995747*sin(sine*1),-0.5235987755982988+0.04363323129985824*sin((sine+0.75)*1)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4835298641951802+0.08726646259971647*sin((sine+0.125)*-3),0.05672320068981571*sin((sine-0.5)*-1),3.141592653589793+0.08726646259971647*sin(sine*-1)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.1+0.2*sin(sine*3),-0.25)*angles(-0.2617993877991494+0.1308996938995747*sin((sine+0.325)*-3),1.265363707695889+0.1308996938995747*sin(sine*1),0.6981317007977318),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1*sin(sine*-3),-0.075+0.125*sin((sine+0.75)*1.5))*angles(-0.6981317007977318+0.19198621771937624*sin((sine+0.4)*-3),-1.2217304763960306+0.17453292519943295*sin(sine*1),-0.5235987755982988),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.975,0.4+0.125*sin((sine+0.5)*-3),-0.325+0.075*sin((sine+0.25)*3))*angles(0.04363323129985824+0.1308996938995747*sin((sine+0.5)*-3),1.2217304763960306+0.1308996938995747*sin(sine*-1),0.5235987755982988+0.04363323129985824*sin((sine+0.75)*1)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 20 then
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6929693744344996+0.08726646259971647*sin((sine+0.25)*2),0.05235987755982989*sin((sine+0.75)*2),2.443460952792061+0.05235987755982989*sin((sine+0.75)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.35,0.4+0.15*sin((sine + 1)*2),-0.5)*angles(0,0.2617993877991494+0.08726646259971647*sin(sine*2),1.7453292519943295+0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0.2 * sin((sine+0.5)*2),-0.6+0.05*sin(sine*2))*angles(-0.5235987755982988,1.3089969389957472,0.2617993877991494+0.17453292519943295*sin(sine*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.8+0.1*sin((sine + 0.5)*2),-0.3-0.075*sin(sine*2))*angles(-0.9424777960769379,-1.3089969389957472,-0.3490658503988659-0.17453292519943295*sin(sine*2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.6,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.25)*2),-1.0471975511965976-0.05235987755982989*sin(sine*2),1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.75 * sin(sine*1),4+0.75*sin((sine + 0.75)*2),0)*angles(-1.5707963267948966+0.1308996938995747*sin(sine*2),0.05235987755982989*sin((sine+0.4)*2),4.101523742186674+0.08726646259971647*sin(sine*1.5)),deltaTime)
		end
		if Mag < 0.35 and MOG == 21 then
		--:3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 
			RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.5,0),angles(1.7453292519943295-0.1308996938995747*sin((sine+0.75)*2),2.007128639793479-0.17453292519943295*sin(sine*2),1.5707963267948966)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.1344640137963142-0.1308996938995747*sin((sine+0.75)*2),0.3490658503988659+0.17453292519943295*sin(sine*2),3.9269908169872414)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1.2,1+0.3*sin(sine*2),0),angles(1.3089969389957472,-1.1344640137963142+0.3490658503988659*sin((sine+1)*2),-1.3089969389957472)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.5 * sin(sine*2),-0.7),angles(-1.1344640137963142,1.2217304763960306-0.1308996938995747*sin((sine+0.75)*2),1.0471975511965976-0.3490658503988659*sin(sine*2))),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1-0.25*sin(sine*2),-0.3),angles(-1.1344640137963142,-1.2217304763960306-0.1308996938995747*sin((sine+1)*2),-0.7853981633974483+0.4363323129985824*sin(sine*2))),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(1 * sin(sine*1),3+1*sin((sine+0.6)*2),2 * sin((sine+0.2)*2)),angles(-2.530727415391778+0.17453292519943295*sin(sine*2),0,2.181661564992912)),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,100,-7.5,0.75,2,0.5,0,0,1,115,-10,0,2,0,0,0,1,90,0,0,1,Head,0,0,0,1,-65,-7.5,0.75,2,1,0,0,1,20,10,0,2,0,0,0,1,225,0,0,1,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,LeftArm,-1.2,0,0,1,75,0,0,1,1,0.3,0,2,-65,20,1,2,0,0,0,1,-75,0,0,1,RightLeg,1,0,0,1,-65,0,0,1,-0,-0.5,0,2,70,-7.5,0.75,2,-0.7,0,0,1,60,-20,0,2,LeftLeg,-1,0,0,1,-65,0,0,1,-1,-0.25,0,2,-70,-7.5,1,2,-0.3,0,0,1,-45,25,0,2,Torso,0,1,0,1,-145,10,0,2,3,1,0.6,2,0,0,0,1,0,2,0.2,2,125,0,0,1
		end
		if Mag < 0.35 and MOG == 22 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.09*sin((sine+1.9)*2),-0.8+0.15*sin((sine+0.45)*-2),-0.25+0.14*sin((sine+0.225)*2))*angles(-1.3962634015954636+0.08726646259971647*sin(sine*-2),-0.9599310885968813+0.017453292519943295*sin(sine*-2),-0.6981317007977318+0.004363323129985824*sin(sine*2)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.3+0.1*sin(sine*2),0)*angles(-0.6981317007977318+0.08726646259971647*sin(sine*2),-1.2217304763960306+0.08726646259971647*sin((sine+0.75)*2),-0.6981317007977318+0.08726646259971647*sin(sine*2)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.05 * sin(sine*2),-0.25+0.175*sin((sine+0.5)*2),0.1 * sin((sine+0.25)*-2))*angles(-1.3526301702956054+0.06981317007977318*sin(sine*2),-0.04363323129985824+0.05235987755982989*sin((sine-0.25)*2),3.490658503988659),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3+0.1*sin(sine*2),0)*angles(-0.5235987755982988+0.08726646259971647*sin(sine*-2),1.2217304763960306+0.08726646259971647*sin((sine+0.325)*-2),0.5235987755982988+0.08726646259971647*sin(sine*2)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.085*sin((sine+0.25)*-2),-0.9+0.17*sin((sine+0.6)*-2),-0.325+0.15*sin((sine+0.2)*2))*angles(-0.6108652381980153+0.10471975511965978*sin(sine*-2),1.090830782496456+0.04363323129985824*sin((sine-0.5)*-2),0.3490658503988659+0.026179938779914945*sin(sine*2)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.8762289458939043+0.08726646259971647*sin((sine+0.5)*-2),0.04363323129985824+0.061086523819801536*sin(sine*-2),2.792526803190927),deltaTime) 
		end
		if Mag < 0.35 and MOG == 23 then
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7016960206944713+0.08726646259971647*sin((sine+0.5)*3),0.08726646259971647*sin(sine*-3),2.6179938779914944),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0,0)*angles(1.5707963267948966,0.8726646259971648+0.17453292519943295*sin((sine+0.5)*3),0.8726646259971648),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.15 * sin(sine*-3),-0.07)*angles(-0.5235987755982988,-0.9773843811168246+0.08726646259971647*sin(sine*3),-2.443460952792061+0.1308996938995747*sin((sine-0.25)*-3)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.15 * sin((sine+0.25)*3),-0.125+0.15*sin((sine-0.125)*3),0.1325 * sin((sine-0.075)*3))*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.75)*-3),0.08726646259971647*sin((sine+0.25)*3),3.6651914291880923+0.04363323129985824*sin((sine-0.25)*-3)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.0625*sin((sine+0.6)*-3),-0.875+0.15*sin((sine-0.3)*-3),0.1+0.1*sin(sine*-3))*angles(-0.5235987755982988+0.15707963267948966*sin((sine+1)*3),0.9773843811168246+0.13962634015954636*sin((sine+0.625)*-3),0.4188790204786391+0.10471975511965978*sin((sine+0.1)*3)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-0.75,0,-0.5)*angles(-0.8726646259971648+0.2617993877991494*sin((sine+0.75)*3),-1.0210176124166828+0.08726646259971647*sin((sine-0.325)*-3),-0.6981317007977318+0.08726646259971647*sin((sine+0.325)*-3)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 24 then
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.007128639793479-0.08726646259971647*sin((sine+1.5)*2),0.05235987755982989*sin(sine*1000),3.490658503988659+0.06981317007977318*sin(sine*1)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.3*sin((sine+1.5)*2),0)*angles(-0.7853981633974483+0.17453292519943295*sin(sine*1000),1.1519173063162575-0.17453292519943295*sin((sine+2.25)*2),1.0471975511965976),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.8,0)*angles(0.7853981633974483-0.08726646259971647*sin((sine+1.5)*2),-2.007128639793479-0.05235987755982989*sin(sine*1000),-1.5707963267948966),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1.2,0.2 * sin((sine+1)*2),-0.5)*angles(0.17453292519943295*sin(sine*2),-1.0471975511965976+0.17453292519943295*sin(sine*1000),0),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(1 * sin(sine*1),4+1*sin((sine+0.75)*2),0.7 * sin(sine*2))*angles(-1.8325957145940461+0.08726646259971647*sin(sine*2),0.08726646259971647*sin(sine*1000),2.530727415391778+0.1308996938995747*sin(sine*1)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.8+0.15*sin((sine+1)*2),-0.2)*angles(-1.1344640137963142+0.17453292519943295*sin(sine*2),1.1344640137963142+0.08726646259971647*sin(sine*1000),0.7853981633974483),deltaTime) 
		end
		if Mag < 0.35 and MOG == 26 then
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.2-0.1*sin((sine+2)*2.5),0)*angles(1.1344640137963142+0.10471975511965978*sin(sine*2.5),-1.2217304763960306-0.10471975511965978*sin(sine*2.5),-0.9599310885968813),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.9198621771937625-0.05235987755982989*sin((sine+1)*2.5),0.06981317007977318*sin(sine*1000),2.705260340591211),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,-0.2-0.09*sin((sine+2)*2.5),0)*angles(1.1344640137963142+0.10471975511965978*sin(sine*2.5),0.8726646259971648+0.10471975511965978*sin(sine*2.5),1.3089969389957472),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.9+0.075*sin(sine*2.5),0.1 * sin((sine+0.625)*2.5))*angles(-1.3089969389957472+0.05235987755982989*sin((sine+0.625)*2.5),0,3.6651914291880923),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.01*sin((sine+0.625)*2.5),-1.2-0.075*sin((sine+0.3)*2.5),-0.9-0.025*sin((sine+0.625)*2.5))*angles(-2.181661564992912,-1.1344640137963142+0.017453292519943295*sin((sine+0.625)*2.5),-0.7853981633974483+0.05235987755982989*sin((sine+0.625)*2.5)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.04*sin((sine+0.625)*2.5),-0.7-0.1*sin((sine+0.3)*2.5),-0.9-0.07*sin((sine+0.625)*2.5))*angles(-0.7853981633974483,1.1344640137963142+0.017453292519943295*sin((sine+0.625)*2.5),0.6108652381980153-0.05235987755982989*sin((sine+0.625)*2.5)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 27 then
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.2+0.3*sin(sine*3),0)*angles(-0.2617993877991494,-0.4363323129985824,-1.8325957145940461+0.2617993877991494*sin((sine+0.3)*3)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2 * sin(sine*3),0)*angles(0.7853981633974483,2.0943951023931953,1.117010721276371-0.17453292519943295*sin((sine+0.3)*3)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.15*sin(sine*3),-0.5-0.15*sin(sine*3))*angles(-1.3089969389957472+0.2617993877991494*sin((sine+0.25)*3),-0.9599310885968813+0.17453292519943295*sin((sine+0.6)*3),-0.6108652381980153),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.007128639793479-0.06981317007977318*sin(sine*3),0.17453292519943295-0.08726646259971647*sin((sine+0.6)*3),3.839724354387525),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.2+0.3*sin((sine+1.25)*3),-0.9)*angles(-1.1344640137963142+0.3490658503988659*sin(sine*3),1.265363707695889+0.17453292519943295*sin((sine+0.6)*3),0.7853981633974483),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(1 * sin(sine*1.5),3+0.7*sin(sine*3),0)*angles(-1.5707963267948966+0.06981317007977318*sin(sine*3),-0.6108652381980153+0.17453292519943295*sin((sine+0.6)*3),2.181661564992912),deltaTime) 
		end
		if Mag < 0.35 and MOG == 28 then
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.4 * sin(sine*2),-0.7)*angles(-1.1344640137963142,1.2217304763960306+0.08726646259971647*sin(sine*2),1.1344640137963142-0.3490658503988659*sin((sine+0.7)*2)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.007128639793479-0.17453292519943295*sin((sine+1)*2),0.17453292519943295-0.17453292519943295*sin(sine*2),3.6651914291880923),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(-1.75 * sin((sine+0.625)*2),3.5+1.75*sin(sine*2),0)*angles(-1.5707963267948966+0.17453292519943295*sin((sine+0.6)*2),-0.5235987755982988+0.2617993877991494*sin(sine*2),2.356194490192345),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-0.8+0.2*sin(sine*2),-0.4)*angles(-1.1344640137963142,-1.2217304763960306+0.17453292519943295*sin(sine*2),-0.8726646259971648+0.3490658503988659*sin((sine+1)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,-0.2 * sin((sine+0.75)*2),0.5-0.2*sin(sine*2))*angles(-2.0943951023931953,0.7853981633974483+0.3490658503988659*sin(sine*2),1.5707963267948966-0.3490658503988659*sin((sine+1)*2)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5+0.4*sin(sine*2),0)*angles(0.7853981633974483,-0.9599310885968813+0.17453292519943295*sin((sine+1)*2),-1.1344640137963142+0.3490658503988659*sin((sine+0.5)*2)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 29 then
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3089969389957472+0.13962634015954636*sin(sine*3),0.3141592653589793+0.10471975511965978*sin((sine+0.6)*3),-2.443460952792061),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1.05,-0.25,-0.25+0.125*sin(sine*-3))*angles(1.5707963267948966,1.9198621771937625+0.17453292519943295*sin((sine+0.5)*3),0.6108652381980153+0.2617993877991494*sin(sine*3)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.6 * sin((sine+0.6)*3),4+0.75*sin((sine-0.8)*3),0.5 * sin((sine+0.25)*3))*angles(-2.443460952792061+0.12217304763960307*sin((sine+0.6)*-3),0.10471975511965978*sin((sine+0.125)*3),2.2689280275926285+0.08726646259971647*sin((sine-0.125)*3)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-0.8+0.1*sin((sine+0.25)*3),0.15 * sin((sine+0.25)*3),-0.25+0.1*sin((sine+1.6)*3))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.5)*-3),-0.6981317007977318+0.17453292519943295*sin((sine-0.25)*-3),-0.7853981633974483+0.2617993877991494*sin((sine+1.4)*3)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1.1,0.6+0.125*sin((sine-0.4)*-3),-0.125)*angles(-1.5707963267948966,-2.181661564992912+0.2617993877991494*sin((sine+0.8)*3),2.0943951023931953+0.17453292519943295*sin((sine-0.7)*3)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(0.9,-0.98+0.125*sin((sine+0.25)*3),0.05)*angles(-0.5235987755982988+0.13962634015954636*sin((sine+1.25)*3),0.8726646259971648+0.08726646259971647*sin((sine+0.5)*3),0.33161255787892263+0.2617993877991494*sin((sine+1)*-3)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 30 then
			RightHip.C0=Lerp(RightHip.C0,cf(1.025+0.015*sin(sine*2),-0.875+0.1325*sin((sine+0.7)*-2),-0.05+0.0325*sin((sine-0.35)*-2))*angles(-0.4363323129985824+0.017453292519943295*sin(sine*-1),0.9162978572970231+0.03490658503988659*sin(sine*-1),0.5672320068981571+0.04799655442984406*sin((sine-0.2)*-2)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295+0.03490658503988659*sin((sine+0.1)*2),0.05235987755982989+0.04363323129985824*sin(sine*1),2.6179938779914944),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4,0)*angles(-0.3490658503988659,-1.3089969389957472+0.08726646259971647*sin(sine*-1),-0.3490658503988659),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1125*sin((sine+0.8)*-2),0.0125 * sin((sine-0.2)*2))*angles(-0.6981317007977318+0.05235987755982989*sin(sine*-2),-1.265363707695889+0.03490658503988659*sin(sine*-1),-0.6981317007977318+0.03490658503988659*sin(sine*-2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.75+0.05*sin(sine*-1),-0.125+0.05*sin(sine*2),0)*angles(0.17453292519943295+0.08726646259971647*sin((sine+0.125)*-1),2.6179938779914944,2.007128639793479+0.04363323129985824*sin((sine+0.5)*-1)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.125 * sin((sine+0.75)*2),0.05 * sin(sine*2))*angles(-1.8325957145940461+0.03490658503988659*sin(sine*2),0.04363323129985824+0.03490658503988659*sin(sine*1),-2.6179938779914944),deltaTime) 
		end
			if Mag < 0.35 and MOG == 31 then
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cfMul(cf(-1,0.35,0),angles(-0.3490658503988659-0.2617993877991494*sin((sine+0.65)*1.95),-1.3089969389957472+0.17453292519943295*sin(sine*1),-0.7853981633974483)),deltaTime) 
				RightHip.C0=Lerp(RightHip.C0,cfMul(cf(1,-0.15 * sin(sine*1.95),-0.85-0.1*sin((sine+3.5)*1.95)),angles(-0.17453292519943295-0.17453292519943295*sin((sine+2.5)*1.95),1.2217304763960306,-0.3490658503988659)),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cfMul(cf(0,1,0),angles(-1.7453292519943295-0.07853981633974483*sin((sine+2)*1),-0.04363323129985824*sin((sine+2)*1.95),3.141592653589793)),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cfMul(cf(1,0.45+0.1*sin(sine*1.95),0),angles(0.3490658503988659,2.6179938779914944,1.509709802975095+0.061086523819801536*sin((sine+2.5)*1.95))),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,cfMul(cf(1.25 * sin((sine+28)*1.95),7.5+0.85*sin(sine*1.95),-0.65 * sin(sine*2)),angles(-1.3962634015954636+0.07853981633974483*sin(sine*1),0.04363323129985824*sin(sine*1.95),3.141592653589793+0.04363323129985824*sin(sine*1.95))),deltaTime) 
				LeftHip.C0=Lerp(LeftHip.C0,cfMul(cf(-1,-1+0.1*sin((sine+6)*1.95),0),angles(-0.3490658503988659-0.11344640137963143*sin((sine+2)*1.95),-1.0471975511965976+0.026179938779914945*sin(sine*2),0)),deltaTime) 
				--MW_animatorProgressSave: KemonoDragonNeckFluffGrey_Handle,0,0,0,1,0,0,0,1,0.20481538772583008,0,0,1,0,0,0,1,0.07867646217346191,0,0,1,0,0,0,1,Meshes/Floof_Cube.031Accessory_Handle,0.000047972393076634035,0,0,1,0,0,0,1,0.12758469581604004,0,0,1,0,0,0,1,-1.64121413230896,0,0,1,0,0,0,1,LargeWhiteNeckFloof_Handle,-1.2011720507132395e-08,0,0,1,180,0,0,1,0.1929934024810791,0,0,1,0,0,0,1,-0.0157637782394886,0,0,1,-180,0,0,1,Accessory(Meshes/HeadMask(1)Accessory)_Handle,-0.0002269744873046875,0,0,1,0,0,0,1,-0.000034809112548828125,0,0,1,0,0,0,1,-0.00022327899932861328,0,0,1,0,0,0,1,catglowblack_Handle,0.000457763671875,0,0,1,0,0,0,1,0.06199979782104492,0,0,1,0,0,0,1,-0.078000009059906,0,0,1,0,0,0,1,LeftFluff_Handle,0.05000019073486328,0,0,1,0,0,0,1,-0.08800792694091797,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,WhiteNeckFluff_Handle,2.3180488994967163e-07,0,0,1,180,0,0,1,0.25233960151672363,0,0,1,0,0,0,1,-0.02751021459698677,0,0,1,-180,0,0,1,CheekTufts_Handle,5.245366452300004e-08,0,0,1,180,0,0,1,0.23581409454345703,0,0,1,0,0,0,1,0.3181855082511902,0,0,1,180,0,0,1,RightFluff_Handle,-0.05000019073486328,0,0,1,0,0,0,1,-0.08800792694091797,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,OversizedFluffyFurryAnimalEars_Handle,8.658513905857035e-09,0,0,1,0,0,0,1,-0.12489557266235352,0,0,1,0,0,0,1,-0.32570043206214905,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,-20,-15,0.65,1.95,0.35,0,0,1,-75,10,0,1,0,0,0,1,-45,0,0,1,RightLeg,1,0,0,1,-10,-10,2.5,1.95,0,-0.15,0,1.95,70,0,0,1,-0.85,-0.1,3.5,1.95,-20,0,0,1,Head,0,0,0,1,-100,-4.5,2,1,1,0,0,1,0,-2.5,2,1.95,0,0,0,1,180,0,0,1,RightArm,1,0,0,1,20,0,0,1,0.45,0.1,0,1.95,150,0,0,1,0,0,0,1,86.5,3.5,2.5,1.95,Torso,0,1.25,28,1.95,-80,4.5,0,1,7.5,0.85,0,1.95,0,2.5,0,1.95,0,-0.65,0,2,180,2.5,0,1.95,LeftLeg,-1,0,0,1,-20,-6.5,2,1.95,-1,0.1,6,1.95,-60,1.5,0,2,0,0,0,1,0,0,0,1
			end
		if Mag < 0.35 and MOG == 1001 then
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132,0.05235987755982989+0.08726646259971647*sin((sine+0.25)*2.5),2.356194490192345),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.4 * sin((sine+0.5)*2.5),0)*angles(-0.2617993877991494,0.7853981633974483,1.9198621771937625-0.3490658503988659*sin(sine*2.5)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1-0.05*sin(sine*2.5),-1+0.1*sin((sine + 1.75)*2.5),0)*angles(-0.4363323129985824+0.1308996938995747*sin((sine+0.75)*2.5),-1.3089969389957472,-0.4363323129985824),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0,0)*angles(-1.5707963267948966,-1.3089969389957472+0.17453292519943295*sin(sine*2.5),-2.0943951023931953),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin((sine + 0.75)*2),0.2 * sin((sine+1.5)*2.5),-1+0.2*sin(sine*2.5))*angles(-0.7853981633974483+0.17453292519943295*sin((sine+0.5)*2.5),1.3089969389957472,0.6108652381980153),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(0.75 * sin((sine+2)*2.5),4+0.75*sin(sine*2.5),0)*angles(-1.5707963267948966-0.05235987755982989*sin((sine+0.5)*2.5),0.1308996938995747*sin((sine+0.75)*2.5),3.141592653589793),deltaTime) 
	end
	if Mag < 0.35 and MOG == math.huge then
		RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
		Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
		LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
		RootJoint.C0=Lerp(RootJoint.C0,cf(0,5,0)*angles(-1.5707963267948966+6.283185307179586*sin((sine+2)*1),6.283185307179586*sin(sine*1),3.141592653589793),deltaTime) 
		RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime)
	end
	
  end
	
	
		
	
	--[[
	
	if Mag > 0.15 and Attack == false and MoveType == "Walk" then
		if Direction == "R" then
			LeftHip.C1 = LC1  * angles(10, -90, 0)
			RightHip.C1 = RC1 * angles(10, -90, 0)
		elseif Direction == "L" then
			LeftHip.C1 = LC1 * angles(-10, -90, 0)
			RightHip.C1 = RC1 * angles(-10, -90, 0)
		end
    elseif Mag < 0.15 or Attack == true then
		LeftHip.C1 = LC1
		RightHip.C1 = RC1
	end
	
	]]
	
	end
  
  
	if Side == 2 and Attack == false  and VS < 1.5 and VS > -1.5 then
		if Mag < 0.35 and MOG == 1 then
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5)*angles(-0.6981317007977318+0.04363323129985824*sin((sine+0.75)*-2),-1.0471975511965976+0.1308996938995747*sin(sine*-2),-0.6981317007977318+0.17453292519943295*sin(sine*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7889624832941877+0.08726646259971647*sin((sine+0.75)*2),-0.17453292519943295+0.1308996938995747*sin((sine+0.75)*2),-2.2689280275926285),deltaTime)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,4+0.5*sin(sine*2),0)*angles(-1.6580627893946132+0.08726646259971647*sin((sine+0.75)*-2),0,2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.1*sin(sine*2),0)*angles(-1.5707963267948966,1.2217304763960306+0.17453292519943295*sin((sine+0.75)*2),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.1*sin(sine*2),0)*angles(-1.5707963267948966+0.17453292519943295*sin((sine+0.75)*2),-1.2217304763960306+0.17453292519943295*sin((sine+0.75)*-2),-1.5707963267948966+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-1.0471975511965976,1.090830782496456+0.17453292519943295*sin(sine*-2),0.8726646259971648),deltaTime) 
		end
		if Mag < 0.35 and MOG == 2 then
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.254 * sin((sine+8)*1.215),-0.75-0.15*sin((sine+4)*1.215))*angles(-0.3490658503988659+0.2617993877991494*sin(sine*1.215),1.0471975511965976,0.3490658503988659),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5-0.254*sin((sine+8.5)*1.215),0)*angles(-0.2617993877991494,-3.141592653589793,-1.5707963267948966),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.15-0.254*sin((sine+8)*1.215),-0.45)*angles(0.3490658503988659,2.9670597283903604,1.3962634015954636+0.17453292519943295*sin((sine+6)*1.215)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(-1.0471975511965976-0.14835298641951802*sin((sine+2.5)*1.215),-1.0471975511965976+0.17453292519943295*sin((sine+2.5)*1.215),-0.3490658503988659),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.007128639793479-0.09861110273767963*sin((sine+2.5)*1.215),0.1308996938995747*sin((sine+8)*1.215),3.141592653589793),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.15 + 0.95 * sin((sine+14)*1.215),4.75+0.95*sin(sine*1.215),0.15 * sin((sine-14)*1.215))*angles(-1.2217304763960306+0.09861110273767963*sin((sine+2.5)*1.215),0,3.141592653589793),deltaTime) 
		end
		if Mag < 0.35 and MOG == 3 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1-0.025*sin(sine*1),-1-0.075*sin(sine*2),0.025 * sin(sine*2))*angles(-1.1344640137963142+0.03490658503988659*sin((sine+1)*2),-1.3526301702956054-0.017453292519943295*sin(sine*1),-1.0035643198967394-0.017453292519943295*sin((sine+1)*2)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.05 * sin(sine*1),0.075 * sin(sine*2),0)*angles(-1.4398966328953218-0.03490658503988659*sin((sine+1)*2),0.017453292519943295*sin(sine*1),2.8797932657906435),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.85,-0.15 * sin((sine+0.5)*2),0)*angles(0,-3.0543261909900767,-1.7453292519943295+0.08726646259971647*sin(sine*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.85,0.5-0.15*sin((sine+0.5)*2),-0.1)*angles(0.17453292519943295,2.8797932657906435,1.6580627893946132-0.08726646259971647*sin(sine*2)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877-0.05235987755982989*sin((sine+0.75)*2),0,3.7524578917878086+0.05235987755982989*sin(sine*2)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1-0.025*sin(sine*1),-1-0.075*sin(sine*2),0.025 * sin(sine*2))*angles(-1.1344640137963142+0.03490658503988659*sin((sine+1)*2),1.3526301702956054-0.017453292519943295*sin(sine*1),1.0035643198967394+0.017453292519943295*sin((sine+1)*2)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 4 then
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.3+0.5*sin(sine*1.5),-0.4)*angles(-1.1344640137963142,1.3089969389957472,0.8726646259971648-0.17453292519943295*sin(sine*1.5)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-0.8+0.2*sin(sine*1.5),-0.2)*angles(-1.1344640137963142,-1.3089969389957472,-0.8726646259971648+0.3490658503988659*sin((sine+0.75)*1.5)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.1 * sin(sine*0.75),2.5+1*sin(sine*1.5),0.5 * sin((sine+1)*1.5))*angles(-1.1344640137963142-0.17453292519943295*sin((sine+0.625)*1.5),0,3.5779249665883754),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.1-0.3*sin((sine+1.5)*1.5),-0.15)*angles(0,3.0543261909900767,1.7453292519943295-0.17453292519943295*sin(sine*1.5)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.2-0.3*sin((sine+1.5)*1.5),-0.2)*angles(0,-3.2288591161895095,-1.5707963267948966+0.17453292519943295*sin(sine*1.5)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.181661564992912+0.17453292519943295*sin((sine+0.6251)*1.5),-0.08726646259971647*sin((sine+0.625)*1.5),2.6179938779914944),deltaTime) 
		end
		if Mag < 0.35 and MOG == 5 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.15*sin(sine*2),0)*angles(-0.9599310885968813,-1.3089969389957472,-0.7853981633974483-0.2181661564992912*sin(sine*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.1+0.4*sin((sine-0.75)*2),0)*angles(1.3089969389957472-0.17453292519943295*sin(sine*2),1.1344640137963142-0.2617993877991494*sin(sine*2),1.1344640137963142),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.3 * sin((sine+0.6)*2),-0.7)*angles(-0.9599310885968813,1.3089969389957472,0.8726646259971648+0.2617993877991494*sin(sine*2)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.8325957145940461+0.17453292519943295*sin((sine+0.7)*2),0,3.141592653589793),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.1+0.4*sin((sine-0.75)*2),0)*angles(1.3089969389957472,-1.1344640137963142+0.2617993877991494*sin(sine*2),-1.1344640137963142),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+1*sin(sine*2),0)*angles(-1.3089969389957472-0.17453292519943295*sin((sine+0.625)*2),0,3.141592653589793),deltaTime) 
		end
	end 
	
	if Side == 3 and Attack == false  and VS < 1.5 and VS > -1.5 then
		if Mag < 0.35 and MOG == 1 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.5+0.15*sin((sine+0.5)*-2.5),0.1 * sin((sine-0.15)*2.5))*angles(0.08726646259971647*sin(sine*-2.5),-1.5707963267948966,0.5235987755982988),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.14*sin((sine+0.4)*-2.5),-0.5+0.1*sin((sine-0.275)*2.5))*angles(0.08726646259971647*sin((sine+0.07)*-2.5),1.5707963267948966,0.5672320068981571),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.15 * sin((sine+0.5)*2.5),0)*angles(-1.9198621771937625+0.08726646259971647*sin(sine*2.5),0,3.141592653589793),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295+0.08726646259971647*sin((sine+0.5)*-2),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.7,0.5,0)*angles(0,2.6179938779914944,2.1467549799530254+0.08726646259971647*sin((sine+0.1)*-2)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1.4,0.5,-0.5)*angles(0,0,-1.4835298641951802+0.08726646259971647*sin((sine+0.1)*2)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 2 then
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.5+0.1*sin((sine-0.3)*5),0.05 * sin(sine*-5))*angles(-2.0943951023931953+0.03490658503988659*sin((sine+0.2)*-5),-0.1308996938995747,-2.443460952792061+0.017453292519943295*sin((sine+0.2)*5)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.125 * sin((sine+0.75)*5),0)*angles(-0.17453292519943295,0.8726646259971648,2.443460952792061+0.17453292519943295*sin((sine+0.5)*5)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.0125*sin(sine*-5),-1+0.1*sin((sine-0.2)*-5),0)*angles(-0.5235987755982988+0.03490658503988659*sin((sine+0.1)*5),-1.0471975511965976+0.03490658503988659*sin((sine+0.2)*-5),-0.5235987755982988+0.017453292519943295*sin((sine+0.1)*5)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636+0.08726646259971647*sin((sine+0.5)*5),0.04363323129985824*sin((sine+0.5)*-5),2.443460952792061),deltaTime)
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.125,0)*angles(-0.17453292519943295,-2.792526803190927,-2.0943951023931953+0.08726646259971647*sin((sine-0.1)*5)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(0.9+0.03*sin((sine+0.05)*-5),-0.35+0.15*sin((sine+0.35)*5),-0.175+0.035*sin((sine+0.2)*5))*angles(0,0.8726646259971648+0.03490658503988659*sin((sine+0.2)*-5),0.8726646259971648+0.026179938779914945*sin((sine+0.6)*-5)),deltaTime)
		end
		if Mag < 0.35 and MOG == 3 then
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4+0.125*sin((sine+1.25)*2.5),0)*angles(-0.8726646259971648+0.17453292519943295*sin((sine+0.5)*-2.5),-1.0471975511965976,-0.3490658503988659),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.0471975511965976+0.08726646259971647*sin((sine+0.75)*2.5),-0.17453292519943295,2.9670597283903604),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.4+0.125*sin((sine+1.25)*2.5),0)*angles(-0.8726646259971648+0.17453292519943295*sin((sine+0.5)*-2.5),1.0471975511965976,0.3490658503988659),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.0325*sin(sine*-2.5),-0.95+0.15*sin((sine+0.8)*-2.5),0.1+0.1*sin((sine+0.4)*2.5))*angles(-1.2217304763960306+0.08726646259971647*sin(sine*-2.5),-0.8726646259971648+0.017453292519943295*sin(sine*2.5),-0.5235987755982988),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.025*sin((sine+0.05)*-2.5),-1+0.14*sin((sine+0.7)*-2.5),-0.1+0.125*sin((sine+0.35)*2.5))*angles(-1.2217304763960306+0.08726646259971647*sin(sine*-2.5),1.2217304763960306+0.017453292519943295*sin(sine*2.5),0.6981317007977318),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.1325+0.175*sin((sine+0.75)*2.5),-0.2)*angles(-1.0471975511965976+0.08726646259971647*sin(sine*2.5),0.08726646259971647,3.3161255787892263),deltaTime) 
		end
		if Mag < 0.35 and MOG == 4 then
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4,0)*angles(-1.5707963267948966,-0.8726646259971648,1.9198621771937625+0.08726646259971647*sin(sine*2)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.15 * sin((sine+0.5)*2),0.05 * sin((sine+0.75)*-2))*angles(-1.9198621771937625+0.06981317007977318*sin((sine+0.2)*2),0,3.141592653589793),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-0.9+0.18*sin((sine+0.5)*-2),-0.5+0.05*sin((sine+0.4)*2))*angles(-0.3141592653589793+0.06981317007977318*sin((sine+0.2)*-2),-1.3089969389957472,-0.7853981633974483),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.4+0.15*sin((sine+0.5)*-2),-0.125+0.075*sin((sine+0.3)*2))*angles(-0.5235987755982988+0.06981317007977318*sin((sine+0.2)*-2),1.3962634015954636,0),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.35+0.1*sin((sine-1)*-2),0)*angles(-1.5707963267948966,1.3089969389957472+0.1308996938995747*sin((sine+1)*2),1.5707963267948966),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.0943951023931953+0.08726646259971647*sin(sine*-2),0,3.141592653589793),deltaTime) 
		end
		if Mag < 0.35 and MOG == 5 then
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218+0.08726646259971647*sin((sine+0.5)*-3),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.4+0.125*sin((sine+0.5)*3),0)*angles(-1.5707963267948966,1.3089969389957472+0.08726646259971647*sin(sine*-3),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4+0.125*sin((sine+0.5)*3),0)*angles(-1.5707963267948966,-1.3089969389957472+0.08726646259971647*sin(sine*3),-1.5707963267948966),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.125+0.075*sin((sine-0.7)*-3),0)*angles(-1.9198621771937625+0.05235987755982989*sin(sine*3),0,3.141592653589793),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.5+0.0825*sin((sine+0.4)*-3),0.075 * sin((sine-0.05)*3))*angles(-0.4363323129985824+0.05235987755982989*sin(sine*-3),1.5707963267948966,0),deltaTime)
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1*sin((sine+0.3)*-3),-0.6+0.0325*sin((sine-0.1)*3))*angles(0.5235987755982988+0.05235987755982989*sin(sine*-3),-1.5707963267948966,0),deltaTime) 
		end
		if Mag < 0.35 and MOG == 6 then
			RightHip.C0=Lerp(RightHip.C0,cf(0.85,0.125 * sin((sine+0.25)*4),-0.4)*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.5)*-4),1.2217304763960306,0.5235987755982988),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.05*sin(sine*2),-0.95+0.175*sin(sine*-4),0)*angles(-0.5235987755982988,-1.2217304763960306+0.03490658503988659*sin(sine*2),-0.5235987755982988),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7278759594743862+0.03490658503988659*sin(sine*4),0.05235987755982989+0.10471975511965978*sin((sine+0.6)*2),2.530727415391778),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.6,0.125+0.1*sin(sine*2),0)*angles(0.17453292519943295,-2.443460952792061,-2.2689280275926285+0.08726646259971647*sin((sine+0.5)*-2)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.2 * sin(sine*2),0.15 * sin(sine*4),0)*angles(-1.5271630954950384,0.06981317007977318*sin(sine*2),3.141592653589793),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.75,0,0.125)*angles(-0.17453292519943295,2.6179938779914944,1.9198621771937625+0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
		end
		if Mag < 0.35 and MOG == 7 then
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0.25 * sin((sine+0.5)*-3))*angles(0.5235987755982988*sin((sine+0.5)*3),-1.5707963267948966+0.17453292519943295*sin(sine*3),0),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.1+0.125*sin(sine*3),0.15 * sin(sine*3))*angles(-1.9198621771937625+0.12217304763960307*sin((sine+0.35)*-3),0,3.141592653589793),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295+0.17453292519943295*sin(sine*2),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.5,0.25 * sin((sine+0.5)*-3))*angles(0.5235987755982988*sin((sine+0.5)*3),1.5707963267948966+0.17453292519943295*sin(sine*-3),0),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.75+0.095*sin((sine-0.45)*-3),-0.75+0.235*sin((sine+0.125)*-3))*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.35)*3),1.5707963267948966,0),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.3+0.075*sin(sine*-3),0.275 * sin((sine+0.15)*-3))*angles(-0.5235987755982988+0.12217304763960307*sin((sine+0.35)*3),-1.5707963267948966,0),deltaTime) 
		end
	end
	
		if  VS < 1.5 and VS > -1.5 then

			if Mag > 0.15 and Attack == false and MoveType == "BFloat" and Sprint == false  then
				RightHip.C0=RightHip.C0:Lerp(cf(1,0.25 * sin((sine+2)*1),-0.65)*angles(-0.4363323129985824+0.2617993877991494*sin(sine*1),1.3962634015954636,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.75,0.5,0)*angles(-0.4363323129985824+0.4363323129985824*sin((sine+0.15)*1),-0.7853981633974483,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.4363323129985824+0.2617993877991494*sin(sine*1),-1.3962634015954636,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.2617993877991494*sin(sine*1),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-0.4363323129985824+0.4363323129985824*sin(sine*1),-0.7853981633974483,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(2 * sin((sine+2)*1),7+1*sin(sine*1),0)*angles(-2.356194490192345+0.4363323129985824*sin(sine*1),0,3.141592653589793+0.4363323129985824*sin((sine+2)*1)),deltaTime) 
			elseif Mag > 0.15 and Attack == false and MoveType == "BFloat" and Sprint == true  then
				RightHip.C0=RightHip.C0:Lerp(cf(1,0.25 * sin((sine+2)*1),-0.65)*angles(-0.4363323129985824+0.2617993877991494*sin(sine*1),1.3962634015954636,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.75,0.5,0)*angles(-0.4363323129985824+0.4363323129985824*sin((sine+0.15)*1),-0.7853981633974483,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.4363323129985824+0.2617993877991494*sin(sine*1),-1.3962634015954636,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.0471975511965976-0.2617993877991494*sin(sine*1),0,3.141592653589793),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-0.4363323129985824+0.4363323129985824*sin(sine*1),-0.7853981633974483,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(5 * sin((sine+2)*1),7+3*sin(sine*1),0)*angles(-2.792526803190927+0.4363323129985824*sin(sine*1),0,3.141592653589793+0.4363323129985824*sin((sine+2)*1)),deltaTime)
			end
			if Mag > 0.15 and Attack == false and MoveType == "Walk" and Sprint == false  then
				Neck.C0=Neck.C0:Lerp(cf(0.025 * sin((sine+0.575)*-10),1+0.05*sin((sine + 0.15)*-20),0.025 * sin((sine+0.15)*-20))*angles(-1.6580627893946132+0.1308996938995747*sin(sine*20),0.04363323129985824*sin((sine-0.025)*-10),3.141592653589793+0.1308996938995747*sin((sine+0.625)*-10)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.4*sin((sine + 0.275)*-10),-0.15+0.4*sin((sine - 0.1)*-10))*angles(-0.3490658503988659+1.2217304763960306*sin((sine+0.125)*-10),-1.5315264186250241+0.1308996938995747*sin((sine-0.3)*10),-0.3490658503988659),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.4*sin((sine + 0.275)*10),-0.15+0.4*sin((sine - 0.1)*10))*angles(-0.3490658503988659+1.2217304763960306*sin((sine+0.125)*10),1.5315264186250241+0.1308996938995747*sin((sine-0.3)*10),0.3490658503988659),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.975,0.45,0.25 * sin(sine*10))*angles(-1.5707963267948966,-1.4835298641951802+0.08726646259971647*sin(sine*-10),-1.5707963267948966+1.0471975511965976*sin(sine*10)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.975,0.45,0.25 * sin(sine*-10))*angles(-1.5707963267948966,1.4835298641951802,1.5707963267948966+0.8726646259971648*sin(sine*10)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.15 * sin((sine-0.1)*20),0.05 * sin(sine*20))*angles(-1.8325957145940461+0.1308996938995747*sin((sine+0.3)*-20),0.02181661564992912*sin(sine*10),3.141592653589793+0.1308996938995747*sin((sine+0.6)*10)),deltaTime) 
			elseif Mag > 0.15 and Attack == false and MoveType == "Walk" and Sprint == true  then
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.95,0.425+0.05*sin((sine - 0.05)*11),0.6 * sin((sine-0.625)*11))*angles(-1.5707963267948966,1.4835298641951802,1.5707963267948966+1.2217304763960306*sin((sine-0.7)*-11)),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.125 * sin((sine+0.05)*22),0.125 * sin((sine+0.4)*22))*angles(-2.0943951023931953+0.04363323129985824*sin((sine+0.4)*-22),0,3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5271630954950384+0.08726646259971647*sin((sine+0.5)*22),0.04363323129985824*sin((sine+0.1)*11),3.141592653589793+0.08726646259971647*sin(sine*-11)),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.6*sin((sine - 0.1)*-11),-0.25+0.75*sin((sine + 0.1)*-11))*angles(0,1.5707963267948966,0.04363323129985824+1.5271630954950384*sin((sine+0.05)*11)),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.6*sin((sine - 0.1)*11),-0.25+0.75*sin((sine + 0.1)*11))*angles(0,-1.5707963267948966,-0.08726646259971647+1.5271630954950384*sin((sine+0.05)*11)),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.95,0.425+0.05*sin((sine - 0.05)*-11),0.6 * sin((sine-0.625)*-11))*angles(-1.5707963267948966,-1.4835298641951802,-1.5707963267948966+1.2217304763960306*sin((sine-0.7)*-11)),deltaTime) 
			end
		end
  
end)

--Character:FindFirstChild("VFX"):Destroy()

Rot = cf(0,0,0)
local function GetRollAngle()
	local Character = LocalPlayer.Character

	if not Character then
		return
	end

	local Cf = Camera.CFrame

	return -Cf.RightVector:Dot(Character.Humanoid.MoveDirection)
end

RS:BindToRenderStep("RotateCameraInDirectionPlayerIsGoing", Enum.RenderPriority.Camera.Value + 1, function()
	local Roll = GetRollAngle() * 8
	Rot = Rot:Lerp(CFrame.Angles(0, 0, rad(Roll)),0.075)

	Camera.CFrame *= Rot
end)
