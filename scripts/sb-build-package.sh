# Create virtual environment and install dependencies
python -m venv venv
source venv/bin/activate

# Making sure dependencies exist
pip uninstall mkdocs mkdocs-simple-blog  
pip install -r requirements.txt --no-cache-dir

# Build and install local package from customization
python scripts/install_local.py