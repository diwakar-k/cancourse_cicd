# #!/bin/bash

# set -e
# cd repo
# mvn clean package
# #cp -R ./target ../concourse-demo-repo-out
# # cp -a * ../repo

#!/bin/bash

export NEW_VERSIONS=$(cat branches/branches)
export OLD_VERSIONS=$(cat branches/removed)

fly login -t your-concourse -c https://ci.osones.com -u concourse -p mysuperpassword

for version in $NEW_VERSIONS; do
  sed "s/___BRANCH___/$version/g" demo/.ci/pipeline-demo.tmpl > demo/.ci/pipeline-app.result
  echo "Create pipeline branch $version"
  fly -t your-concourse sp -n -p app-$version -c demo/.ci/pipeline-app.result
  echo "Unpause pipeline branch $version"
  fly -t your-concourse up -p app-$version
done

for version in $OLD_VERSIONS; do
  echo "Delete pipeline branch $version"
  fly -t your-concourse dp -n -p app-$version
done

