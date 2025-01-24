{
  description = "aeonian-static";
  outputs = {nixpkgs, ...}: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in {
    devShells."x86_64-linux".default = pkgs.mkShell {
      system = "x86_64-linux";
      packages = with pkgs; [
        bun
        tailwindcss
      ];
      shellHook = ''
        echo "bun v$(bun --version)"
        tailwindcss --help | grep 'tailwindcss v'
        kitty bash -c 'bun --hot run index.ts' &
        kitty bash -c 'tailwindcss --input public_html/tailwind-input.css --output public_html/style.css --watch' &
        sleep 1
        xdg-open "http://localhost:3000"
      '';
    };
  };
}
