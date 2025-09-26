# Create virtual environment and install dependencies
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt --no-cache-dir

# Run installation script and serve documentation
python scripts/install_local.py 

# Make compact build directory
rm -rd build
mkdir build
cp -r dist build/
cp -r src build/
cp mkdocs.yml build/
cp build_deploy_gh.sh build/
cp README.md build/
cp .gitignore build/
cp setup.sh build/
