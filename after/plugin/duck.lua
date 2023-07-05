function RandomDuck()
	-- random chance on save for you to get raided, because I love myself :)
	if math.random() <= 1 / 100 then
		for _ = 1, 5 do
			require("duck").hatch("🖕", 8)
		end
	end
end

vim.cmd([[
augroup duck_on_save
  autocmd!
  autocmd BufWritePre * lua RandomDuck()
augroup end
]])
