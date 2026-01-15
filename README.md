# dotfiles

My dotfiles and shell scripts.

---

## macOS

Make sure you're logged in to your Apple Account first. Click ` > System Settings` and then follow the instructions. Otherwise, `mas` will fail at the end of `brew bundle` command. 

It's better to check and install any available software updates beforehand:

```bash
sudo softwareupdate &>/dev/null || sudo softwareupdate --install --all --agree-to-license --verbose
```

## Bootstrap

```bash
curl -sSL https://raw.githubusercontent.com/gokaygurcan/dotfiles/HEAD/bootstrap.sh | sh
```
