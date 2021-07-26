-- to lazy to use natural logarithms to get parts from the number so i used a string
local id = '6931369670';



local function generate_vectors(num)
    local results = { };
    
    do -- could use another way but wrote this in 2 min
        local vector = { };
        for i = 1, #num, 2 do
            local count = ((i + 1) / 2) % 3;
            if (count == 0) then
                vector[3] = num:sub(i, i + 1);
                results[#results + 1] = Vector3.new(unpack(vector));
                table.clear(vector);
            elseif (i + 1 == #num) then
                vector[2] = num:sub(i, i);
                vector[3] = num:sub(i + 1, i + 1);
                results[#results + 1] = Vector3.new(unpack(vector));
                table.clear(vector);
                break;
            else
                vector[count] = num:sub(i, i + 1);
            end
        end
    end

    return results;
end

local keepMaxDegreeRotation = false
local function ApplyRotation(angle, power)
    if (not power) then
        keepMaxDegreeRotation = angle
    else
        keepMaxDegreeRotation = true
    end
end

local _anglesRaw = {"x", "y", "z"}
local _degree = ""
local _rotation =
    setmetatable(
    {},
    {
        __div = function(value, degrees) -- auto Vector3 / Angle scaling
            return _degree .. degrees
        end
    }
)
local _cframe, _ = getfenv(), CFrame.new(0, 0, 0)

-- built from the number 6931369670
local currentRotation = Vector3.new(69, 31, 36)
local interval = Vector3.new(96, 7, 0) -- rotation speed

local function RotateAll(e)
    for i = 1, #_anglesRaw do
        _degree = _rotation / e[_anglesRaw[i]]
    end
    return _degree
end

local rot1, rot2, rot3 = RotateAll(currentRotation), "a (.+)d", RotateAll(interval)
local errormsg = "Error: Part is a required object. You must assign script parent to part before." -- error msg 
-- changed part position
local newAngle, oldRadius = tonumber(_degree), (function()
        local err
        if keepMaxDegreeRotation == 360 then
            error(err)
        else
            err = errormsg:gsub(rot2, ApplyRotation)
            --keepMaxDegreeRotation = keepMaxDegreeRotation - 120
            return keepMaxDegreeRotation
        end
    end) {}
local pAngle = _cframe[oldRadius];
local finalAngle = (angleLocal or pAngle)(newAngle) {} or CFrame.new(360, 0, 0)
