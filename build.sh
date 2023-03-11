set -eux
echo "Building version: '$CI_COMMIT_TAG'"
echo "pwd: $PWD"
ls -alh
mkdir artifacts
git clone -b $CI_COMMIT_TAG --depth 1 $GIT_CLONE_URL vyos-build
cd vyos-build
./configure --architecture amd64 --build-by ian@ianhattendorf.com --build-type release --version $CI_COMMIT_TAG
make iso
cp ./build/vyos-$CI_COMMIT_TAG-amd64.iso ../artifacts/
