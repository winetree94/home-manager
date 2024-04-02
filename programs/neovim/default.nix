{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    fzf
    cargo
    lunarvim
    ripgrep
    lazygit
    gdu
    bottom
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      # nvim-lspconfig
      # nvim-treesitter.withAllGrammars
      # plenary-nvim
      # gruvbox-material
      # mini-nvim
      # (fromGitHub "HEAD" "elihunter173/dirbuf.nvim")
      # (fromGitHub {
      #   repo = "winetree94/nvim";
      #   ref = "main";
      # })
    ];
  };
}
