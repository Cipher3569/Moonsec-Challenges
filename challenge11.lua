local assert = assert
local print = print 

local status, error = pcall(function() 

    local assert, print;
    setfenv(1, {  });
            
    ----------------------------------------
    -- not rly mine since its just a lua bug
    x = true;
    (x and x or global)();
    ---------------------------------------- 

    return;
        
end) 

assert(not status)
assert(error:match([[%[string "<eval>"%]:%d+: attempt to call global 'global' %(a boolean value%)]]) == error) 

print("Completed challenge!"
