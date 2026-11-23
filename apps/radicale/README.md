# Radicale

轻量级的 CalDAV 与 CardDAV 服务器，用来同步日历和联系人。

![Radicale](https://file.lifebus.top/imgs/radicale_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Radicale 是一个小巧、易用的自托管 CalDAV 与 CardDAV 服务器，使用 Python 编写。它把日历和联系人保存在自己的服务器上，不依赖第三方云服务，兼容 iOS、macOS、Android、Thunderbird 等支持 CalDAV / CardDAV 的客户端。

数据以文件形式保存在本地，无需数据库，资源占用低，适合个人或家庭使用。

## 特性

- 完整的 CalDAV 与 CardDAV 协议支持
- 基于文件系统的存储，无需数据库，便于备份与迁移
- 内置账号认证与权限控制
- 自带简易 Web 界面，可直接查看和管理日历集合
- 单容器部署，资源占用低

## 安装说明

### 默认账号

| 用户名 | 密码 |
| --- | --- |
| `admin` | `radicale` |

用户名与密码可在安装表单中修改。密码以 `plain` 方式保存在 `config/users` 中，请务必在安装时设置强密码；安装后也可以直接编辑该文件，然后重启容器生效。

### 访问地址

- 服务地址：`http://<服务器 IP>:<端口>`，默认端口 `5232`
- CalDAV 地址：`http://<服务器 IP>:5232/<用户名>/`
- CardDAV 地址：`http://<服务器 IP>:5232/<用户名>/`

首次使用时，客户端会在对应用户目录下自动创建默认的日历与通讯录集合。

### 目录说明

| 挂载路径 | 用途 |
| --- | --- |
| `${RADICALE_ROOT_PATH}/config` → `/etc/radicale`（只读） | 配置文件 `config` 与用户文件 `users` |
| `${RADICALE_ROOT_PATH}/data` → `/var/lib/radicale` | 日历、联系人等数据 |

`RADICALE_ROOT_PATH` 默认为 `/opt/radicale`。升级或重建容器时请保留该目录。

### 用户管理

用户文件 `config/users` 每行一个账号，格式为 `用户名:密码`，与配置文件中的 `htpasswd_encryption = plain` 对应。添加用户时直接追加一行后重启容器即可。

如需更安全的密码存储，可将 `config/config` 中的 `htpasswd_encryption` 改为 `bcrypt`，并使用 `htpasswd -B -n <用户名>` 生成密码行后写入 `users` 文件。

### 客户端配置

- **iOS / macOS**：设置 → 日历 → 账户 → 添加账户 → 其他 → 添加 CalDAV 账户，服务器地址填写 `http://<服务器 IP>:5232`，再填写用户名和密码。
- **Android**：使用 DAVx⁵ 添加账户，URL 填写 `http://<服务器 IP>:5232`。
- **Thunderbird**：新建日历 → 网络上 → CalDAV，地址填写 `http://<服务器 IP>:5232/<用户名>/`。

> 通过公网访问时，建议在前面加一层反向代理并启用 HTTPS，避免账号密码以明文传输。

## 相关链接

- [官方网站](https://radicale.org/)
- [官方文档](https://radicale.org/v3.html)
- [开源地址](https://github.com/Kozea/Radicale)

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
