config files and such

## `pacman` backup

save packages with
```
pacman -Qqe > pkglist.txt
```

load packages with 
```
sudo pacman -S - < packages.txt
```
