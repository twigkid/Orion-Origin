wait(4)

--[[

 _____ ______  _____  _____  _   _       __     __  _____  _____  _      _       ___  ______  _____  _____ 
|  _  || ___ \|_   _||  _  || \ | |     / /    / / /  __ \|  _  || |    | |     / _ \ | ___ \/  ___||  ___|
| | | || |_/ /  | |  | | | ||  \| |    / /    / /  | /  \/| | | || |    | |    / /_\ \| |_/ /\ `--. | |__  
| | | ||    /   | |  | | | || . ` |   / /    / /   | |    | | | || |    | |    |  _  ||  __/  `--. \|  __| 
\ \_/ /| |\ \  _| |_ \ \_/ /| |\  |  / /    / /    | \__/\\ \_/ /| |____| |____| | | || |    /\__/ /| |___ 
 \___/ \_| \_| \___/  \___/ \_| \_/ /_/    /_/      \____/ \___/ \_____/\_____/\_| |_/\_|    \____/ \____/...

  The Origin of Cosmos.

	twigkid: Scripted: Input, UI, Effects, Mode Switch, Animated: BREAKDOWN, MELLIOQUENT, 404-ERROR%$^$%FORBIDDEN
	Chip: Scripted: Multiple Modes, Animated: (Too many to count..)
	Maximilito: Animated: Walk, Run, Side 3, Jump, Multiple modes.

 
	Credits:
	|	Scripting[
	|	.	 twigkid;
	|	.	 Chip;
	|	.	]
	|	.	
	|	Animating[
	|	.	 twigkid;
	|	.	 Chip;
	|	.	 Maximilito;
	|	.	]
	|	.
	|	Mode Ideas[
	|	.	 twigkid;
	|	.	 Chip;
	|	.	 Maximilito;
	|	.	]
	|   .
	|	Effects[
	|		 twigkid;
	|		]
	|
	.
	
	Started on: 11/30/2023
	Ended on: Not done.
	
	
  Status:
	| 16/02/2024:  Maximilto stopped making animations. (We'll miss you, You made great animations. But everything good must come to an end.)
	| 16/02/2024: Side 1 Was offically completed
	
                                      

]]

local Player = game:GetService("Players"):GetPlayerFromCharacter(script.Parent)
local Character = Player.Character

local Valid = {1, 2, 3}
local human = nil

local Side = 1
local control = false
local Song_VER = 0
local EP_Mode = false
local Cloth_Sync = false
local deltaTime = 0.25
local collected = 0
local Target=workspace

local OCM=script.OCM
local MouseEvents = script:WaitForChild("Events")
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

local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local cf_0=CFrame.new(0,0,0)

local Inverse=cf_0.Inverse
local Lerp=cf_0.Lerp
local Type = "Start"

local RunService = game:GetService("RunService")

local Mouse = {}
local AttackId = 0

Mouse.KeyDown = MouseEvents.KeyDown.OnServerEvent
Mouse.KeyUp = MouseEvents.KeyUp.OnServerEvent
Mouse.Hit = MouseEvents.Mouse.OnServerEvent
Mouse.Button1Down = MouseEvents.MouseDown.OnServerEvent
Mouse.Button1Up = MouseEvents.MouseUp.OnServerEvent
Mouse.Target = MouseEvents.Target.OnServerEvent

local Pitch = 1
local Pos = CFrame.new(0,0,0)
local C1, C2 =  Color3.new(0,0,0),Color3.new(0,0,0)
local Effects = script.Effects
local NEffects  = Instance.new("Folder", Character) 
NEffects.Name = "VFX"
local MoveType = "Walk"
local Attack = false
local WS, RS = 0, 0
local Sprint = false
local MOG = 1
local MouseDown = false
local NameBoard = Instance.new("BillboardGui", Head)
NameBoard.Size = UDim2.new(20, 0, 2, 0) NameBoard.LightInfluence = 0 NameBoard.Brightness = 2 NameBoard.ExtentsOffsetWorldSpace = Vector3.new(0, 3.5, 0)
local Name_Label = Instance.new("TextLabel", NameBoard)
Name_Label.Text = "nil"
Name_Label.Size = UDim2.new(1, 0, 1, 0)
Name_Label.BackgroundTransparency = 1
Name_Label.TextStrokeTransparency = 0
Name_Label.TextScaled = true
local coreglow = Instance.new("PointLight",Torso)
coreglow.Range=3
local ctween = Instance.new("Part",game.ReplicatedStorage)
ctween.Name="tw"
ctween.Anchored=true
local rad,cf,angles=math.rad,CFrame.new,CFrame.Angles

local MainTheme = Instance.new("Sound", Torso)
MainTheme.Looped = true
MainTheme.Volume = 1
MainTheme.Playing = true
local Models = script.Models
local Wings = Models.ULTIMATION

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
			RunService.Heartbeat:Wait()
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
local function Darkness(FTime)
	task.spawn(function()
		local darkness = Instance.new("ScreenGui")
		darkness.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		darkness.Parent=Player.PlayerGui
		darkness.DisplayOrder=15
		for i=1,7 do
			local heavy_v = Instance.new("ImageLabel")
			heavy_v.Image = "rbxassetid://4576475446"
			heavy_v.BackgroundTransparency = 1
			heavy_v.Size = UDim2.new(1, 0, 1, 0)
			heavy_v.Parent = darkness
			heavy_v.ImageTransparency=1
		end
		for _, x in pairs(darkness:GetChildren()) do
			if x:IsA("ImageLabel") then
				Tween(x,"Linear","Out",0.25,{ImageTransparency=0})
			end
		end
		task.wait(FTime)
		for _, x in pairs(darkness:GetChildren()) do
			if x:IsA("ImageLabel") then
				Tween(x,"Linear","Out",1.5,{ImageTransparency=1})
			end
		end
	end)
end

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

local function EffectSphere(CF, Speed, Color, Size, EndSize, Parent, Trans, R)
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
			if R == nil then
				p.Brightness = 1 - P.Transparency
			end
			if P.Transparency > 1 then
				P:Destroy() P = nil
				break
			end
		end
	end)
	
	if R ~= nil then
		p:Destroy()
		return P
	end
end
local function Slash2DX(Root, Direction, Offset, Rot,StartSize, EndSize, SizeDelta, TransparencySpeed, Color, Rot2)
	local RC = workspace:Raycast(Root.Position, Root.CFrame.UpVector*Direction, RaycastParams.new())
	if RC then
		local Slash = Effects.Slash2DX:Clone()
		Slash.Parent = NEffects
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


local function die(mo)
	for _, x in pairs(mo:GetChildren()) do
		if x:IsA("BasePart") then
			task.spawn(function()
				local s = Instance.new("Sound",x)
				s.SoundId="rbxassetid://6148096445"
				s:Play() s.Volume=2
				local s = Instance.new("Sound",x)
				s.SoundId="rbxassetid://9113464462"
				s:Play() s.Volume=1
				local s = Instance.new("Sound",x)
				s.SoundId="rbxassetid://9113464550"
				s:Play() s.Volume=1
				x.Parent=workspace.Terrain
				x:BreakJoints()
				x.CanCollide=true
				x.Transparency=0
				x.Color=Color3.fromRGB(74, 0, 0)
				x.Material=Enum.Material.Marble
				x.Velocity=Vector3.new(math.random(-10,10), 20, math.random(-10,10))
				x:ApplyAngularImpulse(Vector3.new(math.random(-15,15), 50, math.random(-15,15)))
				local s = x:Clone()
				s.Size = Vector3.new(x.Size.X,x.Size.Y/2,x.Size.Z)
				x.Size = Vector3.new(x.Size.X, x.Size.Y/2, x.Size.Z)
				for _, v in pairs(x:GetChildren()) do
					if v:IsA("Script") then
						x:Destroy()
					end
					if v:IsA("Attachment") then
						local blood = Instance.new("ParticleEmitter",v)
						blood.Acceleration = Vector3.new(0, -35, 0)
						blood.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.333333, 0, 0)), ColorSequenceKeypoint.new(0.5623959898948669, Color3.new(0.156863, 0.0117647, 0.0117647)), ColorSequenceKeypoint.new(1, Color3.new(0.333333, 0.0235294, 0.0235294))})
						blood.Lifetime = NumberRange.new(0.3499999940395355, 0.800000011920929)
						blood.LightEmission = -1
						blood.LightInfluence = 0.44999998807907104
						blood.Orientation = Enum.ParticleOrientation.VelocityParallel
						blood.Rate = 15
						blood.RotSpeed = NumberRange.new(-5, 5)
						blood.Rotation = NumberRange.new(90, 90)
						blood.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.08203677833080292, 0.4972374439239502), NumberSequenceKeypoint.new(0.37057992815971375, 0.16574561595916748), NumberSequenceKeypoint.new(0.42432814836502075, 0.16574561595916748), NumberSequenceKeypoint.new(1, 0)})
						blood.Speed = NumberRange.new(8, 18)
						blood.SpreadAngle = Vector2.new(-25, 25)
						blood.Texture = "rbxassetid://419625073"
						blood.VelocityInheritance = 0.15000000596046448
						blood.ZOffset = -1
						blood.Name = "Blood"
					end
					if v:IsA("SpecialMesh") then
						v:Destroy()
					end
				end
				task.wait(12)
				Tween(x,"Linear","Out",1,{Size=Vector3.new(0.1,0.1,0.1),Transparency=1})
				task.wait(1.25)
				x:Destroy()
			end)
		end
		if x:IsA("Script") or x:IsA("Accessory") then
			x:Destroy()
		end
		for _, x in pairs(x:GetDescendants()) do
			if x:IsA("Script") then
				x:Destroy()
			end
		end
	end
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
local function GlitchOut(NewID)
	task.spawn(function()
		MainTheme.TimePosition = 0
		Tween(MainTheme, "Linear", "Out", 0.15, {Pitch = 0.15})
		task.wait(0.14)
		MainTheme.SoundId="rbxasset://"..NewID
		MainTheme:Play()
		Tween(MainTheme, "Linear", "Out", 0.15, {Pitch = 1})
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

local function NewSound(ID, Vol, Pitch, Parent, Del)
	local S = Instance.new("Sound", Parent)
	S.SoundId = "rbxassetid://"..ID
	S.Volume = Vol
	S.Pitch = Pitch
	S:Play()
	task.spawn(function()
		if Del ~= nil then
			wait(S.TimeLength)
			S:Destroy()
		end
	end)
	return S
end

function Hit_Orb(Position, Range)
	local get = {}
	for _, x in pairs(workspace:GetDescendants()) do
		if x:IsA("Humanoid") and x.RootPart ~= nil then
			if (x.RootPart.Position - Position).Magnitude < Range then
				table.insert(x,get)
			end
		end
	end
	return get
end

local function Activate()
	Attack=true
	HumanoidRootPart.Anchored=true
	task.spawn(function()
		local a=HumanoidRootPart.CFrame
		for i=1, 50 do
			task.wait()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1, 0, -0.3499999940395355)*CFrame.Angles(2.077500343322754, -1.0663166046142578, 1.0013930797576904),0.25) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0, -0.3499999940395355)*CFrame.Angles(2.077500343322754, 1.0663167238235474, -1.00139319896698),0.25) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -1, 0)*CFrame.Angles(-1.5707963705062866, -1.134463906288147, -0.7853982448577881),0.25) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, 0)*CFrame.Angles(-0.4363323450088501, 1.5707963705062866, 0),0.25) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.9198620319366455, 2.990034175809342e-08, 3.141592502593994),0.25) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, 4, 0.75)*CFrame.Angles(-1.2217304706573486, 2.9900348863520776e-08, -3.141592502593994),0.25)
		    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(a*CFrame.new(0,100,0),0.15)
		end
	end)
	AttackId = 1
	local WAIL = script.Models.Wail:Clone()
	WAIL.Name="KILLER_WAIL"
	WAIL.Parent=workspace.Terrain
	WAIL.Anchored=false WAIL.CanCollide=false
	WAIL.Transparency=1
	WAIL.CFrame = Torso.CFrame * CFrame.new(0, 0, 4)
	local motor6_d = Instance.new("Motor6D",Torso)
	motor6_d.C0 = CFrame.fromMatrix(Vector3.new(0, 0, 4), Vector3.new(1, 0, 0), Vector3.new(0, 0.9396926164627075, 0.3420201539993286), Vector3.new(0, -0.3420201539993286, 0.9396926164627075))
	motor6_d.Part0 = WAIL
	motor6_d.Part1 = Torso
	Tween(WAIL, "Linear", "In", 0.15, {Transparency = 0})
	repeat task.wait()
	HumanoidRootPart.CFrame=HumanoidRootPart.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position,Pos.p),0.25)	
	until MouseDown == true
	local Cylinder = Instance.new("Part",WAIL)
	Cylinder.Transparency=1
	Cylinder.Size=Vector3.new(2048,19.5,19.5)
	Cylinder.CanCollide=false Cylinder.Anchored=true
	Cylinder.Material=Enum.Material.Neon
	Cylinder.Shape=Enum.PartType.Cylinder Cylinder.Color=Color3.new(0.333333, 0, 1)
	Cylinder.CFrame=WAIL.CFrame*CFrame.Angles(math.rad(0),math.rad(90),math.rad(0)) * CFrame.new(2048 / 2 + 3,0,0)
	Tween(Cylinder, "Linear", "In", 2, { Size = Vector3.new(450,60,60)})
	task.spawn(function()
		local texture = Instance.new("Texture")
		texture.Texture = "rbxassetid://4510501361"
		texture.Face = Enum.NormalId.Back
		texture.Parent = Cylinder

		local texture_2 = Instance.new("Texture")
		texture_2.Texture = "rbxassetid://4510501361"
		texture_2.Face = Enum.NormalId.Top
		texture_2.Parent = Cylinder

		local texture_3 = Instance.new("Texture")
		texture_3.Texture = "rbxassetid://4510501361"
		texture_3.Face = Enum.NormalId.Bottom
		texture_3.Parent = Cylinder

		local texture_4 = Instance.new("Texture")
		texture_4.Texture = "rbxassetid://4510501361"
		texture_4.Parent = Cylinder

		for _, x in pairs(Cylinder:GetChildren()) do
			if x:IsA("Texture") then
				x.StudsPerTileU=20
				x.StudsPerTileV=20
				Tween(x, "Linear", "In", 1, {StudsPerTileU=3, StudsPerTileV=5})
			end
		end
		wait(4.5)
		while Cylinder do
			task.wait()
			texture_4.StudsPerTileU = texture_4.StudsPerTileU - 0.001
			texture_4.StudsPerTileV = texture_4.StudsPerTileV - 0.001
			texture_3.StudsPerTileU = texture_3.StudsPerTileU - 0.001
			texture_3.StudsPerTileV = texture_3.StudsPerTileV - 0.001
			texture_2.StudsPerTileU = texture_2.StudsPerTileU - 0.001
			texture_2.StudsPerTileV = texture_2.StudsPerTileV - 0.001
			texture.StudsPerTileU = texture.StudsPerTileU - 0.001
			texture.StudsPerTileV = texture.StudsPerTileV - 0.001
			--texture.Transparency=Cylinder.Transparency texture_2.Transparency=Cylinder.Transparency texture_3.Transparency=Cylinder.Transparency texture_4.Transparency=Cylinder.Transparency
		end
	end)
	local smooth=Instance.new("Part",Cylinder)
	smooth.Size=Vector3.new(19.5,59,59) smooth.Anchored=true smooth.Color = Cylinder.Color
	smooth.Anchored=true smooth.CFrame=Cylinder.CFrame*CFrame.new(2048/2.02,0,0) smooth.Shape=Enum.PartType.Ball smooth.Material=Enum.Material.Neon
	smooth.Transparency=1
	local S = Instance.new("Sound",workspace)
	S.SoundId="rbxasset://MS/W1.mp3" S.Volume=8
	S:Play()
	Tween(Cylinder, "Linear", "In", 1, {Transparency = 0.75})
	Tween(smooth, "Linear", "In", 1, {Transparency = 0.75})
	local ogsize=WAIL.Size
	wait(3)
	Darkness(5)
	local b = Instance.new("BloomEffect",game.Lighting)
	b.Threshold=0.5
	local d = Instance.new("DistortionSoundEffect",S)
	S:Play()
	S.TimePosition=3
	local blurWAIL = WAIL:Clone()
	for _, x in pairs(blurWAIL:GetChildren()) do
		if x:IsA("Instance") then
			x:Destroy()
		end
	end
	blurWAIL.Parent=WAIL
	blurWAIL.TextureID=""
	blurWAIL.Material=Enum.Material.Neon
	blurWAIL.Color=Cylinder.Color
	local blur = Cylinder:Clone()
	blur.Parent=Cylinder blur.Transparency=0.1
	task.spawn(function()
		Tween(blurWAIL, "Quad", "Out", 0.15, {Transparency=1, Size = blurWAIL.Size + Vector3.new(15, 15, 15)})
		Tween(blur, "Linear", "Out", 0.1, {Transparency=1, Size = blur.Size + Vector3.new(0, 15, 15)})
		for _, x in pairs(blur:GetChildren()) do
			if x:IsA("Texture") then
				Tween(x, "Linear", "Out", 0.25, {Transparency=1})
			end
		end
		wait(0.25)
		blurWAIL:Destroy()
		blur:Destroy()
	end)	
	local t = Cylinder.Touched:Connect(function(BP)
		if BP ~= nil and BP.Parent ~= nil then
			if BP.Parent:FindFirstChildOfClass("Humanoid") then
				if BP.Parent:FindFirstChildOfClass("Humanoid") ~= Humanoid then
					BP.Parent:FindFirstChildOfClass("Humanoid").Health =  0
					die(BP.Parent)
				end
			end
		end
	end)
	WAIL.Size=WAIL.Size+Vector3.new(2.6,2.6,2.6)
	Tween(WAIL, "Linear", "Out", 1.45, {Size=ogsize})
	task.spawn(function()
		local cf = WAIL.CFrame
		while Cylinder do
			task.wait()
			WAIL.CFrame=cf*CFrame.new(math.random(-1,1)/10,math.random(-1,1)/10,math.random(-1,1)/10)*CFrame.Angles(math.rad(math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1)))
			Cylinder.CFrame=Cylinder.CFrame*CFrame.Angles(math.rad(15),0,0) Cylinder.Size=Vector3.new(2048,60.5+math.random(-1,1)/5,60.5+math.random(-1,1)/5)
		end
	end)
	local Cylinder2 = Instance.new("Part",workspace.Terrain)
	Cylinder2.Size=Vector3.new(2046,59,59)
	Cylinder2.CanCollide=false Cylinder2.Anchored=true
	Cylinder2.Material=Enum.Material.Glass
	Cylinder2.Shape=Enum.PartType.Cylinder
	Cylinder2.CFrame=WAIL.CFrame*CFrame.Angles(math.rad(0),math.rad(90),math.rad(0)) * CFrame.new(2047 / 2 + 3.5,0,0)
	Cylinder2.Transparency=10
	local h=Instance.new("Highlight",Cylinder2)
	h.Enabled=false
	task.spawn(function()
		while Cylinder2 do
			task.wait()
			Cylinder2.CFrame=Cylinder2.CFrame*CFrame.Angles(math.rad(-18),0,0)
		end
	end)
	Cylinder.Transparency=0
	Tween(Cylinder, "Linear", "In", 0.1, { Size = Vector3.new(19,59,59)})
	Tween(Cylinder, "Linear", "In", 0.25, {Transparency = 0.65})
	Tween(smooth, "Linear", "In", 0.1, {Size = Vector3.new(19,59,59)})
	Tween(smooth, "Linear", "In", 0.35, {Transparency = 0.65})
	wait(5)
	for _, x in pairs(Cylinder:GetChildren()) do
		if x:IsA("Texture") then
			Tween(x, "Linear", "In", 0.35, {Transparency=1})
		end
	end
	Tween(Cylinder2, "Quad", "In", 0.15, {Size = Vector3.new(0.1,0.1,0.1)})
	Tween(Cylinder, "Linear", "In", 0.35, {Transparency = 1})
	Tween(smooth, "Linear", "In", 0.35, {Transparency = 1})
	task.spawn(function()
		wait(0.95)
		Cylinder:Destroy()
	end)	
	wait(1.5)
	Cylinder:Destroy()
	Tween(WAIL, "Linear", "In", 0.1, {Transparency = 1})
	wait(0.15)
	WAIL:Destroy()
	t:Disconnect()
	t=nil
	Attack=false
	HumanoidRootPart.Anchored=false
	Tween(b,"Linear","Out",2,{Intensity=0})
	wait(2)
	b:Destroy()
	return
end

function AttackBeam(Start, Color, Humanoid, Origin)
	local damage = 0
	task.wait(0.05)
	collected = collected - 1
	local collect = Instance.new("Part", workspace.Terrain)
	collect.Transparency = 0 
	collect.Anchored = true
	collect:BreakJoints()
	collect.Size = Vector3.new(1,1,1)
	collect.Shape = Enum.PartType.Ball
	collect.CFrame = Start
	collect.Parent = workspace.Terrain
	collect.CanCollide = false
	collect.Color = Color
	collect:ClearAllChildren()
	local shatter = Instance.new("Sound", collect)
	shatter.SoundId = "rbxassetid://618826713"
	shatter.Volume = 0.75
	shatter.Pitch = 1.25
	shatter:Play()
	local particle_emitter = Instance.new("ParticleEmitter",collect)
	particle_emitter.Brightness = 2
	particle_emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C1), ColorSequenceKeypoint.new(1, C2)})
	particle_emitter.Lifetime = NumberRange.new(0.5, 1)
	particle_emitter.LightEmission = 2
	particle_emitter.Rate = 100
	particle_emitter.Rotation = NumberRange.new(-360, 360)
	particle_emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.09133295804262161), NumberSequenceKeypoint.new(1, 0)})
	particle_emitter.Speed = NumberRange.new(0.411, 0.616)
	particle_emitter.SpreadAngle = Vector2.new(-360, 360)
	particle_emitter.Texture = "rbxassetid://867619398"
	collect.Material = Enum.Material.Neon
	local Trail = Instance.new("Trail", collect)
	local A0, A1 = Instance.new("Attachment", collect), Instance.new("Attachment", collect)
	A0.CFrame = A0.CFrame * CFrame.new(-0.1, -0.1, -0.1)
	A1.CFrame = A1.CFrame * CFrame.new(0.1, 0.1, 0.1)
	Trail.Attachment0 = A0
	Trail.Attachment1 = A1
	Trail.FaceCamera = true
	Trail.LightInfluence = 0
	Trail.Brightness = 5
	Trail.Texture = "rbxassetid://242292288"
	Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	Trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
	Trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(1, 0.01, 0)})
	local Bill = Instance.new("BillboardGui", collect)
	Bill.AlwaysOnTop = false
	Bill.LightInfluence = 0
	Bill.Brightness = 5
	Bill.Size = UDim2.new(15, 0, 15, 0)
	local Img = Instance.new("ImageLabel",Bill)
	Img.Image = "rbxassetid://2038571567"
	Img.BackgroundTransparency = 1
	Img.Size = UDim2.new(1, 0, 1, 0)
	Img.ImageColor3=Color
	local P0, P1, P2, P3 = collect.Position, Humanoid.RootPart.Position + Vector3.new(math.random(-40, 40), math.random(-20, 20), math.random(-10, 10)), Humanoid.RootPart.Position + Vector3.new(math.random(-55, 55), math.random(-40, 40), math.random(-25, 25)), Humanoid.RootPart.Position
	collect.Anchored = true
	local move = true
	task.spawn(function()
		local sound = Instance.new("Sound", collect)
		sound.SoundId = "rbxassetid://5288639224"
		sound.Volume = 5.25
		sound:Play()
		local sound2 = Instance.new("Sound", collect)
		sound2.SoundId = "rbxassetid://9125635285"
		sound2.Volume = 1.25
		sound:Play()
		for i=1, 480 do
			task.wait()
			local alpha = 0.02 * i / 2
			local interpolatedPosition = CFrame.new(
				P0:Lerp(P3, alpha) * (1 - alpha)^3 + 3 * P1 * alpha * (1 - alpha)^2 + 3 * P2 * alpha^2 * (1 - alpha) + P3 * alpha^3
			)
			if move == true then
				collect.Orientation = Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360))
				collect.CFrame = interpolatedPosition
			end

			if Humanoid.Health ~= 0 then
				P3 = Humanoid.RootPart.Position
			else
				P3 = Origin.Position
			end

			if Humanoid.Health ~= 0 then
				if (collect.Position - Humanoid.RootPart.Position).Magnitude < 0.5 then
					local dmg = 5
					move = false
					Text_M("-"..dmg,Humanoid.RootPart.CFrame * cf(math.random(-4, 4), 0, math.random(-4, 4)), 0.35)
					Humanoid.Health = Humanoid.Health - dmg
					damage = damage + dmg
					if Humanoid.Health == 0 then
						Death(Humanoid.Parent, C1, HumanoidRootPart)
					end
					
					local s = Instance.new("Sound", collect)
					s.SoundId = "rbxassetid://8907342892"
					s.Volume = 1.5
					s.RollOffMinDistance = 25
					s:Play()
					stopped(s)
					task.spawn(function()
						for i=1, 2 do
							task.wait()
							Block3D(collect.CFrame *angles(rad(90 + math.random(-360, 360)),0,rad(math.random(-360,360))), Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1,0.1,0.1),cf(0,0,-0.1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
							Block3D(collect.CFrame *angles(rad(90 + math.random(-360, 360)),0,rad(math.random(-360,360))), Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1,0.1,0.1),cf(0,0,-0.1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
							Slash3DX(collect.CFrame  * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(8,0.01,8),0.05,0.02,C1,Effects)
						end
					end)
					collect.Transparency = 1
					Bill.Enabled = false
					Trail.Enabled = false
					particle_emitter.Enabled = false
					collected=collected+1
					task.wait(Trail.Lifetime)
					collect:Destroy()
					collect=nil
					break
				end
			else
				if (collect.Position - Origin.Position).Magnitude < 1 then
					local so = Instance.new("Sound",Torso)
					so.SoundId = "rbxassetid://2062119347"
					so.Volume = 1
					so.RollOffMinDistance = 25
					so:Play()
					Text_M("+1", Torso.CFrame * cf(math.random(-5, 5), 0, math.random(-5, 5)), 0.25)
					collect.Transparency = 1
					Bill.Enabled = false
					Trail.Enabled = false
					particle_emitter.Enabled = false
					collected=collected+1
					task.wait(Trail.Lifetime)
					collect:Destroy()
					collect=nil
					break
				end
			end
			
		end

	end)
end

function Death(Model, Color, Object)
	local hum = nil
	for i, x in pairs(Model:GetChildren()) do
		if x:IsA("Accessory") then
			x:Destroy()
		end
		if x:IsA("Humanoid") then
			hum=x
		end
		if x:IsA("BasePart") then

			x.Transparency = 0 
			x.Anchored = true
			x:BreakJoints()
			x.Parent = workspace.Terrain
			x.CanCollide = false
			x.Color = Color
			x:ClearAllChildren()
			local tween = nil
			local shatter = Instance.new("Sound", x)
			shatter.SoundId = "rbxassetid://618826713"
			shatter.Volume = 0.75
			shatter.Pitch = 1.25
			shatter:Play()
			task.spawn(function()
				Tween(x, "Linear", "Out", 0.45, {CFrame = x.CFrame * CFrame.new(math.random(-8, 8), math.random(-8, 8), math.random(-8, 8)) * CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))})
				task.wait(0.45)
				tween=Tween(x, "Back", "Out", math.random(6, 7.5), {CFrame = x.CFrame * CFrame.new(math.random(-8, 8), math.random(-8, 8), math.random(-8, 8))  * CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))})
			end)
			--Enum.EasingStyle.
			x.Material = Enum.Material.Neon
			local Trail = Instance.new("Trail", x)
			local A0, A1 = Instance.new("Attachment", x), Instance.new("Attachment", x)
			A0.CFrame = A0.CFrame * CFrame.new(-0.1, -0.1, -0.1)
			A1.CFrame = A1.CFrame * CFrame.new(0.1, 0.1, 0.1)
			Trail.Attachment0 = A0
			Trail.Attachment1 = A1
			Trail.FaceCamera = true
			Trail.LightInfluence = 0
			Trail.Brightness = 5
			Trail.Texture = "rbxassetid://242292288"
			Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
			Trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
			Trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(1, 0.01, 0)})
			local particle_emitter = Instance.new("ParticleEmitter",x)
			particle_emitter.Brightness = 2
			particle_emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))})
			particle_emitter.Lifetime = NumberRange.new(0.5, 1)
			particle_emitter.LightEmission = 2
			particle_emitter.Rate = 100
			particle_emitter.Rotation = NumberRange.new(-360, 360)
			particle_emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.09133295804262161), NumberSequenceKeypoint.new(1, 0)})
			particle_emitter.Speed = NumberRange.new(0.411, 0.616)
			particle_emitter.SpreadAngle = Vector2.new(-360, 360)
			particle_emitter.Texture = "rbxassetid://867619398"
			particle_emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C1), ColorSequenceKeypoint.new(1, C2)})
			x.Material = Enum.Material.Neon
			local Bill = Instance.new("BillboardGui", x)
			Bill.AlwaysOnTop = false
			Bill.LightInfluence = 0
			Bill.Brightness = 5
			Bill.Size = UDim2.new(15, 0, 15, 0)
			local Img = Instance.new("ImageLabel",Bill)
			Img.Image = "rbxassetid://2038571567"
			Img.BackgroundTransparency = 1
			Img.Size = UDim2.new(1, 0, 1, 0)
			Img.ImageColor3=Color
			x.Anchored = true
			local one = 0.25
			one = one * i
			task.spawn(function()
				task.wait(2.5)
				task.wait(one)
				local P0, P1, P2, P3 = x.Position, x.Position + Vector3.new(x.CFrame * cf(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))), x.Position + Vector3.new(x.CFrame * cf(math.random(-60, 60), math.random(-60, 60), math.random(-60, 60))), Object.Position
				local sound = Instance.new("Sound", x)
				sound.SoundId = "rbxassetid://5288639224"
				sound.Volume = 5.25
				sound:Play()
				local sound2 = Instance.new("Sound", x)
				sound2.SoundId = "rbxassetid://9125635285"
				sound2.Volume = 5.25
				sound2:Play()
				if tween ~= nil then
					tween:Pause()
					tween:Destroy()
					tween=nil
				end
				local collect = x
				for i=1, 580 do
					task.wait()
					P3 = Object.Position
					local alpha = 0.02 * i
					local interpolatedPosition = CFrame.new(
						P0:Lerp(P3, alpha) * (1 - alpha)^3 + 3 * P1 * alpha * (1 - alpha)^2 + 3 * P2 * alpha^2 * (1 - alpha) + P3 * alpha^3
					)
					x.Color = C1
					x.Orientation = Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360))
					x.CFrame = interpolatedPosition
					if (x.Position - Object.Position).Magnitude < 0.15 then
						collected = collected + 1 / 4
						local so = Instance.new("Sound",Torso)
						so.SoundId = "rbxassetid://2062119347"
						so.Volume = 1
						so.RollOffMinDistance = 25
						so:Play()
						Text_M("+0.25", Torso.CFrame * cf(math.random(-5, 5), 0, math.random(-5, 5)))
						Humanoid.Health=Humanoid.Health + 1000
						Humanoid.MaxHealth = Humanoid.MaxHealth + hum.MaxHealth * 10
						collect.Transparency = 1
						Bill.Enabled = false
						Trail.Enabled = false
						particle_emitter.Enabled = false
						collected=collected+1
						task.wait(Trail.Lifetime)
						collect:Destroy()
						collect=nil
						break
					end
				end
			end)
		end
	end
end

local function New_Mode(Name: string, ID: number, SongDest: string, Color1: Color3, Color2: Color3, SwitchVFX: BoolValue, Walkspeed: number, Runspeed: number, SongPitch: number, TextFont, TextStyle, NewMoveType: string, Res:BoolValue)
	for _, x in pairs(OCM:GetDescendants()) do
		if x:IsA("Frame") then
			x.BorderColor3=Color1
		end
	end
	for _, x in pairs(Wings:GetDescendants()) do
		if x:IsA("BasePart") then
			if x.Color == Color3.new(1,0,0) and not x:FindFirstChildOfClass("BoolValue") then
				local Bool = Instance.new("BoolValue",x)
				Bool.Name="Prim"
				x.Color = Color1
			end
			if x.Color == Color3.new(0,0,0) and not x:FindFirstChildOfClass("BoolValue") then
				local Bool = Instance.new("BoolValue",x)
				Bool.Name="Seco"
				x.Color = Color2
			end
			if x:FindFirstChild("Seco") then
				x.Color = Color2
				MultiTween(x, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {Color = Color2})
				if x:FindFirstChildOfClass("PointLight") then
					local Light = x:FindFirstChildOfClass("PointLight")
					Light.Color=Color1
					MultiTween(Light, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {Color = Color1})
					Light.Shadows = true
					Light.Brightness=0.5
					Light.Range=3.5 
				else
					local Light = Instance.new("PointLight",x)
					Light.Color=Color1
					Light.Shadows = true
					Light.Brightness=0.25
					Light.Range=3.5
				end
			end
			if x:FindFirstChild("Prim") then
				x.Color = Color1
				MultiTween(x, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {Color = Color1})
				if x:FindFirstChildOfClass("PointLight") then
				local Light = x:FindFirstChildOfClass("PointLight")
				Light.Color=Color1
					MultiTween(Light, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {Color = Color1})
				Light.Shadows = true
				Light.Brightness=0.5
				Light.Range=3.5 
				else
					local Light = Instance.new("PointLight",x)
					Light.Color=Color1
					Light.Shadows = true
					Light.Brightness=0.25
					Light.Range=3.5
				end
			end
		end
		if x:IsA("ParticleEmitter") or x:IsA("Trail") then
			x.Color = ColorSequence.new(Color1)
		end
	end
	--Tween(MainTheme, "Linear", "Out", 0.35, {Pitch = SongPitch})
	if SwitchVFX == true then
		
		MOG = ID
		ctween.Color = Color1
		C1 = Color1 C2 = Color2
		if Res == nil then
			GlitchOut(SongDest)
		end
		if Sprint == false then
			Humanoid.WalkSpeed = Walkspeed
		else
			Humanoid.WalkSpeed = Runspeed
		end
		Type="Flap"
		WS = Walkspeed
		RS = Runspeed
		Name_Label.Font = TextFont
		Name_Label.FontFace = TextStyle
		MoveType = NewMoveType
		script.VAR.MOG.Value = MOG
	local Val = Name
		MultiTween(coreglow, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {Color = C1})
		MultiTween(Name_Label, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.35, 0, false, {TextColor3 = Color1, TextStrokeColor3 = Color2})
	for i=1, string.len(Val) do
		task.wait()
			Name_Label.Text = string.sub(Name, 1, i)
	end
	else
		Name_Label.Text = Name
		MOG = ID
		ctween.Color = Color1
		C1 = Color1 C2 = Color2
		Name_Label.Font = TextFont
		Name_Label.FontFace = TextStyle
		MoveType = NewMoveType
		Name_Label.TextColor3 = Color1
		Name_Label.TextStrokeColor3=Color2

		--MultiTween(Name_Label, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.25, 0, false, {TextColor3 = Color1, TextStrokeColor3 = Color2})
	end
	Pitch = SongPitch
end

local function CORE()
	MainTheme:Play()
	MainTheme.TimePosition=0
	New_Mode("...", 1000, "MS/X1.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 15, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	local quick = RunService.Heartbeat:Connect(function()
		Block3D(HumanoidRootPart.CFrame * CFrame.new(math.random(-500, 500), math.random(-500,500), math.random(-500, 500))*CFrame.Angles(math.rad(90 + math.random(-34, 34)),0,math.rad(math.random(-45,45))), Vector3.new(2.5, 2.5, 2.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
		Block3D(HumanoidRootPart.CFrame * CFrame.new(math.random(-500, 500), 0, math.random(-500, 500))*CFrame.Angles(math.rad(90 + math.random(-34, 34)),0,math.rad(math.random(-45,45))), Vector3.new(2.5, 2.5, 2.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
		Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(1504,0.01,1504),0.15,0.02,Color3.new(1, 1, 1))
	end)
	task.spawn(function()
		wait(4)
		HumanoidRootPart.Anchored=true
	end)
	wait(55)
	NewSound(577577237,0.85,0.85,workspace)
	NewSound(1835333323,2,1,workspace)
	MOG = 1001
	task.spawn(function()
		for i=1, 50 do
			task.wait()
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),30,Color3.new(0.317647, 0, 1),Vector3.new(20, 20, 800), Vector3.new(20, 20, 800),Effects,0.01)
		end
	end)
	EffectSphere(HumanoidRootPart.CFrame*CFrame.Angles(math.rad(90),0,0),0,Color3.new(0.333333, 0, 1),Vector3.new(20, 20, 800), Vector3.new(80, 80, 800),Effects,0.01)
	
	HumanoidRootPart.Anchored=false
	New_Mode("INKANTATION", 1001, "MS/X1.mp3", Color3.new(0.333333, 0, 1), Color3.new(0, 0, 0), true, 2000, 2000, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat",false)
quick:Disconnect()
quick=nil
end

function DMG(Humanoid: Humanoid, Damage: number)
	if Humanoid ~= nil then
		Humanoid.Health = Humanoid.Health - Damage
		Text_M("-"..Damage, Humanoid.RootPart.CFrame, 0.35)
		task.spawn(function()
			task.wait(1 / 100)
			if Humanoid.Health == 0 then
				Death(Humanoid.Parent, C1, HumanoidRootPart)
			end
		end)
	end
end

function stopped(sound: Sound)
	task.spawn(function()
		while sound do
			task.wait()
			if sound.TimePosition == sound.TimeLength then
				sound:Destroy()
				sound = nil
				break
			end
		end
	end)
end


function Text_M(Text, CF, T)
	task.spawn(function()
	local bill = Instance.new("BillboardGui")
	bill.Brightness = 3.5
	bill.Enabled=false
	bill.Size = UDim2.new(20, 0, 10, 0)

	local tl = Instance.new("TextLabel",bill)
	tl.Font = Enum.Font.Arcade
	tl.RichText = true
	tl.Text = Text.."!"
	tl.TextScaled = true
	tl.TextColor3=C1
	tl.TextTransparency = 1
	tl.TextWrapped = true
	tl.BackgroundTransparency = 1
	tl.TextStrokeTransparency=1
	tl.Size = UDim2.new(1, 0, 1, 0)
	tl.Rotation = math.random(-15, 15)


	local part = Instance.new("Part", workspace.Terrain)
	part.CFrame = CF
	part.Anchored = true
	part.CanCollide = false part.Transparency=1
	part.Size=Vector3.zero
	local New = bill
	New.Parent = part
	New.Enabled = true

	Tween(New.TextLabel, "Sine", "Out", 0.25, {TextTransparency = 0, TextStrokeTransparency = 0})
	Tween(New, "Sine", "Out", 0.25, {StudsOffsetWorldSpace = Vector3.new(0, 7, 0)})

	if T == nil then
		task.wait(1)
	else

		task.wait(T)
	end

	Tween(New.TextLabel, "Sine", "Out", 0.35, {TextTransparency = 1, Rotation = 105})
	Tween(New, "Sine", "Out", 0.65, {StudsOffsetWorldSpace = Vector3.new(0, 0, 0)})
	task.wait(0.65)
	part:Destroy()
	part=nil
 end)
end

local function COLLAPSE_exclamation_mark()
	Attack = true
	AttackId = 3
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://9099795388"
	s.Volume = 3.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	--9057591742
	Humanoid.WalkSpeed = WS / 16
	for i=1, 30 do
		task.wait()
	end
	AttackId = 4
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://9057591742"
	s.Volume = 1.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	--618826713
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://618826713"
	s.Volume = 2.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	task.spawn(function()
		for _, x in pairs(workspace:GetDescendants()) do
			if x:IsA("Humanoid") then
				if x.RootPart then
					if (x.RootPart.Position - HumanoidRootPart.Position).Magnitude < 30 and x ~= Humanoid then
						DMG(x, math.random(77615, 125125))
					end
				end
			end
		end
	end)
	 
		for i=1, 15 do
			task.wait()
			AttackId = 4
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-30, 30), -5, math.random(-30, 30))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
		Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,C2,NEffects)
		Slash3DX(Torso.CFrame * cf(0, -3, 0) * CFrame.Angles(rad(math.random(-15, 15)), math.random(-360, 360), 0),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,C1,NEffects)
		Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(120,0.01,120),0.15,0.06,C1,NEffects)
		EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
		end
	if Sprint == true then
		Humanoid.WalkSpeed=RS
	else
		Humanoid.WalkSpeed=WS
	end
		task.wait(0.2)
	Attack = false
end

local function Dash_EXCLACMATION_MARK()
	Attack=true 
	AttackId=7
	task.wait(0.35)
	local sound=Instance.new("Sound",Torso)
	sound.SoundId="rbxassetid://618826713"
	sound.Volume=1.25
	sound:Play()
	sound.RollOffMinDistance=100
	stopped(sound)
	HumanoidRootPart.Anchored = true
	AttackId=8
	for i=1, 50 do
		local Orb = Instance.new("Part", Effects)
		Orb.Size=Vector3.zero
		Orb.Anchored=true
		Orb.Shape = Enum.PartType.Ball
		Orb.CFrame = HumanoidRootPart.CFrame
		Orb.Color = C1
		Orb.Material=Enum.Material.Neon
		Orb.CanCollide = false
		Orb.Transparency=1
		local Orb2 = Instance.new("Part", Orb)
		Orb2.Size=Vector3.zero
		Orb2.Anchored=true
		Orb2.Shape = Enum.PartType.Ball
		Orb2.CFrame = HumanoidRootPart.CFrame
		Orb2.Color = C2
		Orb2.Material=Enum.Material.Neon
		Orb2.CanCollide = false
		Orb2.Transparency=1
	RunService.Stepped:Wait()
		Tween(Orb, "Quad", "Out", 0.25, {Size=Vector3.new(26,26,26),Transparency=0.75})
		Tween(Orb2, "Quad", "Out", 0.25, {Size=Vector3.new(20,20,20),Transparency=0})
		task.spawn(function()
			for _, x in pairs(workspace:GetDescendants()) do
				if x:IsA("Humanoid") then
					if x.RootPart then
						if (x.RootPart.Position - HumanoidRootPart.Position).Magnitude < 15 and x ~= Humanoid then
							DMG(x, math.random(77615, 125125))
						end
					end
				end
			end
		end)
		task.spawn(function()
			local sound=Instance.new("Sound",Torso)
			sound.SoundId="rbxassetid://1843115730"
			sound.Volume=1.25
			sound:Play()
			sound.RollOffMinDistance=100
			stopped(sound)
			local sound=Instance.new("Sound",Torso)
			sound.SoundId="rbxassetid://3356359494"
			sound.Volume=1
			sound:Play()
			sound.RollOffMinDistance=100
			stopped(sound)
			task.wait(0.75)
			Tween(Orb2, "Quad", "Out", 0.25, {Size=Vector3.zero,Transparency=1})
			Tween(Orb, "Quad", "Out", 0.25, {Size=Vector3.zero,Transparency=1})
			local vanish = Instance.new("Sound", Orb)
			vanish.SoundId="rbxassetid://6337656934"
			vanish.Volume = 1.5
			vanish:Play()
			vanish.RollOffMinDistance=150
			stopped(vanish)
			repeat task.wait() until vanish.TimePosition == vanish.TimeLength
			for i=1, 10 do
				Block3D(Orb.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
				Block3D(Orb.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
				Block3D(Orb.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
				Block3D(Orb.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			end
			Orb:Destroy()
			Orb=nil
		end)
		HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * cf(0, 0, -10)
	end
	HumanoidRootPart.Anchored=false
	task.wait(1)
	Attack=false
	AttackId=0
end

local function FCOLLAPSE_exclamation_mark()
	Attack = true
	AttackId = 5
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://9099795388"
	s.Volume = 3.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	--9057591742
	Humanoid.WalkSpeed = WS / 100
	for i=1, 30 do
		task.wait()
	end
	s:Stop()
	s:Destroy()
	AttackId = 6
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://9057591742"
	s.Volume = 1.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	--618826713
	local s = Instance.new("Sound", HumanoidRootPart)
	s.SoundId = "rbxassetid://618826713"
	s.Volume = 2.25
	s.RollOffMinDistance = 100
	s:Play()
	stopped(s)
	task.spawn(function()
		for _, x in pairs(workspace:GetDescendants()) do
			if x:IsA("Humanoid") then
				if x.RootPart then
					if (x.RootPart.Position - HumanoidRootPart.Position).Magnitude < 45 and x ~= Humanoid then
						DMG(x, math.random(77615, 125125))
					end
				end
			end
		end
	end)

	for i=1, 15 do
		task.wait()
		AttackId = 6
		Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(160,0.01,160),0.15,0.06,C2,NEffects)
		Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(160,0.01,160),0.15,0.06,Color3.new(1, 1, 1),NEffects)
		EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
	end
	if Sprint == true then
		Humanoid.WalkSpeed=RS
	else
		Humanoid.WalkSpeed=WS
	end
	task.wait(0.2)
	Attack = false
end

function BLANK_WORLD()
	AttackId=3
	Attack = true
	HumanoidRootPart.Anchored = true
	-- 5 14 4, 14 15 23
	New_Mode("", 5144, "MS/A1.mp3", Color3.new(0, 0, 0), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	task.wait(12.5)
	local s = Instance.new("Sound", Torso)
	s.SoundId="rbxassetid://261227592"
	s.Volume=2
	s.RollOffMinDistance=60
	s:Play()
	stopped(s)
	New_Mode("", 141523, "MS/A1.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), false, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	local objs = {}
	for _, x in pairs(game:GetDescendants()) do
		if x:IsA("BasePart") then
			if not x.Parent:IsA("Accessory") or not x.Parent:FindFirstChildOfClass("Humanoid") then
				if x.Parent ~= Wings or x.Parent ~= Character then
					table.insert(objs, x)
				end
			end
		end
	end
	local captured = {}
	for i,x in pairs(objs) do
		x.Transparency = 1
		x.Anchored = true
		x.CanCollide = true
		local Sel = Instance.new("SelectionBox", x)
		Sel.Adornee = x
		Sel.Color3 = Color3.new(0,1,1)
		x.Color = Color3.new(0,0,0)
		local rand = math.random(1, 3)
		if rand == 3 then
			RunService.Heartbeat:Wait()
		end
		table.insert(captured,x)
	end
	
	Tween(game.Lighting, "Linear", "Out", 1, {ClockTime = 0, Brightness = 0})
	
	task.wait(5)

	local soul = {}
	for _, x in pairs(game:GetDescendants()) do
		if x:IsA("BasePart") then
			if x:IsA("BasePart") then
				if x.Parent:IsA("Accessory") or x.Parent:FindFirstChildOfClass("Humanoid") and x.Parent ~= Character and x.Parent.Parent ~= Character then
					table.insert(soul, x)
				end
			end
		end
	end
	
	game.Players.RespawnTime=math.huge
	for i,x in pairs(soul) do
			x.Transparency = 1
			x.Anchored = true
			x.Color = Color3.new(0,0,0)
			x.Material = Enum.Material.Neon
		local Sel = Instance.new("SelectionBox", x)
		Sel.Adornee = x
		Sel.Color3 = Color3.new(0,1,1)
	end
	
	control = true
	Tween(MainTheme, "Linear", "Out", 10, {Pitch = 0})
	New_Mode("", 0000000, "MS/A1.mp3", Color3.new(0, 0, 0), Color3.new(0, 0, 0), false, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	local objs = {}
	
	task.wait(5)
	
	Tween(game.Lighting, "Linear", "Out", 14.5, {ExposureCompensation = -50})
	
	task.wait(14.5)
	
	for _, x in pairs(workspace:GetDescendants()) do
		if x:IsA("BasePart") then
			x:Destroy()
		end
		if x:IsA("Model") then
			x:Destroy()
		end
		if x:IsA("Script") then
			x:Destroy()
		end
	end
end


function validate()
	local Data = {exists=false, hum=nil}
	for _, x in pairs(workspace:GetDescendants()) do
		if x:IsA("Humanoid") then
			if x ~= nil and x ~= Humanoid then
				if x.RootPart then
					if (x.RootPart.Position - Vector3.new(Pos)).Magnitude < 5 then
						Data=nil
						Data={exists=true,hum=x}
						human=x
					end
				end
			end
		end
	end
	return Data
end

New_Mode("MURDEREN", 1, "MS/A1.mp3", Color3.new(1, 0, 0), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")

Mouse.KeyDown:Connect(function(_, Key)
	
	if tonumber(Key)  then
		if Valid[tonumber(Key)] then
			Side = tonumber(Key)
			
			if Side == 2 then
				New_Mode("XENOPHARIC", 1, "MS/C2.mp3", Color3.new(0, 1, 0.5), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
			elseif Side == 1 then
				New_Mode("MURDEREN", 1, "MS/A1.mp3", Color3.new(1, 0, 0), Color3.new(0, 0, 0), true, 11, 35, 0.75, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
			elseif Side == 3 then
				New_Mode("MAXI", 1, "MS/B6.mp3", Color3.new(0.5, 0.45, 1), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
			end
		end
	end
	
	if Side == 1 then
	if Key == "q" and MOG ~= 1 then
		New_Mode("MURDEREN", 1, "MS/A1.mp3", Color3.new(1, 0, 0), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "b" and MOG == 1 then
		New_Mode("END-OF-THE-CENTURY", 31, "MS/01.mp3", Color3.new(0.533333, 0.00392157, 1), Color3.new(0, 0, 0), true, 35, 455, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "m" and MOG == 1 then
		New_Mode("DISORDER", 9, "MS/B2.mp3", Color3.new(0, 0.75, 0.5), Color3.new(0,0,0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "n" and MOG == 1 then                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          -- :troll:
		New_Mode("TERMINATION", 10, "MS/B3.mp3", Color3.new(1, 0.1, 0.2), Color3.new(0,0,0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "e" and MOG ~= 2 then
		New_Mode("ABSOLUTATION", 2, "MS/A2.mp3", Color3.new(1, 0.333333, 0), Color3.new(0,0,0), true, 25, 355, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "m" and MOG == 2 then
		New_Mode("FEGETA", 23, "MS/B8.mp3", Color3.new(1, 0.65, 0), Color3.new(0,0,0), true, 25, 355, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "n" and MOG == 2 then
		New_Mode("STYGIOPHOBIA", 26, "MS/B9.mp3", Color3.new(1, 0.25, 0), Color3.new(0.1,0,0), true, 15, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "r" and MOG ~= 3 then
		New_Mode("ULTRA-FRENZY!", 3, "MS/A3.mp3", Color3.new(0.823529, 0.788235, 1), Color3.new(0, 0, 0), true, 35, 655, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "m" and MOG == 3 then
		New_Mode("ATOXIORA", 18, "MS/B4.mp3", Color3.new(0.9, 0.5, 0.9), Color3.new(0, 0, 0), true, 25, 855, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "t" and MOG ~= 4 then
		New_Mode("TERRIFIRICIAN", 4, "MS/A4.mp3", Color3.new(0.333333, 1, 0), Color3.new(0, 0, 0), true, 15, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "m" and MOG == 4 then
		New_Mode("BIOHAZARD", 22, "MS/B7.mp3", Color3.new(0.2, 0.5, 0), Color3.new(0.1, 0.1, 0), true, 10, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "y" and MOG ~= 5 then
		New_Mode("ULTIMATION", 5, "MS/A5.mp3", Color3.new(0.333333, 0, 1), Color3.new(0, 0, 0), true, 15, 456, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "n" and MOG == 5 then
		New_Mode("AMARRA", 30, "MS/B12.mp3", Color3.new(1, 0, 0.4), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "m" and MOG == 5 then
		New_Mode("MELLIOQUENT", 6, "MS/B1.mp3", Color3.new(0.9, 0.9, 0), Color3.new(0, 0, 0), true, 45, 455, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "u" and MOG ~= 7 then
		New_Mode("DISCOVERATION", 7, "MS/A6.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 30, 460, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "f" and MOG ~= 8 then
		New_Mode("TECHNOQUASARIFIC", 8, "MS/A7.mp3", Color3.new(0, 0.9, 0.9), Color3.new(0, 0, 0), true, 15, 345, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "m" and MOG == 8 then
		New_Mode("OMNICRADESCANT", 28, "MS/B10.mp3", Color3.new(0.7, 1, 1), Color3.new(0, 0, 0), true, 15, 345, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "n" and MOG == 8 then -- :3 I see you lol!!!!!!!!
		New_Mode("GLACIA", 29, "MS/B11.mp3", Color3.new(0.9, 0.5, 0.8), Color3.new(0, 0, 0), true, 15, 345, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "g" and MOG ~= 11 then -- crumpet
		New_Mode("Creseptumiant", 11, "MS/A8.mp3", Color3.new(0, 0.25, 1), Color3.new(0, 0, 0), true, 15, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
	elseif Key == "n" and MOG == 11 then 
		New_Mode("Evastmoke", 19, "MS/B5.mp3", Color3.new(0.6, 0.2, 0.3), Color3.new(0, 0, 0), true, 45, 555, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "m" and MOG == 11 then 
		New_Mode("ELECTRIFY", 20, "MS/B6.mp3", Color3.new(0.5, 0.45, 1), Color3.new(0, 0, 0), true, 55, 485, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		MainTheme.TimePosition = 62
		--LETS SEE HOW FAST WE CAN REALLY GO!
	elseif Key == "h" and MOG ~= 15 then 
		New_Mode("L I G H T S P E E D!!!", 15, "MS/A9.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 155, 4400, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		--One day, my power may transcend..
	elseif Key == "m" and MOG == 15 then 
		New_Mode("NUCLEAR-STAR", 16, "MS/A10.mp3", Color3.new(0.3, 0.7, 0), Color3.new(0, 0, 0), true, 15, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
		--WITH A POWER OF JUSTICE UNMATCHED!
	elseif Key == "n" and MOG == 15 then 
		New_Mode("Liberex", 17, "MS/A12.mp3", Color3.new(0, 0.75, 1), Color3.new(0, 0, 0), true, 55, 100, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "k" and MOG ~= 12 then 
		New_Mode("404-ERROR%$^$%FORBIDDEN", 12, "MS/X2.mp3", Color3.new(1, 0, 0), Color3.new(0, 0, 0), true, 70, 5200, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")	
        Type="Glitch"
	elseif Key == "m" and MOG == 12 then 
		New_Mode("WARFARE-345", 27, "MS/X8.mp3", Color3.new(1, 0.415686, 0), Color3.new(0, 0, 0), true, 170, 9200, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")	
		MainTheme.TimePosition=148
		Type="Glitch"
	elseif Key == "j" and MOG ~= 13 then 
		New_Mode("Sig-Sig", 13, "MS/X3.mp3", Color3.new(1, 0.27451, 0.054902), Color3.new(1, 0, 0), true, 70, 5200, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")		
	elseif Key == "l" and MOG ~= 14 then 
		New_Mode("ULTRA-VIBRANT", 14, "MS/X4.mp3", Color3.new(0.333333, 0, 1), Color3.new(0, 0, 0), true, 15, 165, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "[" and MOG ~= 21 then 
		New_Mode("TRANSCENDANCE", 21, "MS/X5.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 15, 55, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	elseif Key == "]" and MOG ~= 24 then 
		New_Mode("BURNING-BRAIN", 24, "MS/X6.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 155, 5555, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
        MainTheme.TimePosition=52	
		Type="Glitch" -- I am the one who knocks
	elseif Key == "'" and MOG ~= 25 then 
		New_Mode("FAKE_MALWARE", 25, "MS/X7.mp3", Color3.new(0.352941, 0.176471, 0.0980392), Color3.new(0, 0, 0), true, 155, 254, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")	
	elseif Key == "=" and MOG ~= 1000 then
		CORE() 
	end
	
	elseif Side == 2 then
		if Key == "q" and MOG ~= 1 then
			New_Mode("XENOPHARIC", 1, "MS/C2.mp3", Color3.new(0, 1, 0.5), Color3.new(0, 0, 0), true, 11, 465, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		elseif Key == "e" and MOG ~= 2 then
			New_Mode("BREAKOUT", 2, "MS/C1.mp3", Color3.new(1, 0, 1), Color3.new(0, 0, 0), true, 11, 565, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		elseif Key == "r" and MOG ~= 3 then
			New_Mode("NEUROMYTOX", 3, "MS/C3.mp3", Color3.new(0.9, 0.7, 0), Color3.new(0, 0, 0), true, 11, 565, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		elseif Key == "t" and MOG ~= 4 then
			New_Mode("VANQUISH", 4, "MS/C4.mp3", Color3.new(0.9, 0.2, 0), Color3.new(0, 0, 0), true, 11, 565, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		elseif Key == "y" and MOG ~= 5 then
			New_Mode("EXQUISITE", 5, "MS/C4.mp3", Color3.new(0, 0.7, 1), Color3.new(0, 0, 0), true, 11, 565, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		end	
	elseif Side == 3 then
		if Key == "q" and MOG ~= 1 then
			New_Mode("MAXI", 1, "MS/B6.mp3", Color3.new(0.5, 0.45, 1), Color3.new(0, 0, 0), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
		elseif Key == "r" and MOG ~= 2 then
			New_Mode("HOPE", 2, "MS/P0.mp3", Color3.new(0.666667, 1, 1), Color3.new(1, 1, 1), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
		elseif Key == "e" and MOG ~= 3 then
			New_Mode("FEFSAGED", 3, "MS/P1.mp3", Color3.new(0, 0.333333, 1), Color3.new(1, 1, 1), true, 11, 35, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
		elseif Key == "t" and MOG ~= 4 then
			New_Mode("NULL", 4, "MS/X7.mp3", Color3.new(0.141176, 0.141176, 0.141176), Color3.new(1, 1, 1), true, 11, 35, 0.75, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")
		elseif Key == "y" and MOG ~= 5 then
			New_Mode("WONDEF", 5, "MS/P2.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 11, 35, 0.75, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")	
		elseif Key == "f" and MOG ~= 6 then
			New_Mode("TERLET", 6, "MS/P3.mp3", Color3.new(1, 1, 1), Color3.new(0, 0, 0), true, 11, 35, 0.75, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")	
		elseif Key == "g" and MOG ~= 7 then
			New_Mode("EDFA", 7, "MS/P4.mp3", Color3.new(0.701961, 0, 0), Color3.new(0, 0, 0), true, 11, 35, 0.75, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "Walk")	
		end	
	end
	
	if Key == "0" then
		Sprint = true
		deltaTime = 0.25
		Tween(Humanoid, "Sine", "Out", 0.75, {WalkSpeed = RS})
	end
	
	if Key == "c" and MOG == 1 then
		--BLANK_WORLD()
	end
end)
Humanoid.Died:Connect(function()
	local old=game.Players.RespawnTime
	game.Players.RespawnTime = 40
	
	task.wait(0.01)
	game.Players.RespawnTime = old
end)

Mouse.KeyUp:Connect(function(_, Key)
	if Key == "0" then
		Sprint = false
		deltaTime=0.085
		Tween(Humanoid, "Sine", "Out", 0.15, {WalkSpeed = WS})
	end
	
	if Key == "z" then
		local hum=nil
		if collected > 21 then
			for _, x in pairs(game:GetDescendants()) do
				if x:IsA("Humanoid") and x ~= Humanoid then
					if x.RootPart then
						if (x.RootPart.Position - Pos.Position).Magnitude < 16 then
							hum=x
							break
						end
					end
				end
			end
			for i=1, math.random(5, 12) do
				if hum ~= nil	 then
					RunService.Stepped:Wait()
					local pos = cf(math.random(-15, 15), math.random(-15, 15), 2)
					local so = Instance.new("Sound", Torso)
					so.SoundId = "rbxassetid://3356359494"
					so.Volume = 1.75
					so:Play()
					so.RollOffMinDistance=30
					stopped(so)
					EffectSphere(HumanoidRootPart.CFrame * pos, 0, C1, Vector3.new(1.5, 1.5, 1.5), Vector3.new(1, 1, 1), Effects, 0.02)
					task.spawn(function()
						for i=1, 8 do
							task.wait()
							Block3D(HumanoidRootPart.CFrame * pos*angles(rad(90 + math.random(-360, 360)),0,rad(math.random(-360,360))), Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1,0.1,0.1),cf(0,0,-0.1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C1,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
							Block3D(HumanoidRootPart.CFrame * pos*angles(rad(90 + math.random(-360, 360)),0,rad(math.random(-360,360))), Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1,0.1,0.1),cf(0,0,-0.1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,Effects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
							Slash3DX(HumanoidRootPart.CFrame * pos * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(8,0.01,8),0.05,0.02,C1,Effects)
						end
					end)
					AttackBeam(HumanoidRootPart.CFrame * pos, C1, hum, HumanoidRootPart)
				end
			end
		else
			local sound = Instance.new("Sound", Player.PlayerGui)
			sound.SoundId="rbxassetid://2062123013"
			sound.Volume = 2.5
			sound:Play()
			stopped(sound)
		end
	end
end)

local combo=0
Mouse.Button1Down:Connect(function()
	MouseDown = true
	
	if Attack == false then
		combo = combo + 1
		if combo > 1 then
			combo=0
		end
	end
	if Attack == false and MoveType == "Walk" then
			COLLAPSE_exclamation_mark()
	elseif Attack == false and MoveType == "BFloat" then
		FCOLLAPSE_exclamation_mark()
	end
end)

Mouse.Button1Up:Connect(function()
	MouseDown = false
end)

Mouse.Hit:Connect(function(_, Hit)
	Pos = Hit
end)
Mouse.Target:Connect(function(_, Tar)
	Target = Tar
end)

Humanoid.MaxHealth = 10000000
Humanoid.Health = 10000000

if Character:FindFirstChild("Animate") then
	Character.Animate:Destroy()
	Humanoid:FindFirstChildOfClass("Animator"):Destroy()
end

local cf, angles, sin = CFrame.new, CFrame.Angles, math.sin

Wings.Parent = Character
Wings.PrimaryPart.Anchored=false
local CORE_Motor = Instance.new("Motor6D", Wings.PrimaryPart)
CORE_Motor.Part0 = Wings.PrimaryPart
CORE_Motor.Part1 = Torso
CORE_Motor.C0 =  cf(0,-0.85,0)*angles(math.rad(-90),0,math.rad(90))

local OG = CORE_Motor.C0
for _, x in pairs(Wings.PrimaryPart:GetChildren()) do
	if x:IsA("ManualWeld") then
		local Origin = x.C0
		local Lower = x.Name:lower()
		local GType = nil
		local Middle = false
        if string.find(Lower,"l") and Lower ~= "rl" then
			GType = "Left"
		elseif string.find(Lower,"r") or Lower == "rl" then
			GType = "Right"
		end
		if string.find(Lower,"m") then
			Middle=true
		end
		Origin = Origin * cf(0,0,0.15)
		RunService.Heartbeat:Connect(function()
		  if Type == "Flap" then
			if MoveType == "BFloat" then
				if GType == "Left" then
					if Middle == true then
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+10*sin((os.clock()+8.125)*2)),math.rad(0+35*sin(os.clock()*2)),math.rad(0+15*sin(os.clock()*2))), 0.25)
					else
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+20*sin((os.clock()+8.125)*2)),math.rad(0+35*sin(os.clock()*2)),math.rad(0+20*sin(os.clock()*2))), 0.25)
					end
				end
				if GType == "Right" then
					if Middle == true then
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+10*sin((os.clock()+8.125)*2)),math.rad(0-35*sin(os.clock()*2)),math.rad(0-15*sin(os.clock()*2))), 0.25)
					else
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+20*sin((os.clock()+8.125)*2)),math.rad(0-35*sin(os.clock()*2)),math.rad(0-20*sin(os.clock()*2))), 0.25)
					end
				end
			elseif MoveType == "Walk" then
				if GType == "Left" then
					if Middle == true then
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+2.5*sin((os.clock()+8.125)*2)),math.rad(0+15*sin(os.clock()*2)),math.rad(0+10*sin(os.clock()*2))), 0.25)
					else
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+5*sin((os.clock()+8.125)*2)),math.rad(0+15*sin(os.clock()*2)),math.rad(0+15*sin(os.clock()*2))), 0.25)
					end
				end
				if GType == "Right" then
					if Middle == true then
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+2.5*sin((os.clock()+8.125)*2)),math.rad(0-15*sin(os.clock()*2)),math.rad(0-5*sin(os.clock()*2))), 0.25)
					else
						x.C0 = x.C0:Lerp(Origin*angles(math.rad(0+5*sin((os.clock()+8.125)*2)),math.rad(0-15*sin(os.clock()*2)),math.rad(0-5*sin(os.clock()*2))), 0.25)
					end
				end
			end	
			 elseif Type == "Glitch" then
				if GType == "Left" then
					x.C0 = x.C0:Lerp(Origin * cf(0, 0, 0) * angles(rad(0), rad(0 + 5 * sin(os.clock()+6)*2), rad(0 + 999999999 * sin(os.clock()*00000000000000000000000.1))),0.05)
				end
				if GType == "Right" then
					x.C0 = x.C0:Lerp(Origin * cf(0, 0, 0) * angles(rad(0), rad(0 - 5 * sin(os.clock()+6)*2), rad(0 - 999999999 * sin(os.clock()*00000000000000000000000.1))),0.05)
				end
			 elseif Type == "Origin" then
				if GType == "Left" then
					x.C0 = x.C0:Lerp(Origin,0.25)
				end
				if GType == "Right" then
					x.C0 = x.C0:Lerp(Origin,0.25)
				end
			 elseif Type == "Start" then
				if GType == "Left" then
					x.C0 = x.C0:Lerp(Origin*angles(rad(0),rad(-45),0),0.25)
				end
				if GType == "Right" then
					x.C0 = x.C0:Lerp(Origin*angles(rad(0),rad(45),0),0.25)
				end
		  end	
		end)
	end
end
Accs = {}
for _, x in pairs(Humanoid:GetAccessories()) do
	local Handle = x.Handle
	local Mesh = Handle:FindFirstChildOfClass("SpecialMesh")
	local TextID = Mesh.TextureId
	
	local ID = Instance.new("StringValue", Handle)
	ID.Name="ID"
	ID.Value=TextID
	
	table.insert(Accs, x)
end

function rand_string(amm)
	local s = ""
	for i=1, amm do
		s = s..string.char(math.random(35,122))
	end
	return s
end

for _, x in pairs(Wings:GetDescendants()) do
	if x:IsA("BasePart") then
		local og = Instance.new("Vector3Value",x)
		og.Value=x.Size
		
	end
end




local Su={"TrafficCone"}
local P, S = Character:FindFirstChildOfClass("Pants"), Character:FindFirstChildOfClass("Shirt")
RunService.Heartbeat:Connect(function()
	script.VAR.DT.Value = deltaTime
	if control == false then
		MainTheme.Pitch = Pitch
	end
	script.VAR.S.Value = Side
	script.VAR.AttackID.Value = AttackId
	local YHeight=RootJoint.C0.Y
	local VS=HumanoidRootPart.Velocity.Y
	if Cloth_Sync == true then
		if (P and S) ~= nil then
			P.Color3 = C1
			S.Color3 = C1	
		end
		for _, x in pairs(Accs) do
			if typeof(x) == "Instance" and x.Name == "TrafficCone" then
				if x:IsA("Accessory") then
					local Mesh = x.Handle:FindFirstChildOfClass("SpecialMesh")
					Mesh.TextureId = ""
					x.Handle.Color = C1
				end
			end
		end
		
		elseif Cloth_Sync == false then
		if (P and S) ~= nil then
			P.Color3 = Color3.new(1,1,1)
			S.Color3 = Color3.new(1,1,1)
		end
		for _, x in pairs(Accs) do
			if typeof(x) == "Instance" and x.Name == "TrafficCone" then
				if x:IsA("Accessory") then
					local Mesh = x.Handle:FindFirstChildOfClass("SpecialMesh")
					Mesh.TextureId = x.Handle:FindFirstChildOfClass("StringValue").Value
					x.Handle.Color = Color3.new(0.7,0.7,0.7)
				end
			end
		end
	end
	if MOG == 1001 and Side == 1 then
		Character:FindFirstChildOfClass("Humanoid").MaxHealth = math.huge
		Character:FindFirstChildOfClass("Humanoid").Health = math.huge
	end
	if MOG == 24 and EP_Mode == false then
		New_Mode("BURNING BRAIN", 24, "MS/X6.mp3", Color3.new(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255), Color3.new(0, 0, 0), false, 155, 5555, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
		elseif MOG == 24 and EP_Mode == true then
		New_Mode("BURNING BRAIN", 24, "MS/X6.mp3", Color3.new(1,1,1), Color3.new(0, 0, 0), false, 155, 5555, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	end	
	if MOG == 12 and EP_Mode == false then
		New_Mode(math.random(100, 404).."-ERROR"..rand_string(math.random(1,7)).."FORBIDDEN", 12, "MS/X2.mp3", Color3.new(math.random(1,255)/255, 0, 0), Color3.new(math.random(1,255)/255, 0, 0), false, 70, 5200, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")		
	elseif MOG == 12 and EP_Mode == true then
		New_Mode("404-ERROR-FORBIDDEN", 12, "MS/X2.mp3", Color3.new(1, 0, 0), Color3.new(0, 0, 0), false, 70, 5200, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")		
	end
	
	if MOG == 141523 then
		New_Mode("", 141523, "MS/A1.mp3", Color3.new(math.random(1,255)/255,math.random(1,255)/255,math.random(1,255)/255), Color3.new(0, 0, 0), false, 155, 5555, 1, Enum.Font.Arcade, Font.new("rbxasset://fonts/families/PressStart2P.json", Enum.FontWeight.Heavy, Enum.FontStyle.Italic), "BFloat")
	end
	CORE_Motor.C0 = CORE_Motor.C0:Lerp(OG * cf(0+0.25*sin(os.clock()*1),0-0.25*sin(os.clock()*1.25),0),0.25)
	local sine = os.clock() 
	NameBoard.Brightness = 3.5
	NameBoard.ExtentsOffsetWorldSpace = Vector3.new(0 + 1 * math.sin((sine + 6) * 1.25), 3.5 + 0.85 * math.sin(sine * 1.25), 0)
	Name_Label.Rotation = 0 + 8.5 * math.sin((sine + 6) * 1.25)
	local Mag = HumanoidRootPart.Velocity.Magnitude
	if Attack == true then
		if AttackId == 3 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, -0.6485389471054077, 0.6804534196853638),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, 0.6485389471054077, -0.6804534196853638),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-2.4434609413146973, 6.69697328703478e-08, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackId == 4 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, -0.4891166687011719, -1.375839114189148),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, 0.4891166687011719, 1.375839114189148),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159518718719482, -1.182133436203003, -1.6104704141616821),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.0471974611282349, 4.371139183945161e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-1.3962633609771729, -1.518080772200392e-08, 3.141592502593994),0.15)
		end
		
		if AttackId == 5 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, -0.6485389471054077, 0.6804534196853638),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(0.44999998807907104, 0.5, 0)*CFrame.Angles(2.6980388164520264, 0.6485389471054077, -0.6804534196853638),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.25, -0.6499999761581421)*CFrame.Angles(-1.5707964897155762, -1.2217304706573486, -1.134464144706726),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-1.5707964897155762, 1.2217304706573486, 1.134464144706726),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-2.4434609413146973, 6.69697328703478e-08, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, 4.5, 0)*CFrame.Angles(-2.268928050994873, -5.61942812282723e-08, -3.141592502593994),0.15)
		elseif AttackId == 6 then
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-60, 60), -5, math.random(-60, 60))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,C2,NEffects)
			Slash3DX(Torso.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,C1,NEffects)
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, -0.4891166687011719, -1.375839114189148),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1.5, 0.5, 0)*CFrame.Angles(0.39786314964294434, 0.4891166687011719, 1.375839114189148),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, 0, -1)*CFrame.Angles(-3.1415927410125732, -1.396263599395752, -2.7052602767944336),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.2217305898666382, 0, 3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, 4.5, 0)*CFrame.Angles(-1.3962632417678833, -1.5180820156501795e-08, -3.141592502593994),0.15)
		elseif AttackId == 7 then
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-0.44999998807907104, 0.5, -0.5)*CFrame.Angles(2.4434609413146973, 1.1566949353891687e-07, 0.9599313735961914),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0.5, 1)*CFrame.Angles(-0, 1.2217307090759277, 2.181661367416382),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.3962633609771729, 1.518080772200392e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackId == 8 then
			EffectSphere(Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,C1,Vector3.new(0.75, 0.75, 8), Vector3.new(0.15, 0.15, 0.5),NEffects,0.01)
			Slash3DX(HumanoidRootPart.CFrame * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),nil,nil,nil,Vector3.new(0.01,0.01,0.01),Vector3.new(170,0.01,170),0.15,0.06,C1,NEffects)
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C2,Color3.new(0, 0, 0),nil,1,math.random(0.5,3))
			Block3D(HumanoidRootPart.CFrame * cf(math.random(-25, 25), -5, math.random(-25, 25))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.1,0.1,0.1),cf(0,0,-1)*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,Color3.new(0,0,0),nil,1,math.random(0.5,3))
			LeftShoulder.C0=LeftShoulder.C0:Lerp(CFrame.new(-1, 0, 0)*CFrame.Angles(-1.5707963705062866, -1.0471975803375244, -2.4434609413146973),0.15) RightShoulder.C0=RightShoulder.C0:Lerp(CFrame.new(1, 0.5, -1)*CFrame.Angles(-1.125640630722046, 1.182133436203003, 3.0146520137786865),0.15) LeftHip.C0=LeftHip.C0:Lerp(CFrame.new(-1, -0.5, -0.5)*CFrame.Angles(-0.3390372395515442, -1.021454930305481, -0.7284930944442749),0.15) RightHip.C0=RightHip.C0:Lerp(CFrame.new(1, -1, -0.6499999761581421)*CFrame.Angles(-2.0159521102905273, 1.1821333169937134, 1.6104706525802612),0.15) Neck.C0=Neck.C0:Lerp(CFrame.new(0, 1, 0)*CFrame.Angles(-1.2217304706573486, 2.9900348863520776e-08, -3.141592502593994),0.15) RootJoint.C0=RootJoint.C0:Lerp(CFrame.new(0, -0.5, 0)*CFrame.Angles(-2.0071287155151367, -3.6946460113540525e-08, -3.141592502593994),0.15)
		elseif AttackId == 9 then
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
   if Side == 1 and Attack == false and VS < 1.5 and VS > -1.5 then
	if MOG == 2 then
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(275,0.0001,275), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(175,0.0001,175), 0.1, 0.04, C1)
	end
	if MOG == 3 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-150, 150), -4, math.random(-150, 150)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), NEffects, 0.035)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(265,0.0001,265), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(205,0.0001,205), 0.1, 0.04, C1)
	end
	if MOG == 24 then
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,C1,nil,1,math.random(0.25,1))
		Block3D(HumanoidRootPart.CFrame * cf(math.random(-35, 35), -3.5, math.random(-35, 35))*angles(rad(90 + math.random(-34, 34)),0,rad(math.random(-45,45))), Vector3.new(0.35, 0.35, 0.35), Vector3.new(0.01,0.01,0.01),cf(0,0,-math.random(0.8,1))*angles(rad(1),rad(-1),rad(1)),Enum.Material.Neon,NEffects,C1,C1,nil,1,math.random(0.25,1))
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(400,0.0001,400), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(200,0.0001,200), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(100,0.0001,100), 0.1, 0.04, C1)
	end
	if MOG == 5.1 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-15,15), -4, math.random(-15, 15)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), NEffects, 0.035)
	end
	if MOG == 6 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-45,45), -4, math.random(-45, 45)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), NEffects, 0.055)
	end
	if MOG == 11 then
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(100,0.0001,100), 0.1, 0.04, C1)
	end
	if MOG == 1001 then
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-145,145), -4, math.random(-145, 145)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.1, 0.04, C1)
		EffectSphere(HumanoidRootPart.CFrame * CFrame.new(math.random(-145,145), -4, math.random(-145, 145)) * CFrame.Angles(math.rad(90+math.random(-15, 15)),0,0), 0.95, C1, Vector3.new(0.25, 0.25, 3), Vector3.new(0.25, 0.25, 3), Effects, 0.055)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(365,0.0001,365), 0.1, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(1365,0.0001,1365), 0.125, 0.04, C1)
		Slash2DX(HumanoidRootPart, -100, Vector3.new(math.random(-0.2,0.2),math.random(-0.2,0.2),math.random(-0.2,0.2)), math.random(-360,360), Vector3.new(0.01,0.0001,0.01), Vector3.new(1305,0.0001,1305), 0.125, 0.04, C1)
	end
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
		if Mag < 0.35 and MOG == 24 then
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-2.007128639793479-0.08726646259971647*sin((sine+1.5)*2),0.05235987755982989*sin(sine*1000),3.490658503988659+0.06981317007977318*sin(sine*1)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.3*sin((sine+1.5)*2),0)*angles(-0.7853981633974483+0.17453292519943295*sin(sine*1000),1.1519173063162575-0.17453292519943295*sin((sine+2.25)*2),1.0471975511965976),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.8,0)*angles(0.7853981633974483-0.08726646259971647*sin((sine+1.5)*2),-2.007128639793479-0.05235987755982989*sin(sine*1000),-1.5707963267948966),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1.2,0.2 * sin((sine+1)*2),-0.5)*angles(0.17453292519943295*sin(sine*2),-1.0471975511965976+0.17453292519943295*sin(sine*1000),0),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(1 * sin(sine*1),4+1*sin((sine+0.75)*2),0.7 * sin(sine*2))*angles(-1.8325957145940461+0.08726646259971647*sin(sine*2),0.08726646259971647*sin(sine*1000),2.530727415391778+0.1308996938995747*sin(sine*1)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.8+0.15*sin((sine+1)*2),-0.2)*angles(-1.1344640137963142+0.17453292519943295*sin(sine*2),1.1344640137963142+0.08726646259971647*sin(sine*1000),0.7853981633974483),deltaTime) 
		end
		if Mag < 0.35 and MOG == 25 then
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,0.175 * sin((sine+0.5)*2),-0.25)*angles(-0.5235987755982988,-1.0471975511965976+0.08726646259971647*sin(sine*-100),-0.6108652381980153+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-0.6981317007977318+0.17453292519943295*sin((sine+0.5)*-2),1.0471975511965976+0.17453292519943295*sin((sine+0.5)*2),0.6108652381980153+0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,1+0.25*sin(sine*2),0)*angles(3.490658503988659,2.0943951023931953,-0.3490658503988659+0.08726646259971647*sin((sine-0.25)*-2)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,-0.125+0.175*sin((sine+0.5)*2),0)*angles(-0.17453292519943295,-2.443460952792061,-2.6179938779914944),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295+0.08726646259971647*sin(sine*2),-0.08726646259971647+0.06981317007977318*sin(sine*2),-2.356194490192345+0.08726646259971647*sin((sine+0.5)*60)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+0.5*sin(sine*2),0)*angles(-1.8762289458939043+0.05235987755982989*sin((sine+0.5)*-2),-0.08726646259971647+0.12217304763960307*sin(sine*100),2.2689280275926285+0.13962634015954636*sin((sine+0.2)*70)),deltaTime) 
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
	if Mag < 0.35 and MOG == 1000 then -- Now It's a real thing!
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.9,0.6,0)*angles(0,2.443460952792061-0.17453292519943295*sin(sine*1000),2.2689280275926285+0.08726646259971647*sin(sine*1000)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1,-0.5,-1)*angles(-0.9599310885968813,1.3089969389957472,0.6108652381980153),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.5,-1)*angles(-0.9599310885968813,-1.3089969389957472,-0.6108652381980153),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625+0.05235987755982989*sin(sine*1000),0,3.141592653589793),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.9,0.6,0)*angles(0,-2.443460952792061+0.17453292519943295*sin(sine*1000),-2.2689280275926285-0.08726646259971647*sin(sine*1000)),deltaTime) 
		RootJoint.C0=RootJoint.C0:Lerp(cf(1 * sin((sine+2)*100),550+1*sin(sine*100),0)*angles(-2.356194490192345-0.3490658503988659*sin((sine+50)*100),0,3.141592653589793),deltaTime) 
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
	if Mag < 0.35 and MOG == 14 then
		RootJoint.C0=RootJoint.C0:Lerp(cf(0.25 * sin(sine*2),9+0.5*sin((sine - 0.5)*2),0.25 * sin((sine+0.75)*-2))*angles(0.3490658503988659+0.10471975511965978*sin(sine*2),1.9198621771937625+0.20943951023931956*sin((sine+0.5)*-2),-3.7524578917878086+0.08726646259971647*sin(sine*2)),deltaTime) 
		RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin(sine*2),-1.1,0.2 * sin((sine+0.9)*2))*angles(-2.2689280275926285+0.10471975511965978*sin((sine-0.25)*-2),1.0471975511965976+0.2181661564992912*sin(sine*-2),1.2217304763960306+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
		LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5+0.1*sin((sine + 0.5)*2))*angles(-0.9599310885968813+0.2617993877991494*sin((sine+0.5)*-2),-1.2217304763960306+0.1308996938995747*sin((sine+0.75)*2),-0.6981317007977318),deltaTime) 
		RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0.25)*angles(-1.6580627893946132,1.0471975511965976,0.5235987755982988),deltaTime) 
		LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.9,0.1)*angles(-1.5707963267948966,-0.6981317007977318,1.7453292519943295),deltaTime) 
		Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.08726646259971647*sin((sine+0.325)*-2),0,1.9198621771937625+0.08726646259971647*sin(sine*-2)),deltaTime) 
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
  end	 

 end	
	script.VAR.Attack.Value = Attack 	script.VAR.MoveT.Value = MoveType
	
	
	if Side == 2 and Attack == false and VS < 1.5 and VS > -1.5 then
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
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.15 * sin((sine+14)*1.215),4.75+0.45*sin(sine*1.215),0.15 * sin((sine-14)*1.215))*angles(-1.2217304763960306+0.09861110273767963*sin((sine+2.5)*1.215),0,3.141592653589793),deltaTime) 
			--MW_animatorProgressSave: RightLeg,1,0,0,1,-20,15,0,1.215,0,-0.254,8,1.215,60,0,0,1,-0.75,-0.15,4,1.215,20,0,0,1,LeftArm,-1,0,0,1,-15,0,0,1,0.5,-0.254,8.5,1.215,-180,0,0,1,0,0,0,1,-90,0,0,1,RightArm,1,0,0,1,20,0,0,1,0.15,-0.254,8,1.215,170,0,0,1,-0.45,0,0,1,80,10,6,1.215,LeftLeg,-1,0,0,1,-60,-8.5,2.5,1.215,-1,0,0,1,-60,10,2.5,1.215,0,0,0,1,-20,0,0,1,Head,0,0,0,1,-115,-5.65,2.5,1.215,1,0,0,1,0,7.5,8,1.215,0,0,0,1,180,0,0,1,Torso,0,0.15,14,1.215,-70,5.65,2.5,1.215,4.75,0.45,0,1.215,0,0,0,1,0,0.15,-14,1.215,180,0,0,1
		end
	end
	
	if Side == 3 and Attack == false and VS < 1.5 and VS > -1.5 then
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
end)


OCM.Parent = Player.PlayerGui
