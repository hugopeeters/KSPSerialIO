# KSPSerialIO-cross

This is a fork of the [KSPSerialIO](http://forum.kerbalspaceprogram.com/index.php?/topic/60281-hardware-plugin-arduino-based-physical-display-serial-port-io-tutorial-22-april/)
plugin for Kerbal Space Program. KSPSerialIO provides a serial interface for
KSP. This fork of the plugin runs on MacOS and is customized by hugopeeters for use with his KerbalController.

Furtherly modified by gargrag, to be used on macOS, with a custom controller, and a Steam installation of the game.

## Building on macOS (Former OSX)
In order to build this you will need to have installed [brew package manager](https://brew.sh/).
1. Install mono libraries by running `brew install mono`
1. If you have the game installed with Steam, then there's no change required, if you have the game installed with a different method, you will need to modify the `INSTALLDIR` variable on the `Makefile`.

1. `make` command will use `msbuild` (xbuild is being deprecated). to build the image. 

1. `make install` command will copy the plugin and configuration into the respective game directories.

If you need to start from scratch again, you can use `make clean` to clean up the enviroment by deleting all the generated artifacts.

## Changing the configuration
In order for this plugin to work correctly, you will need to specify the serial port assigned to your arduino board on the `config.xml` file, as well as the Baud rate and handshake delay.

Once you have the right configuration, you can run `make install` again, to copy the `config.xml` file to the proper destination.

### Detecting the serial port
An easy way to detect this, is to connect your arduino board to your computer, open the [arduino IDE](https://www.arduino.cc/en/main/software), press `command + shift + M` and note the path on the serial monitor title bar. For example `/dev/cu.usbmodem14601`

![Screen Shot 2020-06-22 at 5 47 01 PM](https://user-images.githubusercontent.com/967311/85348595-ea843c80-b4b0-11ea-893a-3ab5afe80678.png)

## Verification
To verify that the plugin is being loaded, and that is successfully communicating with your Arduino board, you can check the Kerbal Space Program log. 

For macOS and Steam installation, it's located in ` ~/Library/Application\ Support/Steam/steamapps/common/Kerbal\ Space\ Program/KSP.log` 

So you can run `tail -f  ~/Library/Application\ Support/Steam/steamapps/common/Kerbal\ Space\ Program/KSP.log` on a terminal, this will keep showing the last lines of the file.

And with that terminal open, and the `tail` command running, open the game. At some point you will see something like:

```
[LOG 22:22:37.071] [AddonLoader]: Instantiating addon 'KSPSerialPort' from assembly 'KSPSerialIO'
[LOG 22:22:37.077] KSPSerialIO: Version 0.18.7.0
[LOG 22:22:37.077] KSPSerialIO: Getting serial ports...
[LOG 22:22:37.077] KSPSerialIO: Output packet size: 200/255
[LOG 22:22:37.082] KSPSerialIO: Dude do you even win32 serial port??
[LOG 22:22:37.082] KSPSerialIO: Found 1 serial ports
[LOG 22:22:37.082] KSPSerialIO: trying default port /dev/cu.usbmodem14601
[LOG 22:22:37.085] KSPSerialIO: Serial Worker thread started
[LOG 22:22:37.086] KSPSerialIO: Trying to read port that isn't open. Sleeping
[LOG 22:22:39.603] KSPSerialIO: Handshake received - 314
[LOG 22:22:39.695] KSPSerialIO-hp: found KSP Display at /dev/cu.usbmodem14601
```

This means that the game is loading the plugin, and that it's talking with your Arduino board. Otherwise, you will see the error, and from there you will need to debug.



## What doesn't work (yet)

* Automatic port detection, you will need to specify this on the `config.xml` every time.

## License

Like the original plugin, this code is licensed under [CC-BY](https://creativecommons.org/licenses/by/4.0/).
