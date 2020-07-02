NANOPB=../ledger-nanopb

pushd proto
protoc --plugin=protoc-gen-nanopb=${NANOPB}/generator/protoc-gen-nanopb --nanopb_out=../src/nanopb_stubs  -I. -I${NANOPB}/generator/proto/ *.proto
protoc --python_out=../src/py3_tests  -I. -I${NANOPB}/generator/proto/ *.proto
popd

if ! [ "$(ls src/nanopb)" ]; then 
    cd src/nanopb
    cp ../../ledger-nanopb/*.c .
    cp ../../ledger-nanopb/*.h .
    cd ..
fi
