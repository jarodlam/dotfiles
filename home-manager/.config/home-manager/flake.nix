{
  description = "Generic Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

        homeConfiguration = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # The path to your home.nix.
          modules = [
            ./home.nix
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = {
            inherit pkgs-unstable;
          };
        };
      in
      {
        # A default Home Manager configuration that can be used by any user.
        # Activate with: `home-manager switch --flake .#default`
        # Or simply `home-manager switch` if no other user is defined.
        packages.homeConfigurations.default = homeConfiguration;
      }
    );
}
