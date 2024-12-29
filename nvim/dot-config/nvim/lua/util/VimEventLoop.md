> vim
    BufWinEnter     (create a default window)
    BufEnter        (create a default buffer)
    VimEnter        (start the Vim session):edit example.txt
    BufNew          (create a new buffer to contain demo.txt)
    BufAdd          (add that new buffer to the session's buffer list)
    BufLeave        (exit the default buffer)
    BufWinLeave     (exit the default window)
    BufUnload       (remove the default buffer from the buffer list)
    BufDelete       (deallocate the default buffer)
    BufReadCmd      (read the contexts of demo.txt into the new buffer)
    BufEnter        (activate the new buffer)
    BufWinEnter     (activate the new buffer's window)i
    InsertEnter     (swap into Insert mode)
Hello
    CursorMovedI    (insert a character)
    CursorMovedI    (insert a character)
    CursorMovedI    (insert a character)
    CursorMovedI    (insert a character)
    CursorMovedI    (insert a character)<ESC>
    InsertLeave     (swap back to Normal mode):wq
    BufWriteCmd     (save the buffer contents back to disk)
    BufWinLeave     (exit the buffer's window)
    BufUnload       (remove the buffer from the buffer list)
    VimLeavePre     (get ready to quit Vim)
    VimLeave        (quit Vim)
