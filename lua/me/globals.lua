function _G.safe_require(s)
  local status_ok, needed = pcall(require, s)
  if not status_ok then
    -- print(string.format("%s could not be loaded.", needed))
    -- return status_ok
    return
  end
  return needed
end
