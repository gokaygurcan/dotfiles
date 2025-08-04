# dotfiles

My dotfiles and shell scripts.

---

Make sure you're logged in to your Apple Account first. Click ` > System Settings` and then follow the instructions. Otherwise, `mas` will fail at the end of `brew bundle` command.

```bash
sudo softwareupdate &>/dev/null || sudo softwareupdate --install --all --agree-to-license --verbose
curl -sSL https://raw.githubusercontent.com/gokaygurcan/dotfiles/HEAD/bootstrap.sh | sh
```
