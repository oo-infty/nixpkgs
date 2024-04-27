{ lib
, buildPythonPackage
, fetchPypi
, llama-index-core
, poetry-core
, pythonOlder
}:

buildPythonPackage rec {
  pname = "llama-index-embeddings-openai";
  version = "0.1.9";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    pname = "llama_index_embeddings_openai";
    inherit version;
    hash = "sha256-D9KSsvmgrUU0p5DWN0cmvIhYUxiAh+sBgWfc8jlkOSQ=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    llama-index-core
  ];

  # Tests are only available in the mono repo
  doCheck = false;

  pythonImportsCheck = [
    "llama_index.embeddings.openai"
  ];

  meta = with lib; {
    description = "LlamaIndex Embeddings Integration for OpenAI";
    homepage = "https://github.com/run-llama/llama_index/tree/main/llama-index-integrations/readers/llama-index-readers-s3";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
