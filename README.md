# KSPSerialIO-cross

This is a fork of the [KSPSerialIO](http://forum.kerbalspaceprogram.com/index.php?/topic/60281-hardware-plugin-arduino-based-physical-display-serial-port-io-tutorial-22-april/)
plugin for Kerbal Space Program. KSPSerialIO provides a serial interface for
KSP. This fork of the plugin runs on MacOS and is customized by hugopeeters for use with his KerbalController.

## What doesn't work (yet)?

* Automatic port detection. You'll need to explicitly set a serial port in the `config.xml`.
* After EVA, the buttons work, but the analog inputs (rotation, translation, throttle) do not.
* On initial load of the game, the first time a vessel is loaded, it does not respond to the controller. After one reload of the vessel (revert to launch for example) it does.
* When SAS is on, rotation and translation is impossible. When using native inputs, you can control the vessel better with SAS on. The mod now temporarily disables SAS while you are steering.

## License

Like the original plugin, this code is licensed under [CC-BY](https://creativecommons.org/licenses/by/4.0/).
