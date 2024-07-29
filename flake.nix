{
  description = "Papis.nvim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }: let
    name = "papis.nvim";

    plugin-overlay = import ./nix/plugin-overlay.nix {
      inherit name self;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem = {
        config,
        self',
        inputs',
        system,
        ...
      }: let
        ci-overlay = import ./nix/ci-overlay.nix {
          inherit self name;
        };

        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            plugin-overlay
            ci-overlay
          ];
        };

        devShell = pkgs.mkShell {
          buildInputs = let
            nvim-test = pkgs.writeShellApplication {
              name = "nvim-test";
              text = let
                test-lib-dir = "~/.cache/papis_test_library";
              in
                # bash
                ''
                  ${pkgs.coreutils}/bin/rm -rf ${test-lib-dir}
                  ${pkgs.coreutils}/bin/cp -r -r ./tests/files/library ${test-lib-dir}
                  ${pkgs.neovim-with-plugin}/bin/nvim -c "lua _Load_papis()" -c "e test.md"
                '';
            };
          in [
            pkgs.sqlitebrowser
            pkgs.yq-go
            pkgs.luajit
            nvim-test
          ];
        };
      in {
        devShells = {
          default = devShell;
          inherit devShell;
        };

        packages = rec {
          default = papis-nvim;
          inherit (pkgs.luajitPackages) papis-nvim;
          inherit (pkgs) neovim-with-plugin;
        };
      };
      flake = {
        overlays.default = plugin-overlay;
      };
    };
}
