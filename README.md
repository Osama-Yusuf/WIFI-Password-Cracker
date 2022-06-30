# WIFI Password Cracker

**WIFI Password Cracker** is a **BASH** script which can be used for Wireless Penetration Testing: Password Cracking.
The objective of this script is to capture the WPA/WPA2 authentication handshake and then use **Aircrack-ng** to crack the pre-shared key, by deauthenticating an existing wireless client. 

You can take a look at the [GitHub project page](https://github.com/Osama-Yusuf/WIFI-Password-Cracker).

**Why use this script?**

* **Analyze Wi-Fi networks for weaknesses**
* **Secure & strengthen your Wi-Fi password**

## Getting started

Download the script manually and give it execution permission using this command: (recommended)

```bash
curl "https://raw.githubusercontent.com/Osama-Yusuf/WIFI-Password-Cracker/main/crack_wifi.sh" -o crack_wifi.sh && chmod +x crack_wifi.sh
```

## Usage

First copy it to the binaries folder to run it as a command without the extension (.sh)

```
sudo cp crack_wifi.sh /usr/bin/crack-wifi
```

You can delete the script now if you want.

```
rm -f crack_wifi.sh
```

Then execute the script and let it do all the work:

```
crack-wifi
```

or

```
source crack_wifi.sh
```

### Note: that for windows you need to have the following requirments:

1- Aircrack-ng installed, You can download it from: https://www.aircrack-ng.org/
2- you need to have a handshake capture file (.cap), you can capture it on windows by using commview, To achive this requirement watch this: https://youtu.be/2BffQsIDh48

## Tested Environments

* Ubuntu Os.
* Windows 11.

If you have successfully tested this script on others systems or platforms please let me know!

## Donations

 If you want to support this project, please consider donating:
 * PayPal: https://paypal.me/OsamaYusuf
 * Buy me a coffee: https://www.buymeacoffee.com/OsamaYusuf
 * ETH: 0x507bF8931b534a81Ced18FDf8fc5BE4Daf08332B

---

* `By Osama-Yusuf`
* `Thanks for reading`

-------
##### Report bugs for "WIFI-Password-Cracker"
* `osama9mohamed5@gmail.com`
