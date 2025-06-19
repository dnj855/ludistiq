# 📘 Bible du Design System : Ludistiq

_Version 1.0 - La source de vérité pour l'UI et l'UX du projet._

## 1. Résumé Stratégique

### Philosophie : "La Clarté Fonctionnelle"

L'objectif est de transformer le chaos organisationnel en une mécanique fluide. Le design system incarne cette promesse avec une interface fiable, sobre et efficace. L'UI s'efface pour mettre en avant l'information et les actions.

- **Ton de Voix :** Clair, direct, rassurant.
- **Univers Graphique :** Moderne, structuré, utilitaire.
- **Style Naturel :** **Utilitaire Moderne**.

---

## 2. 🧱 Fondations

### Typographie

La police **Inter** est utilisée pour sa lisibilité exceptionnelle sur écran. La hiérarchie suivante assure une clarté visuelle immédiate.

| Rôle           | Poids      | Taille (Desktop / Mobile) | Classes TailwindCSS v4                         |
| :------------- | :--------- | :------------------------ | :--------------------------------------------- |
| **Display**    | `Bold`     | `48px` / `36px`           | `text-4xl md:text-5xl font-bold`               |
| **Titre H1**   | `Bold`     | `36px` / `30px`           | `text-3xl md:text-4xl font-bold`               |
| **Titre H2**   | `Semibold` | `30px` / `24px`           | `text-2xl md:text-3xl font-semibold`           |
| **Titre H3**   | `Semibold` | `24px` / `20px`           | `text-xl md:text-2xl font-semibold`            |
| **Titre H4**   | `Medium`   | `20px` / `18px`           | `text-lg md:text-xl font-medium`               |
| **Corps**      | `Regular`  | `16px` / `16px`           | `text-base font-normal`                        |
| **Small/Meta** | `Regular`  | `14px` / `14px`           | `text-sm`                                      |
| **Label**      | `Medium`   | `12px` / `12px`           | `text-xs font-medium uppercase tracking-wider` |

### Palette de Couleurs

Construite autour d'un **Indigo** (confiance, calme) et de couleurs sémantiques claires.

| Catégorie    | Couleur       | HEX       | Usage                              | Classes de base    |
| :----------- | :------------ | :-------- | :--------------------------------- | :----------------- |
| **Primaire** | `Indigo-600`  | `#4f46e5` | Actions principales, liens, focus. | `bg-indigo-600`    |
| **Neutres**  | `Slate-900`   | `#0f172a` | Texte principal, titres.           | `text-slate-900`   |
|              | `Slate-600`   | `#475569` | Texte secondaire, descriptions.    | `text-slate-600`   |
|              | `Slate-200`   | `#e2e8f0` | Bordures, fonds d'input.           | `border-slate-200` |
|              | `White`       | `#ffffff` | Fond des cartes.                   | `bg-white`         |
| **Succès**   | `Emerald-500` | `#10b981` | Validation, confirmations.         | `bg-emerald-500`   |
| **Alerte**   | `Amber-500`   | `#f59e0b` | Avertissements.                    | `bg-amber-500`     |
| **Danger**   | `Rose-600`    | `#e11d48` | Erreurs, suppression.              | `bg-rose-600`      |

### Grille & Espace

Le système repose sur une grille de **4px**. Les espacements (`p`, `m`, `gap`) sont des multiples de cette valeur pour garantir un rythme visuel cohérent.

- **Unité de base :** `1` = `0.25rem` = `4px`.
- **Espacements courants :** `p-2` (8px), `p-4` (16px), `p-6` (24px).
- **Layout :** Un conteneur principal centré est utilisé pour les pages principales.

```html
<div class="container mx-auto px-4 sm:px-6 lg:px-8"></div>
```

---

## 3. 🧩 Composants UI

### Boutons

La hiérarchie des boutons guide l'utilisateur vers l'action la plus importante.

**Bouton Primaire (action principale)**

```html
<button
  class="inline-flex items-center justify-center rounded-md px-4 py-2 text-sm font-semibold text-white bg-indigo-600 shadow-sm transition-colors hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:opacity-50 disabled:cursor-not-allowed"
>
  Créer une mission
</button>
```

**Bouton Secondaire (action alternative)**

