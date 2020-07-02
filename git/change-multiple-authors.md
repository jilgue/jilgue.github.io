Change multiple authors in a large Git repo
===========================================
Copy and paste the script, replacing the following variables based on the information you gathered:

* OLD_EMAIL
* CORRECT_NAME
* CORRECT_EMAIL

```bash
#!/bin/sh

git filter-branch --env-filter '

OLD_EMAIL="your-old-email@example.com"
CORRECT_NAME="Your Correct Name"
CORRECT_EMAIL="your-correct-email@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```


git filter-branch -f --env-filter "GIT_AUTHOR_NAME='yourname'; GIT_AUTHOR_EMAIL='youremail@example.com'; GIT_COMMITTER_NAME='yourname'; GIT_COMMITTER_EMAIL='youremail@example.com';" HEAD;
