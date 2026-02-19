# qrstash

Stash and display QR codes from your terminal.

Save QR code data locally and display them instantly in your terminal whenever you need to scan them. No apps, no browser — just a command.

## Demo

![qrstash demo](demo.gif)

## Dependencies

- [qrencode](https://github.com/fukuchi/libqrencode) — Install with `brew install qrencode`

## Installation

### Homebrew

```bash
brew install arnoldplakolli/tap/qrstash
```

### Manual

```bash
git clone https://github.com/arnoldplakolli/qrstash.git
cd qrstash
./install.sh
```

Or with make:

```bash
make install
```

Then add the following to your `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"

# Optional: enable tab completions
fpath=($HOME/.zsh/completions $fpath)
autoload -Uz compinit && compinit
```

## Usage

```bash
# Add a QR code
qrstash add myapp "https://example.com/login?token=abc123"

# Display it in the terminal
qrstash show myapp

# View the raw data
qrstash read myapp

# Update it
qrstash update myapp "https://example.com/login?token=xyz789"

# Rename it
qrstash rename myapp my-app

# Export as PNG
qrstash export my-app qr.png

# List all saved QR codes
qrstash list

# Delete it
qrstash delete my-app
```

## How it works

QR code data is stored as individual files in `~/.qrstash/`, each with `600` permissions (owner read/write only). When you run `qrstash show`, it reads the file and pipes the content through `qrencode` to render the QR code directly in your terminal using Unicode characters.

## Security

- QR code data is stored in `~/.qrstash/` with `600` permissions (owner read/write only)
- The data directory has `700` permissions
- Names are restricted to letters, digits, hyphens, and underscores
- No data is sent over the network — everything stays local

## Troubleshooting

**qrencode: command not found**
Install with: `brew install qrencode` (macOS) or your system's package manager.

**Completions not working**
Make sure your `~/.zshrc` has fpath configured before `compinit`:
```zsh
fpath=($HOME/.zsh/completions $fpath)
autoload -Uz compinit && compinit
```
Then restart your shell.

**QR code not scanning**
Ensure your terminal font is monospaced and supports Unicode block characters. Try increasing the font size or zooming in if the code is too small.

## Uninstall

```bash
make uninstall
```

To also remove your saved QR codes:

```bash
rm -rf ~/.qrstash
```

## License

[MIT](LICENSE)
