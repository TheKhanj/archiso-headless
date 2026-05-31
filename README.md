# archiso-headless

Minimal modification of the official Arch Linux ISO that enables SSH access in the live environment by setting a root password.

This is designed for headless machines where local input or display is not available.

---

## Why

Default Arch ISO enables SSH, but root login is unusable because no password is set.

This project fixes that by setting a root password so you can SSH in immediately during installation.

---

## Default credentials (prebuilt ISO)

- user: root
- password: root

---

## Build

### Build with default password

```bash
make iso
```
### Build with custom password
```bash
make iso ROOT_PASSWORD=my_password
```

---

## Clean
```bash
make clean
```

---

## Usage

After boot:

```bash
ssh root@<ip-address>
```
