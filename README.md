# datasciencecoursera
Repository for Coursera Data Science classwork

## Setup!
After creating your repo on the Github site, you must initialize your local copy. 

    $ cd repos
    $ mkdir {repositoryname}
    $ cd {repositoryname}

Initialize this new directory as a Git repo and tie it to your online origin

    $ git init
    $ git remote add origin https://github.com/{username}/{repositoryname}.git

## Advice!
Always pull before you push. 

    $ git pull origin master

You must add changed files to the commit before you can commit
 
    $ git add FILENAME.ext 
    $ git add . 

Always include a message in your commit command line -- NEVER use text editor in git bash

    $ git commit -m "Message goes here"

Finally, push push push!

    $ git push origin master