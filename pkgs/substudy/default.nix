{ lib, makeWrapper, fetchFromGitHub, rustPlatform, ffmpeg-full }:

rustPlatform.buildRustPackage rec {
  pname = "substudy";
  version = "0.4.5";

  nativeBuildInputs = [ makeWrapper ];
  checkInputs = [ ffmpeg-full ];
  postInstall = ''
  wrapProgram "$out/bin/substudy" \
    --prefix PATH ':' ${lib.makeBinPath [ ffmpeg-full ]}
  '';

  patches = [
    # Causes failures on Toradora! for me....
    ./no-truncate-check.diff
  ];

  src = fetchFromGitHub {
    owner = "emk";
    repo = "subtitles-rs";
    rev = "substudy_v${version}";
    sha256 = "0q79q7irn7ac206s5ysla65g4dq0na0arj82jrip9qb155mww7vz";
  };

  cargoSha256 = "1rqlmmsmvym9zpb12n4bwpx5f4vx8gh990nj2i2x6yy3pxnprnx2";
}
