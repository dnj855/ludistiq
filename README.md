# Ludistiq

**Le système d'exploitation pour les festivals de jeux de société.**

Ludistiq est une application web (PWA) conçue pour centraliser, simplifier et professionnaliser l'organisation des festivals de jeux de société.

## 1\. Vision et Problème Résolu

Le projet vise à résoudre deux freins majeurs dans l'organisation d'événements ludiques :

- **La Fragmentation de l'Information** : Les données critiques sont éparpillées entre tableurs, emails et messageries, ce qui génère des erreurs et une perte de temps considérable.
- **Le Goulot d'Étranglement de l'Organisateur** : Le pilote du festival est constamment interrompu pour des questions récurrentes, l'empêchant de se focaliser sur les imprévus et les tâches stratégiques.

Notre proposition de valeur s'articule autour de trois piliers :

1. **Centralisation** : Offrir une source unique de vérité pour toutes les parties prenantes.
2. **Spécialisation** : Fournir des outils conçus spécifiquement pour les besoins du monde du jeu de société.
3. **Capitalisation** : Transformer les données de chaque édition en un savoir réutilisable pour optimiser les suivantes.

## 2\. ✨ Fonctionnalités Clés (Périmètre du MVP)

Le Produit Minimum Viable (MVP) se concentre sur trois modules fondamentaux pour valider notre proposition de valeur.

### A. Ludothèque Intelligente

- **Ajout de jeux assisté** via l'API de BoardGameGeek (BGG) pour pré-remplir les informations publiques (nom, auteur, durée, etc.).
- **Gestion des données logistiques internes** : propriétaire, nombre de copies, et surtout la zone de stockage physique sur le festival.
- **Auto-évaluation des compétences** par les animateurs sur chaque jeu, selon une échelle simple : `Expert`, `Connaisseur`, `Inconnu`, ou `Ne souhaite pas animer`.

### B. Planning Interactif

- **Création de missions par zone** et par créneau horaire (ex: "Animateur - Zone Famille - 14h-16h").
- **Aide à la décision pour les managers** grâce à un score de "couverture de compétences" qui indique si une équipe d'animateurs affectée à une zone maîtrise suffisamment les jeux qui s'y trouvent.
- **Vue "Mon Planning"** claire et personnelle pour chaque bénévole.

### C. Communication Ciblée

- **Envoi de messages** à tous les participants ou à des groupes ciblés (par rôle ou par pôle).
- **Système de communication structuré** pour limiter le bruit :
  - **Réactions** (👍, ✔️) pour un accusé de réception rapide et silencieux.
  - **Réponse privée** à l'expéditeur pour les questions spécifiques, sans notifier tout le canal.

## 3\. 🛠️ Stack Technique

- **Application Type** : Progressive Web App (PWA) pour une expérience mobile optimale sans les contraintes d'un store d'applications.
- **Framework** : Ruby on Rails 7+
- **Front-end** : Hotwire (Turbo & Stimulus)
- **Base de données** : PostgreSQL

## 4\. 🚀 Démarrage Rapide (Installation)

**Prérequis :**

- Ruby (voir `.ruby-version`)
- Bundler
- Node.js et Yarn
- PostgreSQL

**Étapes d'installation :**

1.  **Cloner le dépôt**

    ```bash
    git clone [URL_DU_REPO]
    cd ludistiq
    ```

2.  **Installer les dépendances**

    ```bash
    bundle install
    yarn install
    ```

3.  **Configurer l'environnement**
    Créez une copie du fichier d'exemple pour vos variables d'environnement.

    ```bash
    cp .env.example .env
    ```

    Modifiez le fichier `.env` pour y ajouter vos propres clés, notamment pour la base de données et l'API BoardGameGeek.

4.  **Préparer la base de données**

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed # Pour peupler la BDD avec des données de test
    ```

5.  **Lancer le serveur**

    ```bash
    bin/dev
    ```

    L'application sera accessible sur `http://localhost:3000`.

## 5\. 🗂️ Modèle de Données (Core Models)

Le squelette de l'application repose sur les modèles suivants :

- `User` : Comptes utilisateurs et rôles.
- `Event` : Une édition du festival.
- `Game` : Un jeu de la ludothèque.
- `Zone` : Un espace physique ou logique du festival.
- `Mission` : Un besoin en personnel sur un créneau et dans une zone.
- `Assignment` : L'affectation d'un `User` à une `Mission`.
- `Skill` : Le niveau de maîtrise d'un `User` sur un `Game`.
- `Message` : Une communication envoyée aux utilisateurs.

## 6\. 🗺️ Roadmap de Développement (MVP)

Le développement est découpé en sprints logiques.

- **✅ Sprint 1 : Le Socle Applicatif**
  - Authentification des utilisateurs et gestion des rôles.
  - Création/gestion d'un `Event`.
- **🔄 Sprint 2 : La Ludothèque Intelligente**
  - Modèles `Game` et `Skill`.
  - Intégration de l'API BGG.
  - Interface d'auto-évaluation.
- **◻️ Sprint 3 : Le Planning Interactif**
  - Modèles `Zone`, `Mission`, `Assignment`.
  - Interface de création des missions.
  - Logique de "matchmaking" et vue "Mon Planning".
- **◻️ Sprint 4 : La Communication Ciblée**
  - Modèle `Message`.
  - Interface d'envoi et système de réactions/réponse privée.
- **◻️ Sprint 5 : La Vitrine & Finitions**
  - Pages publiques pour les visiteurs.
  - Polissage UX/UI et préparation au déploiement.

## 7\. 🚗 Post-MVP (Parking)

Les fonctionnalités suivantes sont envisagées pour des versions futures mais exclues du MVP pour garantir une livraison rapide et ciblée.

- Gestion comptable (suivi des dépenses/recettes).
- Billetterie et inscriptions des visiteurs.
- Alertes urgentes et messagerie avancée.
