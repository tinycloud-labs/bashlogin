# Bash Login

A lightweight login banner for Bash that displays system information. It can be integrated  with `.bashrc` to display helpful messages in an elegant way for the services you want. Useful on remote servers.

![screenshot](image-1.png)

Default display at login:
- system information
- user sessions

Optional items
- show systemd service status (by supplying service names as args)
- customizable banner style

Requires [Figlet](https://www.figlet.org). Usually installed by default on major Linux distros and MacOS.

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

### Optional configuration
You can change the Figlet style and provide systemd service unit names to print.

In `~/.bashrc`, export `BASHLOGIN_ARGS`:
- Supply the service names (must be in systemd units)
- Optionally, use the `--style <FigletStyleName>` to change the Figlet style

> [!TIP]
> The `--style <arg>` is not a positional arg, it can be placed anywhere in the line

Example:
```bash
BASHLOGIN_ARGS="--style big ssh docker k3s-agent"
```
