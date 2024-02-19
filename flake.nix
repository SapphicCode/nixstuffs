{
  description = "Cassandra's everything flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: {
    formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixpkgs-fmt;
    homeConfigurations = {
      "sapphiccode@Maeve" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        modules = [./home-manager/host/Maeve.nix];
      };
      "sapphiccode@Beauvoir" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        modules = [./home-manager/host/Beauvoir.nix];
      };
      "sapphiccode@pandora" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./home-manager/host/pandora.nix];
      };
      "sapphiccode@hollydeck" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./home-manager/host/hollydeck_bazzite.nix];
      };
      "deck@hollydeck" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./home-manager/host/hollydeck_steamos.nix];
      };
      "generic-server-arm64" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";
        modules = [./home-manager/host/generic-server.nix];
      };
      "generic-server-amd64" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./home-manager/host/generic-server.nix];
      };
    };
  };
}
