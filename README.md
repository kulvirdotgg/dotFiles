# VS Code Settings

# Font

* Current font: [Hack](https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip)
* [Anonymous Pro](https://www.marksimonson.com/fonts/view/anonymous-pro)
* [Source Code pro](https://github.com/Falkor/dotfiles/blob/master/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf?raw=true)
* [Montserrat](https://fonts.google.com/specimen/Montserrat)

# Extensions

Full list of [extensions](https://gist.github.com/Kulvir-parmar/8a49ff96f75cab3fed2049a5567bf256).

# Settings

```json
{
    "code-runner.ignoreSelection": true,
    "terminal.integrated.copyOnSelection": true,
    "editor.wordWrap": "on",
    "[cpp]": {
        "editor.defaultFormatter": "ms-vscode.cpptools"
    },
    "editor.minimap.enabled": false,
    "liveServer.settings.donotShowInfoMsg": true,
    "workbench.editor.enablePreview": false,
    "editor.snippetSuggestions": "bottom",
    "code-runner.executorMap": {
        "javascript": "node",
        "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
        "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "cpp": "cd $dir && g++ --std=c++17 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "php": "php",
        "python": "python -u",
        "perl": "perl",
        "perl6": "perl6",
        "ruby": "ruby",
        "go": "go run",
        "lua": "lua",
        "groovy": "groovy",
        "powershell": "powershell -ExecutionPolicy ByPass -File",
        "bat": "cmd /c",
        "shellscript": "bash",
        "fsharp": "fsi",
        "csharp": "scriptcs",
        "vbscript": "cscript //Nologo",
        "typescript": "ts-node",
        "coffeescript": "coffee",
        "scala": "scala",
        "swift": "swift",
        "julia": "julia",
        "crystal": "crystal",
        "ocaml": "ocaml",
        "r": "Rscript",
        "applescript": "osascript",
        "clojure": "lein exec",
        "haxe": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
        "rust": "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
        "racket": "racket",
        "scheme": "csi -script",
        "ahk": "autohotkey",
        "autoit": "autoit3",
        "dart": "dart",
        "pascal": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
        "d": "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
        "haskell": "runhaskell",
        "nim": "nim compile --verbosity:0 --hints:off --run",
        "lisp": "sbcl --script",
        "kit": "kitc --run",
        "v": "v run",
        "sass": "sass --style expanded",
        "scss": "scss --style expanded",
        "less": "cd $dir && lessc $fileName $fileNameWithoutExt.css",
        "FortranFreeForm": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "fortran-modern": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "fortran_fixed-form": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "fortran": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
    },
    "code-runner.saveFileBeforeRun": true,
    "code-runner.showExecutionMessage": false,
    "terminal.integrated.lineHeight": 1,
    "gitlens.advanced.messages": {
        "suppressGitMissingWarning": true
    },

    "workbench.startupEditor": "none",
    "terminal.integrated.allowChords": false,
    "code-runner.runInTerminal": true,

    "workbench.iconTheme": "seti",
    "editor.fontSize": 13,
    "editor.lineHeight": 19,
    "editor.fontFamily": "hack",


    "workbench.colorCustomizations": {
        "tab.activeBackground": "#11131a",
        "statusBar.background": "#2695a7",
        "statusBar.foreground": "#fff",
        "tab.inactiveBackground": "#212124",
        "tab.inactiveForeground": "#aaa",
        "tab.hoverBackground": "#333",
        "statusBarItem.hoverBackground": "#0e8999",
        "editorGroupHeader.tabsBackground":"#1e1e1e",
        "activityBar.background": "#1c1c1c",
        "sideBar.background": "#212121",
        "tab.activeBorder": "#ffa24a",
        "editor.background":"#1c1c1c",
        "titleBar.activeForeground":"#fff",
        "titleBar.activeBackground": "#18181a",
        "editorGroup.emptyBackground":"#1e1e1e",
        "quickInput.background": "#262626",
        "quickInput.foreground": "#ccc"
    },
    
    "debug.console.fontFamily": "hack",
    "scm.inputFontFamily": "hack",
    "workbench.colorTheme": "One Monokai"
}

```

