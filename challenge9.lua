function you_cant_call_me()
      return print
end 
-- table.foreach could be used aswell
for _ in you_cant_call_me do _('Hello World') break end
