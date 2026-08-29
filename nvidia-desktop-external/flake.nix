{
  inputs.nix-software-center.url = "github:snowfallorg/nix-software-center";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  outputs = { self, nixpkgs, nix-software-center }@inputs : {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.danu-nixos-desktop = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
      specialArgs = {
        # Make flake inputs available in NixOS modules.
        inherit inputs;
      };
    };
  };
}
