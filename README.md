# WiFi Password Viewer

A Windows batch script that displays all saved WiFi network passwords on your computer.

## Description

This script retrieves and displays a list of all wireless networks that have ever been connected to your Windows computer, along with their saved passwords. It uses Windows built-in `NETSH` commands to extract this information.

## Features

- 📡 Lists all saved WiFi networks
- 🔑 Displays passwords for each network
- 🎨 Color-coded output for better readability
- 🔒 Works with networks that have special characters in their names
- 💾 Uses temporary files for processing

## Requirements

- Windows operating system
- Administrator privileges (may be required for some networks)
- PowerShell (for colored output)

## Usage

1. **Download the script** to your computer
2. **Right-click** on the `.bat` file
3. **Select "Run as administrator"** (recommended for full access)
4. **View the results** - all networks and passwords will be displayed
5. **Press any key** to exit when done

## Output Format

The script displays information in the following format:

```
--- Wireless network name:-----> . . . . 'NetworkName'
--- Password:------------------> . . . . 'password123'
```

## How It Works

1. Uses `NETSH WLAN SHOW PROFILE` to list all saved WiFi profiles
2. For each profile, runs `NETSH WLAN SHOW PROFILE [name] KEY=CLEAR` to get the password
3. Parses the output to extract network names and passwords
4. Displays results with colored formatting using PowerShell

## Security Notes

⚠️ **Important Security Information:**
- This script reveals saved WiFi passwords in plain text
- Only run this on your own computer
- Be cautious about who can see your screen when running
- Passwords are displayed without any encryption
- Consider closing the window immediately after viewing

## Technical Details

- Written in Windows Batch Script
- Uses delayed expansion for variable handling
- Handles special characters in network names (quotes, apostrophes)
- Creates temporary files in `%TEMP%` directory with random names
- Color output via PowerShell `write-host` commands

## Author

Written by **Ori Halevi**

## License

This script is provided as-is for personal use.

## Troubleshooting

**No networks showing up?**
- Try running as administrator
- Ensure you have connected to WiFi networks on this computer before

**Error messages appearing?**
- Make sure WiFi adapter is enabled
- Check if Windows WLAN service is running

**Special characters in network names causing issues?**
- The script handles quotes and apostrophes automatically
- If issues persist, the network profile may need manual inspection

## Disclaimer

This tool is for personal use to recover your own WiFi passwords. Use responsibly and ethically. The author is not responsible for any misuse of this script.

---

**Note:** This script only works on Windows and requires that the WiFi networks were previously connected on the same computer.
