# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "cargo2nix-unstable-test/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
  ignoreLockHash,
}:
let
  nixifiedLockHash = "ebdd5ebec16df1ec7ee383216c2835163f6af39e10635d9f36499dba6dd5c73a";
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
  currentLockHash = builtins.hashFile "sha256" (workspaceSrc + /Cargo.lock);
  lockHashIgnored = if ignoreLockHash
                  then builtins.trace "Ignoring lock hash" ignoreLockHash
                  else ignoreLockHash;
in if !lockHashIgnored && (nixifiedLockHash != currentLockHash) then
  throw ("Cargo.nix ${nixifiedLockHash} is out of sync with Cargo.lock ${currentLockHash}")
else let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    cargo2nix-unstable-test = rustPackages.unknown.cargo2nix-unstable-test."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"; };
  });
  
  "unknown".cargo2nix-unstable-test."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "cargo2nix-unstable-test";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      openssl_sys = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.77" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cc."1.0.74" = overridableMkRustCrate (profileName: rec {
    name = "cc";
    version = "1.0.74";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "581f5dba903aac52ea3feb5ec4810848460ee833876f1f9b0fdeab1f19091574"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.137" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.137";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "fc7fcc620a3bff7cdd7a365be3376c97191aeaccc2a603e600951e452615bf89"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.77" = overridableMkRustCrate (profileName: rec {
    name = "openssl-sys";
    version = "0.9.77";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b03b84c3b2d099b81f0953422b4d4ad58761589d0229b5506356afca05a3670a"; };
    dependencies = {
      libc = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.137" { inherit profileName; }).out;
    };
    buildDependencies = {
      autocfg = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" { profileName = "__noProfile"; }).out;
      cc = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".cc."1.0.74" { profileName = "__noProfile"; }).out;
      pkg_config = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.26" { profileName = "__noProfile"; }).out;
      ${ if hostPlatform.parsed.abi.name == "msvc" then "vcpkg" else null } = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.15" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.26" = overridableMkRustCrate (profileName: rec {
    name = "pkg-config";
    version = "0.3.26";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.15" = overridableMkRustCrate (profileName: rec {
    name = "vcpkg";
    version = "0.2.15";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"; };
  });
  
}
