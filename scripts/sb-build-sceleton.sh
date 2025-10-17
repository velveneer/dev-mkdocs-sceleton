# Create virtual environment and install dependencies
python -m venv venv
source venv/bin/activate

# Making sure dependencies exist
pip uninstall mkdocs mkdocs-simple-blog  
pip install -r requirements.txt --no-cache-dir

# Build and install local package from customization
python scripts/install_local.py

# Make compact build directory
rm -rd docs
mkdir docs
mkdir docs/scripts
cp -r dist docs/
cp -r src docs/
cp mkdocs.yml docs/
cp scripts/sb-gh.sh docs/scripts/gh.sh
cp scripts/sb-install.sh docs/scripts/install.sh
cp scripts/sb-run.sh docs/scripts/run.sh
cp README-build.md docs/README.md
cp .gitignore docs/
cp .gitlab-ci.yml docs/
