# workstation

## Bootstrapping

For a new Debian Bookwork installation, disable the CDROM repository
by commenting the appropriate line out in /etc/apt/sources.list

```
sudo apt install curl
curl -s https://raw.githubusercontent.com/selesy/workstation/bookworm/bootstrap.sh | bash
```

When the bootstrapping script exits, follow the instructions at the
end of the script's output.
