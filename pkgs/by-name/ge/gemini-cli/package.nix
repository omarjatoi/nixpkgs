{
  lib,
  buildNpmPackage,
  fetchzip,
  nodejs_20,
}:

buildNpmPackage rec {
  pname = "gemini-cli";
  version = "0.1.4";

  nodejs = nodejs_20;

  src = fetchzip {
    url = "https://registry.npmjs.org/@google/gemini-cli/-/gemini-cli-${version}.tgz";
    hash = "sha256-2kwYdYhaMKb2wPWubDPQlJKDxvEq7/1JvLki+fNVKGc=";
  };

  npmDepsHash = "sha256-WJB+3iK3awZb01Ek4nOZtSCLmM8jVSPrC9bfawI1edI=";

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  dontNpmBuild = true;

  passthru.updateScript = ./update.sh;

  meta = {
    description = "An open-source AI agent that brings the power of Gemini directly into your terminal";
    homepage = "https://github.com/google-gemini/gemini-cli";
    downloadPage = "https://www.npmjs.com/package/@google/gemini-cli";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      omarjatoi
    ];
    mainProgram = "gemini";
  };
}
