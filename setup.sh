#/bin/bash 

sudo yum install python git -y 

# install nvm (if not already)
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
# reload shell (or open a new terminal)
export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# install Node 22 (LTS major)
nvm install 22
nvm use 22
node -v    # should show v22.x.x
which node
npm -v
which npm
# global install (latest CDK v2 by default)
npm install -g aws-cdk

# verify
echo " cdk version is " 
cdk --version
which cdk
export PATH=$PATH:~/.nvm/versions/node/v22.19.0/bin/node:~/.nvm/versions/node/v22.19.0/bin/npm:~/.nvm/versions/node/v22.19.0/bin/cdk
echo "PATH=$PATH" >> ~/.bash_profile
. ~/.bash_profile
echo $PATH
cdk bootstrap $1/ap-south-1
mkdir my-cdk-py && cd my-cdk-py
cdk init app --language python --no-notices

pwd 
source .venv/bin/activate
sed -i "s/\,\ \"MyCdkPyStack\"/\,\ \"MyCDK$2\"/g" app.py
cdk synth --no-notices -v 
cdk deploy --no-notices -v 