```html
<button
  class="inline-flex items-center justify-center rounded-md bg-white px-4 py-2 text-sm font-semibold text-slate-900 shadow-sm ring-1 ring-inset ring-slate-300 transition-colors hover:bg-slate-50 disabled:opacity-50 disabled:cursor-not-allowed"
>
  Annuler
</button>
```

**Bouton Destructif (action dangereuse)**

```html
<button
  class="inline-flex items-center justify-center rounded-md bg-rose-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-rose-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-rose-600 disabled:opacity-50 disabled:cursor-not-allowed"
>
  Supprimer le jeu
</button>
```

### Formulaires

Clairs, lisibles et accessibles.

**Champ de Texte (Input)**

```html
<div>
  <label
    for="game_name"
    class="block text-sm font-medium leading-6 text-slate-900"
    >Nom du jeu</label
  >
  <div class="mt-2">
    <input
      type="text"
      name="game_name"
      id="game_name"
      class="block w-full rounded-md border-0 py-1.5 text-slate-900 shadow-sm ring-1 ring-inset ring-slate-300 placeholder:text-slate-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
      placeholder="ex: Terraforming Mars"
    />
  </div>
</div>
```

### Carte de Jeu

Composant spécifique pour la ludothèque, affichant les informations clés d'un jeu.

```html
<div
  class="flex max-w-md gap-4 rounded-xl border border-slate-200 bg-white p-4 shadow-sm"
>
  <div class="h-28 w-28 flex-shrink-0">
    <img
      class="h-full w-full rounded-md object-cover"
      src="..."
      alt="Couverture du jeu"
    />
  </div>

  <div class="flex flex-col justify-between py-1">
    <div>
      <p class="text-xs font-medium uppercase tracking-wider text-slate-500">
        Zone Expert
      </p>
      <h3 class="text-lg font-bold text-slate-900">Wingspan</h3>
      <p class="text-sm text-slate-600">Propriétaire : Association Ludique</p>
    </div>
    <div class="flex items-center gap-2">
      <span
        class="inline-flex items-center rounded-full bg-emerald-100 px-2 py-1 text-xs font-medium text-emerald-700"
      >
        3 copies
      </span>
      <span
        class="inline-flex items-center rounded-full bg-sky-100 px-2 py-1 text-xs font-medium text-sky-700"
      >
        4 animateurs experts
      </span>
    </div>
  </div>
</div>
```

### Badges de Compétence

Indicateurs visuels pour le niveau d'aisance des animateurs (les icônes SVG sont à insérer).

**Expert `[2]`**

```html
<span
  class="inline-flex items-center gap-x-1.5 rounded-md bg-emerald-100 px-2 py-1 text-sm font-medium text-emerald-800"
>
  Expert
</span>
```

**Connaisseur `[1]`**

```html
<span
  class="inline-flex items-center gap-x-1.5 rounded-md bg-sky-100 px-2 py-1 text-sm font-medium text-sky-800"
>
  Connaisseur
</span>
```

**Inconnu `[0]`**

```html
<span
  class="inline-flex items-center gap-x-1.5 rounded-md bg-slate-100 px-2 py-1 text-sm font-medium text-slate-800"
>
  Inconnu
</span>
```

**Refus `[-1]`**

```html
<span
  class="inline-flex items-center gap-x-1.5 rounded-md bg-rose-100 px-2 py-1 text-sm font-medium text-rose-800"
>
  Refus
</span>
```

---

## 4. 📜 Règles Générales

- **Accessibilité :** Les contrastes sont conformes au niveau AA du WCAG. Les états de focus sont toujours visibles et cohérents (`focus-visible:outline-indigo-600`). Les `label` sont systématiques.
- **Formes & Rayons :** Coins arrondis de manière subtile pour un aspect moderne (`rounded-md` et `rounded-xl`).
- **Ombres :** Légères (`shadow-sm`) pour créer une hiérarchie visuelle sans surcharger l'interface.
- **Iconographie :** Utiliser une librairie cohérente comme **Lucide** ou **Heroicons**. Les icônes servent à clarifier, non à décorer.
- **Animations :** Minimalistes et fonctionnelles (`transition-colors`). La réactivité de l'interface doit provenir de la vitesse de l'application, pas d'effets superflus.
