# Git Cheatsheet — Lesson 0

Commands used during environment setup.

---

## Basic Workflow

| Command | What it does |
|---------|-------------|
| `git clone <url>` | Download repository from GitHub to local machine |
| `git status` | Show modified/untracked files |
| `git add <file>` | Stage file for commit |
| `git add .` | Stage all changes in current directory |
| `git commit -m "message"` | Save snapshot with a descriptive message |
| `git push origin main` | Upload commits to GitHub |
| `git pull origin main` | Download latest changes from GitHub |
| `git log` | View commit history |

---

## Configuration

| Command | What it does |
|---------|-------------|
| `git config --global user.name "name"` | Set commit author name |
| `git config --global user.email "email"` | Set commit author email |
| `git config --global credential.helper store` | Remember password/token permanently |
| `git remote -v` | Show remote repository URL |

---

## Authentication (GitHub)

GitHub no longer accepts passwords for Git operations.

| Method | How |
|--------|-----|
| **Personal Access Token** | Settings → Developer settings → Tokens → Generate new token (classic) → select `repo` scope |
| **Usage** | When prompted for password, paste the token instead |

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `Authentication failed` | Token is invalid or expired. Generate a new one. |
| `rejected: non-fast-forward` | Remote has newer commits. Run `git pull` first, then `git push`. |
| `nothing to commit, working tree clean` | All changes are already saved. |

---

## Commit Message Convention

| Prefix | Use when |
|--------|----------|
| `feat:` | Adding a new feature |
| `fix:` | Fixing a bug |
| `docs:` | Updating documentation |
| `chore:` | Routine tasks, setup |

Example:
```bash
git commit -m "lesson-00: add environment setup files"
