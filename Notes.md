# Notes

## Bash 


### Usefull trick

* $_ or !$ : Repeat last argument of the previous command
* !!:X : Repeat argument number X of the previous command (!!:0 command, !!:1 first arg ...)
* !! : Repeat last command (ex: sudo !!)

### Shortcut
*   ctrl + _ (undo)
*   ctrl + t (swap two characters)
*   ALT + t (swap two words)
*   ALT + . (prints last argument from previous command)
*   ctrl + x + * (expand glob/star)
*   ctrl + arrow (move forward a word)
*   ALT + f (move forward a word)
*   ALT + b (move backward a word)
*   ctrl + x + ctrl + e (opens the command string in an editor so that you can edit it before execution)
*   ctrl + e (move cursor to end)
*   ctrl + a (move cursor to start)
*   ctrl + xx (move to the opposite end of the line)
*   ctrl + u (cuts everything before the cursor)
*   ctrl + k (cuts everything after the cursor)
*   ctrl + y (pastes from the buffer)
*   ctrl + l (clears screen)s


### Commands
* bind -p : List all bash shortcuts
* rmdir : supprime répertoire vides
* tee : Renvoie le stdin sur le stdout et dans un fichier
* tr : REmplace un char par un autre.
* sort : Tri un stream.
* uniq : Elimine lignes dupliquées dans un stream.
* wc : Comptes les mots/lignes/octets dans un stream.
* df (-h) : Info sur espace libre et occupé par le sys de fichiers
* du (-h) : Espace disque utilisé par chacuns des arguments
* at : Planifie un travail à exécuter ultérieurement.
* atq : liste les travaux planifiés.
* atrm : supprime des travaux planifiés.
* crontab : Gérer son fichier cron perso (voir cron)
* apropos, whatis : Cherche dans le manuel les pages se rapportant à un terme.
