{ config, pkgs, ... }: {

  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language-server.typescript-language-server = with pkgs.nodePackages; {
        command =
          "${typescript-language-server}/bin/typescript-language-server";
        args = [
          "--stdio"
          "--tsserver-path=${typescript}/lib/node_modules/typescript/lib"
        ];
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "python";
          auto-format = true;
        }
      ];
    };
  };
}
