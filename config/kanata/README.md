# Set up Kanata

- source: [How to use Kanata from Homebrew and LaunchCtl for macOS](https://github.com/jtroo/kanata/discussions/1537)

## Edit startup files for LaunchCtl

copy the files
make sure they are owned by root wheel

```sh
sudo cp .com.example.ka* /Library/LaunchDaemons/
```

## Configure starting Kanata for LaunchCtl

Execute the following command in your terminal:

```sh
sudo launchctl bootstrap system /Library/LaunchDaemons/com.example.kanata.plist
sudo launchctl enable system/com.example.kanata.plist
```

Kanata will start on reboot with those commands. If you want to start kanata manually now:

```sh
sudo launchctl start com.example.kanata
```
