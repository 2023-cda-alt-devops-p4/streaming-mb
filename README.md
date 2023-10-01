# Plateforme de streaming

Stocker et manipuler des données dans une base de données.

![img_svg](./img/movies.svg)

## Contexte du projet

J'envisage de créer un site où les utilisateurs, dans un premier temps, pourront se connecter pour faire différentes opérations de recherches à propos de films, d'acteurs/actrices ou de réalisateurs.

Seul l'administrateur pourra ajouter, modifier ou supprimer des données. Pour chaque entrée dans la base de données, il y aura la date de création et de modification.

Mais la partie site web n'est pas pour tout de suite 😃

Avant celà, j'ai besoin d'une base de données pour le stockage.

A vous de jouer 🙂

## Modalités pédagogiques

**Activité individuelle en mode collaboratif.**

### Structure de la base de donnée

*Les films*  
Un film comporte un titre, un ou plusieurs acteurs, un réalisateur, une durée et l'année de sa sortie.

*Les acteurs, actrices*  
Nom, prénom, rôle et date de naissance.

*Les réalisateurs*  
Nom et prénom.

*Les utilisateurs*  
Nom, prénom, email, mot de passe, rôle et liste des films préférés.

### Les requêtes

Voici un jeu de requêtes minimal à fournir pour tester votre bdd :
- les titres et dates de sortie des films du plus récent au plus ancien
- les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
- la liste des acteurs/actrices principaux pour un film donné
- la liste des films pour un acteur/actrice donné
- ajouter un film
- ajouter un acteur/actrice
- modifier un film
- supprimer un acteur/actrice
- afficher les 3 derniers acteurs/actrices ajouté(e)s

A placer dans le *README.md*.
​
### Contraintes

- créez votre environnement Docker
- mettre en place un *trigger*, également appelé déclencheur

### Deadline

4 jours.

## Modalités d'évaluation

Correction entre pairs.  
Vos requêtes seront testées en local après l'importation de votre environnemnt avec docker.

## Livrables

Un dépôt GitHub contenant :
- l'environnement docker
- le dictionnaire de données
- MCD
- MPD
- MLD
- un fichier permettant de générer la bdd (incluant quelques données)
- le jeu de requêtes dans le *README.md*

## Critères de performance

- pouvoir récupérer facilement votre environnement
- relations présentes entre les tables
- un *trigger* mis en place
- une bonne présentation des requêtes sur le *README.md*
- les requêtes s'executent sans erreur

## Ressources

- [Comprendre les bases de données](https://www.base-de-donnees.com/comprendre-bases-de-donnees)
- [Modèle Conceptuel des Données](https://www.base-de-donnees.com/mcd)
- [Langage SQL](https://sql.sh)

## Auteurs, contributeurs

* [Nicolas Herbez](https://github.com/nicolas-herbez)
* [Cyril Marcq](https://github.com/CyrilMarcq)
* [Jean-Baptiste Lavisse](https://github.com/jblavisse)
