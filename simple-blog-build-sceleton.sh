# Apply changes and build new package
./simple-blog-build-package.sh

# Make compact build directory
rm -rd docs
mkdir docs
cp -r dist docs/
cp -r src docs/
cp mkdocs.yml docs/
cp simple-blog-gh.sh docs/
cp simple-blog-install-from-tar.sh docs/
cp simple-blog-run.sh docs/
cp README-build.md docs/README.md
cp .gitignore docs/
cp .gitlab-ci.yml docs/
