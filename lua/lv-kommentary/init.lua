local K = {}

K.config = function()
    vim.g.kommentary_create_default_mappings = false

    require('kommentary.config').configure_language("default", {})

    require('kommentary.config').configure_language("lua", {
        prefer_single_line_comments = true
    })

    require('kommentary.config').configure_language("hcl", {
        prefer_single_line_comments = true,
        single_line_comment_string = "#"
    })

    require('kommentary.config').configure_language("tf", {
        prefer_single_line_comments = true,
        single_line_comment_string = "#"
    })
end

return K
