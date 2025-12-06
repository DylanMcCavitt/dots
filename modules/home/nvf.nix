# modules/home/nvf.nix
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    enableManpages = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "nord";
      };

      git = {
        enable = true;
        gitsigns = {
          enable = true;
          codeActions.enable = true;
        };
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
      };

      statusline.lualine = {
        theme = "nord";
        enable = true;
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        expandtab = true;
        autoindent = true;
      };

      debugger.nvim-dap = {
        enable = true;
      };

      tabline.nvimBufferline.enable = true;
      ui.noice.enable = true;

      filetree.neo-tree.enable = true;
      telescope.enable = true;

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      comments.comment-nvim.enable = true;
      autopairs.nvim-autopairs.enable = true;
      mini.surround.enable = true;
      visuals."rainbow-delimiters".enable = true;
      globals.mapleader = " ";
      binds.whichKey.enable = true;

      keymaps = [
        {
          mode = ["n"];
          key = "<leader>";
          action = "<cmd>WhichKey<CR>";
          silent = true;
          desc = "Show which-key menu";
        }
        {
          mode = ["n"];
          key = "<leader>ff";
          action = "<cmd>Telescope find_files<CR>";
          desc = "Find files";
        }
        {
          mode = ["n"];
          key = "<leader>e";
          action = "<cmd>Neotree toggle reveal left<CR>";
          desc = "Toggle file tree";
        }
        {
          mode = ["n"];
          key = "<leader>fg";
          action = "<cmd>Telescope live_grep<CR>";
          desc = "Search in project";
        }
        {
          mode = ["n"];
          key = "<leader>wq";
          action = ":wq";
          desc = "Save and quit";
        }
        {
          mode = ["n"];
          key = "<leader>w";
          action = ":w";
          desc = "Save file";
        }
        {
          mode = ["n"];
          key = "<leader>xx";
          action = "<cmd>Trouble diagnostics toggle<CR>";
          desc = "Toggle Trouble (Errors)";
        }
      ];

      languages = {
        nix = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };
        rust = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };

        css = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };

        astro = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          format.type = "prettier";
        };

        ts = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          format.type = "prettier";
        };

        go = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };
      };
    };
  };
}
