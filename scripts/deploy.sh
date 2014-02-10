git fetch
git submodule add -b ${GH_BRANCH_NAME} ${GH_PROJECT_URL} ${DEPLOY_SITE} > /dev/null 2>&1
cd ${DEPLOY_SITE}
if git checkout ${GH_BRANCH_NAME}; then git checkout -b ${GH_BRANCH_NAME}; fi
cp -R ../${DESTINATION_FOLDER}/* .
cp ../${DESTINATION_FOLDER}/.* .
echo "bower_components" >> .gitignore
    # pop the .circle.yml file from the stash
echo -e "branches:\n  - only:\n    - master" > .circle.yml
git add -f .
git config user.email "git@xivic.com"
git config user.name "xivic"
git commit -am "[circle deploy] adding build files to specific branch"
    # Any command that using GH_OAUTH_TOKEN must pipe the output to /dev/null to not expose your oauth token
git push ${GH_PROJECT_URL} HEAD:${GH_BRANCH_NAME} > /dev/null 2>&1