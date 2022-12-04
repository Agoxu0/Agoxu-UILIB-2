Hello! some days ago i made UI Library that looked like wally's, I learned more about making Ui Library's and also i had some time so i made another UI Library!
And yes, if you think i should add something message me on discord: Agoxu2.0#6852

Library
```lua
:CreateWindow(Name) -- Makes The Window
:CreateTab(Name,ID) -- Makes the Tab (ID not required)
:CreateButton(Name,function) --Makes Button
:CreateToggle(Name,function(bool)) --Makes Toggle
:CreateSlider(Name,min,max,function(value)) -- Makes Slider
:CreateLabel(Name) --Makes Label
```

Quick Example How To Use It.
```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Agoxu0/Agoxu-UILIB-2/main/Main.lua"))() -- Gets the library
local window = library:CreateWindow("The Title!") -- Creates the window
local main = window:CreateTab("The Tab!")
main:CreateButton("Button!",function() -- Creates the button
    print("Pressed!")
end)
main:CreateSlider(
  "The Slider!", -- Name
  0, -- Min value
  100, -- Max Value
  function(value) -- The Function
    print(value)
  end
)
main:CreateToggle("Toggle!",function(bool) -- Creates the toggle
    print(bool)
end)
main:CreateLabel("Label!") -- Creates the label
```
This is how it looks like

![image](https://raw.githubusercontent.com/Agoxu0/Agoxu-UILIB-2/main/Images/image_2022-12-04_120832702.png)
