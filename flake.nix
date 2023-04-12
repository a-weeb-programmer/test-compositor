{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {

      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gnumake
          wlroots
          wayland
          mesa
          libdrm
          libinput
          clang
          man-pages
        ];
        shellHook = ''
          ln -s ${pkgs.wlroots} ./wlroots
          ln -s ${pkgs.wayland.dev} ./wayland
        '';
      };
    };
}
