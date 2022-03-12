{
  description = ''A simple docx reader.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-docx-v0_1_8.flake = false;
  inputs.src-docx-v0_1_8.owner = "xflywind";
  inputs.src-docx-v0_1_8.ref   = "refs/tags/v0.1.8";
  inputs.src-docx-v0_1_8.repo  = "docx";
  inputs.src-docx-v0_1_8.type  = "github";
  
  inputs."zip".owner = "nim-nix-pkgs";
  inputs."zip".ref   = "master";
  inputs."zip".repo  = "zip";
  inputs."zip".type  = "github";
  inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-docx-v0_1_8"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-docx-v0_1_8";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}