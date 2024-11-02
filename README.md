# FQL
_a concept for a File Querry Language_

So my idea was and is to make a program, for now a CLI one, that would allow for a crossplatform file and path manipulations.
I am tired of the fact that Microsoft's systems and UNIX based/inspired systems have different approaches to moving, searching, (in general) changing files around the folder paths.

So here below I will attempt list what this program could be capable of.
Also, I'd be happy if you could contribute or just point out for me any mistakes I've did in my code-base or in the logic I am applying to the app.

## Searching
First of all, this should allow to search and list any paths of filepaths.
I'd say that this could look like:
```
SELECT [files/folders/all] FROM downloads WHERE \.txt$\;
```
Basically you'd have to specify if you want to find files or directories.
Then you'd have to specify from which folder the search should start from. This will be expanded on in later part of this readme.
Lastly there could be a condition for filtering names of the file/directory names. I am thinking about alowing user to use regex, not to reinvent a wheel.

## COPYING and MOVING
Like in search case, you would specify what group of files you would like to move or copy, but here there would be an addition of a destination in the querry. It could go as follows:
```
COPY files FROM documents/github/myrepo TO documents/some_other_folder WHERE some_condition;
```

## PATHS
So on different OS' there are different approaches to handling the paths. Windows' use backslashes and UNIX based systems use slashes, and this is just beginning. 
The other very painful thing is that Windows' use thsoe C:// D:// locations as the root directories, where IOS and Linuxes use / as the root folders.
So inspired bu how it is solved in Godot game engine, I'd like to have a list of commonly accessible directories that every system has, just in different locations, like documents, downloads, images and so on.
In case of a need for a more specifica actions, there should be a way to speciy what should happen to specific group of OS'. By default this should require to handle both windows and unix cases, but there could be a way to conscoiusly resign from handling one or more OS' on users own responsibility.
```
```
_For now I am not sure how to handle this, but I think that I'd put CASE keyword into this somewhere._


## Thanks
Ok, thenk you for reading this. I'd happily work on this together with other people, but let me first creathe the basics for this project. I think that I will implement it in zig language, but I am not certain yet. Go-lang seems promissing too, but I don't know this one just yet. Rust is nice, but  the more I know about other languages, the less it is as impressive as it used to be to me.
### TODO:
- [ ] Choose the programming language and set the repo for it.
- [ ] Prepare lexer
- [ ] Add CLI interface
- [ ] Make CLI interface accept file as the source of the querry
- [ ] Figure out the specific path issue
