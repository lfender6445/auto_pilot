---
layout: post
title: "Installing a dependency with Bower from URL and specify version"
description: ""
category:
tags: []
---

Installing a dependency with Bower from URL and specify version


I am trying to install a dependency with Bower using a Url. As of Bower documentation:

Bower offers several ways to install packages:

    # Using the dependencies listed in the current directory's bower.json 
  bower install
  # Using a local or remote package 
  bower install <package>
  # Using a specific version of a package 
  bower install <package>#<version>
  # Using a different name and a specific version of a package 
  bower install <name>=<package>#<version>

Where can be any one of the following:

- A name that maps to a package registered with Bower, e.g, jquery. 
- A remote Git endpoint, e.g., git://github.com/someone/some-package.git. Can be public or private. 
- A local endpoint, i.e., a folder that's a Git repository. 
- A shorthand endpoint, e.g., someone/some-package (defaults to GitHub). 
- A URL to a file, including zip and tar files. Its contents will be extracted.

However,then it says,that all the types except the url allow to specify a version.

How do I specify a version for a URL downloaded dependency?


--------------------------------------- 
Just specifying the endpoint worked for me, bower version 1.3.9

    "dependencies": {
  "jquery.cookie": "latest",
  "requirejs": "latest",
  "everestjs": "http://www.everestjs.net/static/st.v2.js"
}

Running `bower install`, I received following output:

    bower new version for http://www.everestjs.net/static/st.v2.js#*
    bower resolve http://www.everestjs.net/static/st.v2.js#*
    bower download http://www.everestjs.net/static/st.v2.js
    bower invalid-meta everestjs is missing "ignore" entry in bower.json

If it doesn't work for you, try updating bower.

`npm update -g bower`

According to the documentation: the following types of urls are supported:

    http://example.com/script.js
    http://example.com/style.css
    http://example.com/package.zip (contents will be extracted)
    http://example.com/package.tar (contents will be extracted)

Source: [http://bower.io/docs/api/](http://bower.io/docs/api/)


