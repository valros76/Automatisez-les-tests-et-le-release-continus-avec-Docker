#Workshop Organizer & Olympic Tracker

Projet de gestion de workshops et suivi des Jeux Olympiques, conteneurisé avec Docker et automatisé via une pipeline CI/CD GitHub Actions.

## 🛠️ Installation et Démarrage

### Prérequis

- Node.js (>=22.0.0)

- Docker & Docker Compose

### Installation locale

**Cloner le dépôt :**
```bash
git clone <url-de-votre-repo>
cd <nom-du-projet>
```

**Installer les dépendances :**

*Backend*
```bash
cd backend && npm ci && cd ..
```

*Frontend*
```bash
cd frontend && npm ci && cd ..
```

*Lancement via Docker :*
```bash
docker-compose up --build
```


### 🔑 Configuration (Backend)

Copiez le fichier `.env.example` vers `.env` dans le dossier `backend` :

|Variable | Description | Valeur par défaut |
| --- | --- | --- |
| `PORT` | Port du serveur API | `3000` |
| `NODE_ENV` | Environnement (development/production) | `development` |
| `MONGO_URI` | URI de connexion MongoDB | `mongodb://localhost:27017/workshopsdb` |
| `CORS_ORIGIN` | URL autorisée pour le CORS | `http://localhost:5173` |

### 🚀 Logique CI/CD

Le pipeline est optimisé pour garantir la qualité du code à chaque modification :

- **Test :** Exécuté sur master et dev. Utilise le cache NPM et npm ci pour des builds rapides.

- **Build :** Exécuté uniquement sur master. Construit et pousse les images Docker vers Docker Hub, taguées avec le nom de la branche (ex: :master).

- **Release :** Automatisé via semantic-release sur la branche master pour gérer les versions et les changelogs.

### 📦 Architecture Docker

- **mongodb :** Base de données avec persistance.

- **backend :** API NestJS isolée dans le réseau interne.

- **frontend :** Client React/Vite.

#### Contributeurs
- [Dufrène Valérian | Entreprise Webdevoo](https://webdevoo.com)