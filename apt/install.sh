repofile=$(dirname $0)/repositories.lst
while read repo; do
	sudo apt-add-repository -y $repo
done < $repofile