io, load, loadstring, os, dofile = nil;
for i, v in ipairs({1, 2, 3, 4}) do
  print(i, v);
  i, v = nil;
  ------------------------
  -- explaination : since in stateful iterators leave their state on the stack, lua's symbol table give each of them a special symbol like (for control) (for state) etc, we can determine our current state and change it into a different one, lua will keep calling inext with the same state and nothing will actually ruin.
  if (select(2, debug.getlocal(1, 3) == 2) then
    debug.setlocal(1, 3, 3);
  end
  ------------------------
end
