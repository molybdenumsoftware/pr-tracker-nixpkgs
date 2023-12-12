{
  # 1. Defined a "systems" inputs that maps to only ["x86_64-linux"]
  inputs.systems.url = "github:nix-systems/x86_64-linux";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  # 2. Override the flake-utils default to your version
  inputs.flake-utils.inputs.systems.follows = "systems";

  outputs = { self, flake-utils, ... }:
    # Now eachDefaultSystem is only using ["x86_64-linux"], but this list can also
    # further be changed by users of your flake.
    flake-utils.lib.eachDefaultSystem (system: {
      # ...
    });
}
