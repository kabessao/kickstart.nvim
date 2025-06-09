{pkgs ? import <nixpkgs> {}, ... }:
let
	version = "1.18.38";
in
	pkgs.fetchurl {
		url = "http://projectlombok.org/downloads/lombok-${version}.jar";
		hash = "sha256-Hh5CfDb/Y8RP0w7yktnnc+oxVEYKtiZdP+1+b1vFD7k=";
	}
