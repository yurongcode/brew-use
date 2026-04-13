# brew-use

Homebrew mirror source manager — one command to switch between mirrors.

[中文文档](./README_CN.md)

## Features

- One command to switch Homebrew mirror sources
- Config persists across shell sessions
- Supports TUNA, USTC, Aliyun, Tencent, BFSU mirrors
- Zero dependencies (pure shell script)
- Install via Homebrew or curl

## Install

### Homebrew (recommended)

```bash
brew tap yurongcode/brew-use
brew install brew-use
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/yurongcode/brew-use/main/install.sh | bash
```

## Setup

Add this line to your `~/.zshrc` or `~/.bashrc`:

```bash
eval "$(brew-use init)"
```

Then reload your shell:

```bash
source ~/.zshrc   # or source ~/.bashrc
```

## Usage

### Switch mirror

```bash
brew-use tuna       # Switch to TUNA (清华)
brew-use ustc       # Switch to USTC (中科大)
brew-use aliyun     # Switch to Aliyun (阿里云)
brew-use tencent    # Switch to Tencent (腾讯云)
brew-use bfsu       # Switch to BFSU (北外)
brew-use default    # Reset to official source
```

### Other commands

```bash
brew-use list       # List available mirrors
brew-use current    # Show current mirror
brew-use help       # Show help
brew-use --version  # Show version
```

### Without init (one-shot)

If you don't want shell integration, you can use eval directly:

```bash
eval "$(brew-use set tuna)"    # Switch for current session only
```

## Available Mirrors

| Name | Mirror | Provider |
|------|--------|----------|
| `tuna` | mirrors.tuna.tsinghua.edu.cn | 清华大学 |
| `ustc` | mirrors.ustc.edu.cn | 中国科学技术大学 |
| `aliyun` | mirrors.aliyun.com | 阿里云 |
| `tencent` | mirrors.cloud.tencent.com | 腾讯云 |
| `bfsu` | mirrors.bfsu.edu.cn | 北京外国语大学 |
| `default` | github.com | Homebrew 官方 |

## How it works

`brew-use` manages four environment variables that Homebrew reads:

- `HOMEBREW_API_DOMAIN`
- `HOMEBREW_BOTTLE_DOMAIN`
- `HOMEBREW_BREW_GIT_REMOTE`
- `HOMEBREW_CORE_GIT_REMOTE`

When you run `brew-use <mirror>`:

1. The mirror's URLs are written to `~/.brew-use.conf` (persists across sessions)
2. The environment variables are set in the current shell (immediate effect)

## Add a new mirror

Edit the `MIRROR_DATA` variable in `bin/brew-use`, add a line following this format:

```
name|Label|api_domain|bottle_domain|brew_git_url|core_git_url
```

PRs welcome!

## License

MIT
