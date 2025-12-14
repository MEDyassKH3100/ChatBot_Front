# ChatBot Frontend – Application Mobile Compagnon avec Interface Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev/)  
[![Dart](https://img.shields.io/badge/Dart-3.x-blue.svg)](https://dart.dev/)  
[![Gemini API](https://img.shields.io/badge/Gemini%20API-Google-orange.svg)](https://ai.google.dev/)

## 📖 Description

Ce projet est le **frontend mobile** d'une plateforme de chatbot intelligente pour le service client, développé lors de mon stage **Full-Stack Mobile Developer** à l'**ESPRIT** (juillet-septembre 2024, Ariana, Tunisie).

L'application est construite avec **Flutter** pour une expérience cross-platform (Android & iOS) fluide et responsive. Elle communique avec le backend Node.js/Express pour afficher les conversations en temps réel, envoyer des messages et recevoir des réponses générées par l'**API Gemini** (Google).

Ce frontend complète le backend (repo sœur : [ChatBot Backend](https://github.com/MEDyassKH3100/ChatBot-Backend)).

### Fonctionnalités clés
- **Interface chat intuitive** : Affichage des messages (utilisateur et IA), saisie rapide et historique des conversations.
- **Intégration IA** : Envoi des messages au backend et réception des réponses Gemini en temps réel.
- **Responsive & user-friendly** : Design moderne adapté mobile, avec gestion du clavier et loading states.
- **Gestion d'état** : State management efficace (Provider, Riverpod ou Bloc selon implémentation).
- **Offline support** : Cache local des conversations pour une expérience fluide.

## 🛠️ Technologies utilisées

- **Framework mobile** : Flutter (cross-platform Android/iOS)
- **Langage** : Dart
- **Intégration IA** : Appel API Gemini via le backend Node.js
- **Gestion d'état** : Provider / Riverpod / Bloc (selon choix)
- **Outils** : Flutter DevTools, Android Studio / VS Code

## 📁 Structure du projet

```
ChatBot_Front/
├── lib/
│   ├── main.dart            # Point d'entrée de l'application
│   ├── screens/             # Écrans principaux (ChatScreen, HomeScreen)
│   ├── widgets/             # Composants réutilisables (MessageBubble, InputField)
│   ├── models/              # Modèles de données (Message, Conversation)
│   ├── services/            # API calls (HttpClient vers backend)
│   ├── providers/           # Gestion d'état (si Provider/Riverpod)
│   └── utils/               # Fonctions utilitaires (constants, themes)
├── assets/                  # Images, icônes
├── pubspec.yaml             # Dépendances Flutter
└── README.md
```

## 🚀 Installation & Utilisation

### Prérequis
- Flutter SDK (version 3.x ou supérieure)
- Android Studio ou VS Code avec extensions Flutter
- Un émulateur Android/iOS ou appareil physique

### Étapes d'installation

1. Cloner le repository :
   ```bash
   git clone https://github.com/MEDyassKH3100/ChatBot_Front.git
   cd ChatBot_Front
   ```

2. Installer les dépendances :
   ```bash
   flutter pub get
   ```

3. Configurer l'URL du backend dans le code (ex : dans `services/api_service.dart`) :
   ```dart
   const String BASE_URL = 'http://localhost:5000'; // Ou votre URL déployée
   ```

4. Lancer l'application :
   ```bash
   flutter run
   ```

L'application se lancera sur votre émulateur ou appareil connecté.

### Test
- Ouvrez l'app → Tapez un message → La réponse Gemini s'affiche en temps réel (si backend lancé).

## 📊 Démonstration

- **Application mobile** : Interface chat moderne avec réponses IA contextuelles.
- **Intégration complète** : Fonctionne avec le backend Node.js pour persistance et intelligence Gemini.

## 🤝 Contribution

Les issues et pull requests sont les bienvenus ! N'hésitez pas à proposer des améliorations (UI, nouvelles fonctionnalités, etc.).



## 📞 Contact

**Mohamed Yassine Khlaf**  
[LinkedIn](https://www.linkedin.com/in/mohamed-yassine-khlaf-526ba725b/) | [GitHub](https://github.com/MEDyassKH3100)  
mohamedyassine.khlaf@esprit.tn

---

*Projet réalisé en stage Full-Stack Mobile à ESPRIT – Frontend Flutter pour un chatbot service client avec intégration IA Gemini.*
