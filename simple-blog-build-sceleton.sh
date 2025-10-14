# Apply changes and build new package
./simple-blog-build-install.sh

# Make compact build directory
rm -rd build
mkdir build
cp -r dist build/
cp -r src build/
cp mkdocs.yml build/
cp simple-blog-gh.sh build/
cp simple-blog-install-from-tar.sh build/
cp simple-blog-run.sh build/
cp README.md build/
cp .gitignore build/
