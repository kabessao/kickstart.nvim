{pkgs ? import <nixpkgs> {}, ...}:

pkgs.vscode-utils.buildVscodeMarketplaceExtension {
	mktplcRef = {
		publisher = "yaozheng";
		name = "vscode-pde";
		version = "0.11.1";
		hash = "sha256-CAllsD/jwG/Noobb1upb6c6XWSd/uGK1U5dyxCiFCsE=";
	};
}
