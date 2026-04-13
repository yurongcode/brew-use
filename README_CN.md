# brew-use

Homebrew 镜像源管理工具 — 一行命令快速切换镜像源。

[English](./README.md)

## 功能特性

- 一行命令切换 Homebrew 镜像源
- 配置跨终端会话持久化
- 支持清华、中科大、阿里云、腾讯云、北外等镜像
- 零依赖（纯 Shell 脚本）
- 支持 npm、Homebrew、curl 三种安装方式

## 安装

### npm（推荐）

```bash
npm install -g brew-use
```

### Homebrew

```bash
brew tap yurongcode/brew-use
brew install brew-use
```

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/yurongcode/brew-use/main/install.sh | bash
```

## 初始化

将以下内容添加到 `~/.zshrc` 或 `~/.bashrc`：

```bash
eval "$(brew-use init)"
```

然后重新加载终端：

```bash
source ~/.zshrc   # 或 source ~/.bashrc
```

## 使用方法

### 切换镜像源

```bash
brew-use tuna       # 切换到清华源
brew-use ustc       # 切换到中科大源
brew-use aliyun     # 切换到阿里云源
brew-use tencent    # 切换到腾讯云源
brew-use bfsu       # 切换到北外源
brew-use default    # 恢复官方源
```

### 其他命令

```bash
brew-use list       # 查看可用镜像列表
brew-use current    # 查看当前使用的镜像
brew-use help       # 查看帮助信息
brew-use --version  # 查看版本号
```

### 免初始化（临时生效）

如果不想配置 shell 集成，也可以直接使用 eval：

```bash
eval "$(brew-use set tuna)"    # 仅当前会话生效
```

## 支持的镜像源

| 名称 | 镜像地址 | 提供方 |
|------|----------|--------|
| `tuna` | mirrors.tuna.tsinghua.edu.cn | 清华大学 |
| `ustc` | mirrors.ustc.edu.cn | 中国科学技术大学 |
| `aliyun` | mirrors.aliyun.com | 阿里云 |
| `tencent` | mirrors.cloud.tencent.com | 腾讯云 |
| `bfsu` | mirrors.bfsu.edu.cn | 北京外国语大学 |
| `default` | github.com | Homebrew 官方 |

## 工作原理

`brew-use` 通过管理 Homebrew 读取的四个环境变量来切换镜像：

- `HOMEBREW_API_DOMAIN`
- `HOMEBREW_BOTTLE_DOMAIN`
- `HOMEBREW_BREW_GIT_REMOTE`
- `HOMEBREW_CORE_GIT_REMOTE`

执行 `brew-use <镜像名>` 时：

1. 镜像地址写入 `~/.brew-use.conf`（持久化，新终端自动生效）
2. 当前终端的环境变量立即更新（即时生效）

## 添加新镜像

编辑 `bin/brew-use` 中的 `MIRROR_DATA` 变量，按以下格式添加一行：

```
name|Label|api_domain|bottle_domain|brew_git_url|core_git_url
```

欢迎提交 PR！

## 许可证

MIT
