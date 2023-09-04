vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
  end,
})

-- vim.api.nvim_create_autocmd({ "BufRead" }, {
--  callback = function()
-- local line = vim.api.nvim_get_current_line()
-- vim.notify(line)
-- -- local endOfLine = line:sub(-2)
-- crlf_match = line:match('\r\n$')
-- -- vim.notify(endOfLine)
--
-- if crlf_match then
--      vim.notify("crlf match")
--     vim.opt.ff = "dos"
-- end
--  end
-- })

return {}
