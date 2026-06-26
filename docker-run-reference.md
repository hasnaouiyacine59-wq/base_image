# Docker Run Reference — ubuntu-vnc-xfce

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `5901` | TCP | VNC server (TigerVNC) |
| `6901` | TCP | noVNC web browser access (HTTP) |

## Basic Run

```bash
docker run -d \
  -p 5901:5901 \
  -p 6901:6901 \
  accetto/ubuntu-vnc-xfce
```

Access noVNC in browser: `http://localhost:6901`

## Password

Default VNC password is **`headless`** (set via `VNC_PW` env var).

```bash
docker run -d \
  -p 5901:5901 \
  -p 6901:6901 \
  -e VNC_PW=mysecretpassword \
  accetto/ubuntu-vnc-xfce
```

## ENV Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `VNC_PW` | `headless` | VNC/noVNC password |
| `VNC_RESOLUTION` | `1360x768` | Screen resolution |
| `VNC_COL_DEPTH` | `24` | Color depth |
| `VNC_VIEW_ONLY` | `false` | Set `true` for read-only access |
| `VNC_BLACKLIST_THRESHOLD` | `20` | Failed login attempts before blacklist |
| `VNC_BLACKLIST_TIMEOUT` | `0` | Blacklist timeout in seconds |
| `HOME` | `/home/headless` | Container home directory |

## Full Example

```bash
docker run -d \
  -p 5901:5901 \
  -p 6901:6901 \
  -e VNC_PW=mypassword \
  -e VNC_RESOLUTION=1920x1080 \
  -e VNC_VIEW_ONLY=false \
  accetto/ubuntu-vnc-xfce
```
