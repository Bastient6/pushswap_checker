# 🧩 Pushswap Checker

## 🎯 Description
**pushswap_checker** est un programme en **Haskell** qui vérifie si une suite d’opérations `push_swap` trie correctement une liste d’entiers.  
Il simule les deux piles `l_a` et `l_b` et applique les commandes pour déterminer si le résultat final est trié.

---

## ⚙️ Utilisation
```bash
./pushswap_checker <list of integers>
```

Le programme lit une ligne d’instructions depuis l’entrée standard (séparées par des espaces).

### ✅ Exemple
```bash
echo "sa pb pb pb sa pa pa pa" | ./pushswap_checker 2 1 3 6 5 8
```
**Sortie :**
```
OK
```

### ❌ Exemple
```bash
echo "sa pb pb pb" | ./pushswap_checker 2 1 3 6 5 8
```
**Sortie :**
```
KO: ([6,5,8],[3,2,1])
```

---

## 🧠 Règles
- Si la liste `l_a` est triée et `l_b` vide → affiche **OK**
- Sinon → affiche **KO**
- En cas d’erreur d’entrée → affiche un message sur **stderr** et retourne le code **84**
- Sinon, le programme retourne **0**

---

## 🛠️ Compilation
Le projet se compile via un **Makefile** avec les règles :
```bash
make        # compile
make clean  # supprime les fichiers temporaires
make fclean # supprime les binaires
```

> Outil de build libre — `stack` recommandé.

---

## 💡 Bonus
En bonus, vous pouvez implémenter un vrai **push_swap** en Haskell (le générateur d’opérations).

---

## 📁 Structure conseillée
```
.
├── Makefile
├── src/
│   └── Main.hs
├── bonus/
│   └── ...
└── README.md
```

---

## 👨‍💻 Auteur
Projet **RUSH 1 - pushswap_checker**  
