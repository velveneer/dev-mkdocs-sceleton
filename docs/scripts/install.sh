# Create virtual environment and install dependencies
python -m venv venv
source venv/bin/activate

# Update pip
pip install --upgrade pip

# Uninstall old versions if any
pip uninstall mkdocs mkdocs-simple-blog -y

# Install required packages
pip install mkdocs --no-cache-dir
pip install dist/mkdocs_simple_blog-0.2.0.tar.gz --no-cache-dir