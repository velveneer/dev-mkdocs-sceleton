# Create virtual environment and install dependencies
python -m venv venv
source venv/bin/activate

# Making sure the right package is installed
./simple-blog-install-from-tar.sh

# Build and deploy documentation to GitHub Pages
mkdocs build
mkdocs gh-deploy