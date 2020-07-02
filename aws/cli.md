$ pip install awscli --upgrade --user
add .bashrc `export PATH="$HOME/.local/bin:$HOME/.symfony/bin:$PATH"`
$ aws configure
add .bashrc `complete -C '/usr/local/aws/bin/aws_completer' aws`

$ aws ec2 describe-availability-zones --region ap-southeast-1
