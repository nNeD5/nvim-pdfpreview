M = {}

local function change_prefix()
    local file_name = vim.fn.expand('%')
    return ((file_name:match"([^.]*)") .. ".pdf")
end

local function pdf_preview()
    local file_name = change_prefix()
    local command =  PDF_VIWER .. " " .. COMMANDLINE_ARGUMENTS .. " " .. file_name .. " &"
    print(command)
    local status, err = pcall(os.execute, command)
    print(err)
end

function M.start(pdf_viewer, commandline_arguments)
    PDF_VIWER = pdf_viewer
    COMMANDLINE_ARGUMENTS = commandline_arguments
    pdf_preview()
end

return M
