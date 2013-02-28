USER=rasmuserik
install -d repos
cd repos
REPOS=`curl "https://github.com/$USER?tab=repositories" | grep '^    <a href="/rasmuserik/' | sed -e s/" *<[^>]*> *"//g`
REPOS="$REPOS notes solsort rasmuserik.github.com erhversphd-application"

for REPO in $REPOS 
do
    if [ -d $REPO ]; then
        cd $REPO
        git pull
        cd ..
    else
        git clone git@github.com:$USER/$REPO.git
    fi
done
