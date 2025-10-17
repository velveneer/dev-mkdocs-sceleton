# Sceleton MkDocs Project

This folder contains the documentation for this project. 

It runs on the python based static site generator `MkDocs` I've implemented my own fork based on the `simple-blog` theme from [Fernando Celmers](https://github.com/FernandoCelmer/mkdocs-simple-blog).

You can run this website locally or hosted on your online gitrepo pages. Follow the steps down below to setup and use this application.

---

## Project Structure 

<div id='codeblock'>
```
.
├── dist/             	# Contains the custom build python package
├── scripts/            # Scripts for setup
│   ├── gh.sh           # Script to builds compressed site and pushes it to github pages
│   ├── install.sh      # Script that sets up python virtual environment, installs MkDocs & custom simple-blog package
│   └── run.sh          # Script that runs live
├── src/                # Work Files
│   ├── md/             # Documentation files
│   │   └── sceleton/   # Topic1
│   │       └── src/    # img, etc...
│   ├── css/            # Custom CSS files 
│   │   └── extra.css   # Custom CSS file    
│   └── index.md        # Home Page MkDocs 
├── .gitignore          # Local files that don't get pushed to the remote repository
├── .gitlab-ci.yml      # CI pipeline to build GitLab Page for MkDocs
├── mkdocs.yml          # MkDocs config (Navigation, Theme, etc.)
└── README.md           # Repository overview & setup instructions
```
</div>

---

## **Getting Started**

---

### Setup

The following steps setup everything needed to run the setup scripts.

**Clone This Repository**


<div id='codeblock'>

```
git clone `this repository`

cd docs
```
</div>

---

**Install Python**

Ensure Python and pip are installed on your system. If Python is not installed on your machine follow the official instructions for your system.

<div id='codeblock'>

```
python --version
pip --version
```
</div>

---

**Activate Virtual Environment**

<div id='codeblock'>

```
python3 -m venv .venv

source .venv/bin/activate
```
</div>

If you're running into permission problems, check if your user has the correct permissions for this folder:

<div id='codeblock'>

```
ls -ld .venv
```
</div>

If you're not seeing your user run:

<div id='codeblock'>

```
deactivate 2>/dev/null || true

sudo rm -rf .venv

python -m venv .venv

source .venv/bin/activate
```
</div>

---

**Install MkDocs and Theme packages**

<div id='codeblock'>

```
pip install mkdocs --no-cache-dir

pip install dist/mkdocs_simple_blog-0.2.0.tar.gz --no-cache-dir
```
</div>

!!! Note
    This installs the simple blog theme from the `/dist` folder and not the original version.

---

**Automatic Setup with Script**

Alternatively you can run these commands the provided script in this folder. Before doing that you need to give the file permission to execute commands:

<div id='codeblock'>

```
chmod +x install.sh
```
</div>

Then run the script:

<div id='codeblock'>

```
./install.sh
```
</div>

Verify the install by using:

<div id='codeblock'>

```
mkdocs --version 

pip show mkdocs-simple-blog
```
</div>

### Local Host

To host the documentation locally on your machine either run 

<div id='codeblock'>

```
mkdocs serve --livereload
```
</div>

Or the script:

<div id='codeblock'>

```
./run.sh
```
</div>

The documentation will be available at:

[localhost:8000](http://127.0.0.1:8000)

!!! Note 
    This allows instant updates made to the documentation

---

### Github Host

If this folder is part of a github repository you can directly push your documentation by either running:

<div id='codeblock'>

```
mkdocs build

mkdocs gh-deploy
```
</div>

Or using the script:

<div id='codeblock'>

```
./gh.sh
```
</div>

---

### Gitlab Host

If this folder is part of a gitlab repository use the `.gitlab-ci.yml` pipeline script. This automatically builds the site in a pipeline and pushes it to your gitlab pages if this  is activated in your repository.

---

## **Usage**

Because MkDocs supports all the base features of markdown you can already use everything normally. I've implemented a few additions that are explained below.

### Admonition

To use admonitions write the following syntax:

<div id='codeblock'>
!!! Title Name
    Description
</div>

### Code Blocks

To use code blocks you can either use the normal markdown syntax:

<div id='codeblock'>
	
	```language
	
	```

</div>

Or use my customization that first hides the whole block behind an accordion. To do this use this syntax:

<div id='codeblock'>

```
<details>
    <summary>Accordion Title</summary>
    <pre id="codeblock">
        <code class="language-php" id="codeblock">The Code you want display goes here</code>
    </pre>
</details>
```
</div>

#### VS Code Shortcut

To automatically insert this code snippet in your file add a user snippet in <div id='codeline'>VS-Code</div> by adding this to 

<div id='codeline'>markdown.json:</div>

<div id='codeblock'>

```
{
	"toggle_accordion": {
		"prefix": "accordion",
		"body": [
			"<details>",
			"<summary>Show Code</summary>",
			"<div id='accordion'>",
            "```php",
			"$TM_SELECTED_TEXT${1:}",
			"```",
			"</details>"
		],
		"description": "Encloses selected text in accordion code block"
	},
    "toggle_codeblock": {
		"prefix": "codeblock",
		"body": [
			"<div id='codeblock'>",
			"```",
			"$TM_SELECTED_TEXT${1:}",
			"```",
			"</div>"
		],
		"description": "Encloses selected text in code block"
	},
    "toggle_codeline": {
		"prefix": "codeline",
		"body": [
			"<div id='codeline'>$TM_SELECTED_TEXT${1:}</div>"
		],
		"description": "Encloses selected text in code line"
	},

}
```
</div>

And this to 

<div id='codeline'>keybindings.json:</div>

<div id='codeblock'>

```
{
    "key": "ctrl+m",
    "command": "editor.action.insertSnippet",
    "args": { "name": "toggle_accordion" }
},
{
    "key": "ctrl+k",
    "command": "editor.action.insertSnippet",
    "args": { "name": "toggle_codeblock" }
},
{
    "key": "ctrl+n",
    "command": "editor.action.insertSnippet",
    "args": { "name": "toggle_codeline" }
},
```
</div>

!!! Note
    Now you can enclose your code with the shortcut `strg+m`