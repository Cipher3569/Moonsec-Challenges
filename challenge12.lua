debug, io, os, getfenv, package, _G, table, module = nil
require, load, loadstring, loadfile, dofile, coroutine = nil 

local t = {{}}; 


--------------------SOLUTION --------------------
setmetatable(t, { __mode = 'v' }); -- make the table weak
collectgarbage();  -- run a cycle where t[1] is a weak reference loses and becomes nil
do -- create a new static scope.
    local temp = newproxy(true); -- create a new userdata with empty metatable
    getmetatable(temp).__gc = function() -- finalizers in lua are only avaible on userdatas
        t[2] = 0; -- set t[2] to 0 upon temp's destruction ( passes the assertation check )
    end
    t[2] = collectgarbage; -- this is the tricky part, so calling this will sweep anything that is marked, also cant setfenv since is c, and one of our dead nodes currently is temp. (marked by lua's garbage collection as a dead node)
end -- in end of scope temp will lose its weak reference (if there is no strong ref anymore to temp, lua will mark it as collectable)
---------------------------------------- 

t = t; 

setmetatable(t, {}) 

assert(not t[1] and #t == 0)
assert(t[2] and type(t[2]) == 'function' and not pcall(setfenv, t[2], {})) 

t[2]() 

assert(t[2] == 0) 

print("Challenge completed!")
