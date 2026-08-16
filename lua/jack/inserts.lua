
vim.cmd([[
function! ClientLetter() abort
  let name = input('Client name: ')
  return "Dear " . name . ",\r\r"
        \ . "Thank you for choosing to work with " . name . ". "
        \ . "We at Acme Corp look forward to supporting " . name . "'s goals..."
endfunction

iabbrev <expr> clientletter ClientLetter()
]])
