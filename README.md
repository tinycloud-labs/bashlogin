# Bash Login

A lightweight login banner for Bash that displays system information. It can be integrated  with `.bashrc` to display helpful messages in an elegant way for the services you want. Useful on remote servers.


Default display at login:
- system information
- users sessions

Optional items
- show systemd service status (by supplying service names as args)
- customizable banner style via [Figlet](https://www.figlet.org) fonts

> [!NOTE]
> Figlet only detects fonts installed locally, typically located in: `/usr/share/figlet/`. Install additional fonts via your package manager or manually add `.flf` files to that directory.

## Usage

Clone the repository:

```bash
git clone https://github.com/tinycloud-labs/bashlogin.git ~/.config/bashlogin
```

Add this line to your `~/.bashrc`:

```bash
source "$HOME/.config/bashlogin/main.sh"
```

Reload your shell:

```bash
source ~/.bashrc
```

### Optional Configuration

In `~/.bashrc`, export `BASHLOGIN_ARGS`:
- [Optional] Use the `--style <figletStyleName>` to use custom Figlet style
- Supply the service names (must be in systemd units)

Example:
```bash
BASHLOGIN_ARGS="--style big ssh docker k3s-agent"
```

> [!TIP]
> Note that `--style <arg>` is not positional, it can be placed anywhere in the line
