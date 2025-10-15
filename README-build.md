# Sceleton MkDocs Project

This folder contains the documentation for this project. 

It runs on the python based static site generator `MkDocs` I've implemented my own fork based on the `simple-blog` theme from [Fernando Celmers](https://github.com/FernandoCelmer/mkdocs-simple-blog).

You can run this website locally or hosted on your online gitrepo pages. Follow the steps down below to setup and use this application.

---

## Project Structure 

```
.
├── mkdocs_simple_blog/                 # Simple-blog src files for customization
├── src/                                # All .md documentation files
├── .gitignore                          # Local files that don't get pushed to the remote repository
├── .gitlab-ci.yml                      # CI pipeline to build GitLab Page for MkDocs
├── mkdocs.yml                          # MkDocs config (Navigation, Theme, etc.)
├── README.md                           # Repository overview & setup instructions
├── requirements.txt                    # Python packages that get installed by the setup.sh script
├── simple-blog-gh.sh                   # Script to builds compressed site and pushes it to github pages
├── simple-blog-install-from-tar.sh     # Script that sets up python virtual environment, installs MkDocs & custom simple-blog package
└── simple-blog-run.sh                  # Script that runs live reloading locally hosted page
```

## **Getting Started**

### Setup

The following steps setup everything needed to run the setup scripts.

**Clone This Repository**

```bash
git clone `this repository`

cd docs
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

**Automativ Setup with Script**

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

