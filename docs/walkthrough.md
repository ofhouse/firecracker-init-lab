# Walkthrough

- Setup networking

  ```
  ./setup-networking.sh
  ```

- Rebuild Kernel and image

  ```
  make all
  ```

- Terminal 1:

  ```
  make start
  ```

- Terminal 2:
  ```
  make boot
  ```

## Troubleshooting

- Kill firecracker
  ```
  sudo killall firecracker
  ```
