# Projet Commentaire

Ce projet correspond à l'exemple #2 du cours de Compilation en Licence  MIAGE de l'Université de Lorraine.

## Technologies utilisées

Pour la réalisation de ce projet, nous avons travaillé avec l'environement *Eclipse*, *Maven* et *JFlex* .

## Fonctionnement

L'application développée consiste à calculer le pourcentage comparant le nombre de caractères d'un mot dans/hors comentaire dans le fichier test.java. 
Pour cela, nous avons utilisé des expressions régulières afin de déterminer les caractères à l'intérieur d'un commentaire de type (//,/\*\*/,/\*\*\*\*/.....).

Dans le fichier scanner.lex, nous avons rédigé le programme nous permettant de faire ce traitement (avec JFlex).

C'est pourquoi nous avons fait 2 expressions régulières (c1 et c2).
La première expression régulière (c1) permet détecter les commentaires de type //, contenant des mots, symboles, caractères etc.

## Exemple de cas fonctionnels pour l'expression régulière c1
```
$c1=\/\/.*|\?[\^]|\\

//oui

// non /

//12582 ,;:,;: //
```

La deuxième expression régulière (c2) permet détecter les commentaires de type /\*\*\*/,/\*\*/... pouvant contenir des mots, symboles, caractères etc.

## Exemple de cas fonctionnels pour l'expression régulière c2
```
$c2=\/\*(([^*])|(\*[^/]))*\*\/

/* oui */

/*oui*/

/*
* oui
*/
```

La condition *commentaire* vérifie si l'on est dans un commentaire, grâce aux expressions régulières (on vérifie s'il agit d'un commentaire de type c1 ou c2). Si c'est le cas, on récupère la longeur de la chaine et on l'ajoute à k1, on affiche la chaine récupère avec yytext(), qui représente le token courant. Sinon, on incrémente le compteur de k2, c'est-à-dire le le nombre de caractères hors commentaire.

On affiche ensuite dans la fonction afficher(), k1 (compteur de caractères trouvés dans les commentaires), k2 (compteur de caractères trouvés hors des commentaires). Puis, on calcule le poucentage en faisant la somme de k1 et k2, on multiplie k1 * 100 et on divise par la somme de k1+k2, ce qui nous donne un résultat en pourcentage.

##Commandes utiles pour maven 

generate-sources :  plugin pour générer les sources à partir d'une grammaire (via le pom.xml).
package : prend le code compile et l'empaquete dnas un fomat distribuable tel qu'un .jar .
compile : compile le code source du projet.
install : installe le package dans le répertoire local, pour utiliser en tant que dépendance dans d'autres projets.

##Pour éxécuter le code sur Eclipse

Dès que le fichier scanner.lex est complété, on lance la commande maven package, ce qui va généré un répertoire contenant le fichier Yylex.java, puis on exécute ce fichier en cliquant sur Run et en configurant l'argument, via Run configurations. Quand cela est fait, on obtient le résultat suivant :
```
Commentaire trouvé :/**
* Exemple
*/ à la ligne 1
Commentaire trouvé ://tester le projet commentaire à la ligne 6
k1=48 et k2 =72 
40%
```

## Exécuter en console pour Linux & Mac
```
$ ./bin/comment
Usage : java Yylex [ --encoding <name> ] <inputfile(s)>
$ ./bin/comment ../Symbol/test.java

Commentaire trouvé :/**
* Exemple
*/ à la ligne 1
Commentaire trouvé ://tester le projet commentaire à la ligne 6
k1=48 et k2 =72 
40%
```

## Exécuter en console console pour Window
```
$ .\bin\comment.bat
Usage : java Yylex [ --encoding <name> ] <inputfile(s)>
$ .\bin\comment.bat ..\Symbol\test.java

Commentaire trouvé :/**
* Exemple
*/ à la ligne 1
Commentaire trouvé ://tester le projet commentaire à la ligne 6
k1=48 et k2 =72 
40%
```

##Améliorations effectuées/à corriger

Afficher le commentaire trouvé ainsi que sa ligne (utilisation de yytext(), yyline)

## Requis

*Java 1.8* ou +

## Auteur

Anne-Laure Charles

## Licence

Ce projet est distribué sous une licence MIT
(voir [license.md](license.md) pour plus de détails)