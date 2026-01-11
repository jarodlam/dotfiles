{
  description = "Generic Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      homeConfiguration = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # The path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    in
    {
      # A default Home Manager configuration that can be used by any user.
      # Activate with: `home-manager switch --flake .#default`
      # Or simply `home-manager switch` if no other user is defined.
      packages.homeConfigurations.default = homeConfiguration;
      });
}
