USER=rasmuserik
install -d repos
cd repos
REPOS=`curl "https://github.com/$USER?tab=repositories" | grep '^    <a href="/rasmuserik/' | sed -e s/" *<[^>]*> *"//g`

for REPO in $REPOS 
do
    git clone git@github.com:$USER/$REPO.git
done
