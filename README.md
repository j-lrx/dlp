# Documentation

## Important - Facturation

Le service data loss prevention de gcp est un service onéreux de l'ordre de **2€ / Go** de données traitées. Pour plus d'information sur le mode de facturation sur la [lien](https://google.com "page offielle.")

## Principes

Le service Data loss prévention permet l'analyse de fichiers texte ou de données structurées comme un dump de base SQL ou une table bigquery pour en extraire les données sensibles d'après plus de 150 modèles pré-définis. Des modèles de données sensibles personnalisés peuvent également créer pour enrichir le service. 

Une copie des fichiers ou tables analysées est crée, les données sensibles choisies étant anonymisées selon la manière retenue. Les possibilités de masquage des données sensibles proposées dans ce module sont :
- **Pour les données structurées :**
    - *Masquage* : Chaque données sensible est remplacée par un nombre égale de caratères **\***
    - *Chiffrement déterministe* : Chaque données est chiffrées grace à une clef. Cette méthode préserve la cohérence des données quand celles-ci sont utilisées comme clef de jointure entre tables. 
- Pour les fichiers de texte :
    - Remplacement par le type de donnée : Chaque données est remplacé par son type. ex : *example@systeme-u.fr* sera remplacé par *EMAIL_ADRESS*

**Important :** Un job DLP ne peut effectuer qu'un seul type de transformation à la fois. Ainsi, l'anonymisation de fichiers texte et de données structurées ne pourra se faire qu'après exécution de deux tâches DLP distincte

## Usage

### Anonymisation de données structurées

Code pour l'analyse de données structurées : 
```hcl

```

Fichier *.auto.tfvars associé
```hcl

```

### Anonymisation de fichiers texte

Code pour l'analyse de fichier texte : 
```hcl

```

Fichier *.auto.tfvars associé
```hcl

```
|Name|Type|Default|Required|Description|
|----|----|-------|--------|-----------|
## Liste des variables

## Output

