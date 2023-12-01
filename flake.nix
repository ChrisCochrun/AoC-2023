{
  description = "Advent of Code";
  # This flake will setup a lisp and rust environment to try AoC in both languages
  inputs = {
    # cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nixpkgs.follows = "cargo2nix/nixpkgs";
  };

  outputs = inputs: with inputs;
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in rec
        {
          devShell = pkgs.mkShell {
            name = "aoc";
            
            nativeBuildInputs = with pkgs; [
              gcc
            ];

            buildInputs = with pkgs; [
              stdenv
              gnumake
              pkg-config

              # Lisp
              sbcl
              
              # Rust
              clippy
              rustc
              cargo
              rustfmt
              rust-analyzer
            ];

            RUST_BACKTRACE = "full";
            CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG = true;
          };
        }
      );
}
