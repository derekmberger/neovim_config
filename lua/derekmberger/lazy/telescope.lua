return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "cappyzawa/telescope-terraform.nvim",
  },

  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      extensions = {
        terraform = {
          -- you can tweak default args here, for example:
          -- command = { "terraform", "plan", "-no-color" },
        },
      },
    })
    telescope.load_extension("terraform")

    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand('<cWORD>')
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>ptf', function()
      telescope.extensions.terraform.commands({ command = "fmt" })
    end, { desc = "Terraform: fmt" })
    vim.keymap.set('n', '<leader>ptv', function()
      telescope.extensions.terraform.commands({ command = "validate" })
    end, { desc = "Terraform: validate" })
  end,
}
