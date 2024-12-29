local toggleFunction = function()
  if not vim.g.toggleState then
    vim.cmd('resize')
    vim.cmd('vertical resize')
    vim.g.toggleState = true
  else
    vim.cmd('wincmd =')
    vim.g.toggleState = false
  end
end

return toggleFunction
