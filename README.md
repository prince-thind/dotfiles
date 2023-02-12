# configs

A repository which houses all useful config files. A useful way to work with config files in git is to work here with ~~hard~~ soft links which link back to config files at their normal path. The links are in the links.json file.

# Remarks

Unfortunately, git doesn't work very well with hard links. If a file is reset with git, a new inode is generated for the file and thus it loses the hard link. I actually tried many hard link based workflows but even setting git config would regenerate inode numbers thus, I have reverted to using soft links again.
