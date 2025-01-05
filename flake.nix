{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.x86_64-linux = rec {
      # nvim = pkgs.writeShellScriptBin "nv" ''
      #   ${pkgs.neovim}/bin/nvim -u "${self}/init.lua" $@
      # '';

      nvim = pkgs.writeShellScriptBin "nv" ''
        ${pkgs.neovim}/bin/nvim -u "${self}/init.lua" $@
      '';
      default = nvim;
    };

  };
}
