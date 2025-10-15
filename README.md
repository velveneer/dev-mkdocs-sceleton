# Sceleton MkDocs Project

This repository contains a sceleton project structure that allows you to costumize the theme of the simple-blog fork for mkdocs. 

---

## Project Structure 

```
.
├── docs/                               # Contains minimum files to use this build in a project
├── dist/                               # Contains the custom build python package
├── mkdocs_simple_blog/                 # Simple-blog src files for customization
├── scripts/                            # Simple-blog script files to update template after changes
├── src/                                # All documentation files
│   ├── page01/                         # Files for menu point 1
│   │   ├── docs/                       # .md documentation files
│   │   └── src                         # Other files
│   ├── page02/                         # Files for menu point 2
│   │   ├── docs/                       # .md documentation files
│   │   └── src                         # Other files     
│   └── index.md                        # Home Page MkDocs 
├── .gitignore                          # Local files that don't get pushed to the remote repository
├── .gitlab-ci.yml                      # CI pipeline to build GitLab Page for MkDocs
├── mkdocs.yml                          # MkDocs config (Navigation, Theme, etc.)
├── README-build.md                     # README for the build sceleton
├── README.md                           # Repository overview & setup instructions
├── requirements.txt                    # Python packages that need to be installed
├── setup.py                            # Script that is required to build custom simple-blog package
├── simple-blog-build-package.sh        # Script that builds the package in the /dist folder
├── simple-blog-build-sceleton.sh       # Script that creates the /docs folder with the files needed to implement this mkdocs in a different project
├── simple-blog-gh.sh                   # Script to builds compressed site and pushes it to github pages
├── simple-blog-install-from-tar.sh     # Script that sets up python virtual environment, installs MkDocs & custom simple-blog package
└── simple-blog-run.sh                  # Script that runs live 
```

## **Getting Started**

### Setup

The following steps setup everything needed to run the setup scripts.

**Clone This Repository**

```bash
git clone https://github.com/velveneer/mkdocs-sb-sceleton.git

cd mkdocs-sb-sceleton
```

**Install Python**

Ensure Python and pip are installed on your system. If Python is not installed on your machine follow the official instructions for your system.

```bash
python --version
pip --version
```

**Activate Virtual Environment**

```bash
python3 -m venv .venv

source .venv/bin/activate
```

If you're running into permission problems, check if your user has the correct permissions for this folder:

```bash
ls -ld .venv
```

If you're not seeing your user run:

```bash
deactivate 2>/dev/null || true

sudo rm -rf .venv

python -m venv .venv

source .venv/bin/activate
```

**Install MkDocs and Theme packages**

```bash
pip install mkdocs --no-cache-dir

pip install dist/mkdocs_simple_blog-0.2.0.tar.gz --no-cache-dir
```

!!! Note
    This installs the simple blog theme from the `/dist` folder and not the original version.

**Automatic Setup with Script**

Alternatively you can run these commands the provided script in this folder. Before doing that you need to give the file permission to execute commands:

```bash
chmod +x simple-blog-install-from-tar.sh
```

Then run the script:

```bash
./simple-blog-install-from-tar.sh
```

Verify the install by using:

```bash
mkdocs --version 

pip show mkdocs-simple-blog
```

### Local Host

To host the documentation locally on your machine either run 

```bash
mkdocs serve --livereload
```

Or the script:

```bash
./simple-blog-run.sh
```

The documentation will be available at:

[localhost:8000](http://127.0.0.1:8000)

!!! Note 
    This allows instant updates made to the documentation

### Github Host

If this folder is part of a github repository you can directly push your documentation by either running:

```bash
mkdocs build

mkdocs gh-deploy
```

Or using the script:

```bash
./simple-blog-gh.sh
```

### Gitlab Host

If this folder is part of a gitlab repository use the `.gitlab-ci.yml` pipeline script. This automatically builds the site in a pipeline and pushes it to your gitlab pages if this  is activated in your repository.

## **Usage**

Because MkDocs supports all the base features of markdown you can already use everything normally. I've implemented a few additions that are explained below.

### Admonition

To use admonitions write the following syntax:

```md
!!! Title Name
    Description
```

### Code Blocks

To use code blocks you can either use the normal markdown syntax:

```md
    ```language

    ```
```

Or use my customization that first hides the whole block behind an accordion. To do this use this syntax:

```md
<details>
    <summary>Accordion Title</summary>
    <pre id="codeblock">
        <code class="language-php" id="codeblock">The Code you want display goes here</code>
    </pre>
</details>
```

## **Theme Customization**

This MkDocs Documenation uses [Fernando Celmers MkDocs Theme](https://github.com/FernandoCelmer/mkdocs-simple-blog). 

I've made some customizations inside the `mkdocs_simple_blog/` folder to fit the needs of this documentation. If you want to do this yourself follow these steps:

**1. Create your virtual environment**
   
```bash
python -m venv venv
```

**2. Activate the virtual environment**
   
```bash
source venv/bin/activate
```

**3. Install the necessary requirements to be able to test the application**
   
```bash
pip install -r requirements.txt --no-cache-dir
```

**4. Make your changes as desired in the ./mkdocs_simple_blog folder**
   
```bash
ls mkdocs_simple_blog
```

**5. Run the script that creates and installs the local package to build your new theme**

```bash
python scripts/install_local.py 
```

**6. Run your MkDocs site**

```bash
mkdocs serve
```

Or use the scripts:

```bash
./simple-blog-build-package.sh
./simple-blog-install-from-tar.sh
./simple-blog-run.sh
```

To build a minimal build to use this documentation template in your project use the script:

```bash
./simple-blog-build-sceleton.sh
```

Then copy the `/docs` folder in your repository and do the setup there.

## Contribution 

If you want to contribute for example to the `setup` documentation, feel free to create your own branch and merge request <3