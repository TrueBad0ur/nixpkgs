{ lib
, buildPythonPackage
, fetchFromGitHub
, requests
, oauthlib
, python-dateutil
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "discogs-client";
  version = "2.6";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "joalla";
    repo = "discogs_client";
    rev = "refs/tags/v${version}";
    sha256 = "sha256-Si1EH5TalNC3BY7L/GqbGSCjDBWzbodB4NZlNayhZYs=";
  };

  propagatedBuildInputs = [
    requests
    oauthlib
    python-dateutil
  ];

  checkInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "discogs_client"
  ];

  meta = with lib; {
    description = "Unofficial Python API client for Discogs";
    homepage = "https://github.com/joalla/discogs_client";
    license = licenses.bsd2;
    maintainers = with maintainers; [ fab ];
  };
}
