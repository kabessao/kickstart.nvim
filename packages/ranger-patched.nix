{pkgs ? import <nixpkgs> {}, ... }:

pkgs.vimPlugins.ranger-nvim.overrideAttrs {
  postInstall = ''
    ${pkgs.gnused}/bin/sed -i '136d' $out/lua/ranger-nvim.lua
  '';
}

