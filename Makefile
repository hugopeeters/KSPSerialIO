export PATH := /usr/local/bin:$(PATH)
XBUILD=msbuild
# You can use "Debug" for a debug build.
CONFIG=Release

# This is the default dir for a Steam installation.
KSPDIR=$(shell echo ~)/Library/Application\ Support/Steam/steamapps/common/Kerbal\ Space\ Program
INSTALLDIR=$(KSPDIR)/GameData/KSPSerialIO
CONFIGDIR=$(INSTALLDIR)/PluginData/KSPSerialIO

PLUGINVERSION=$(shell egrep "^\[.*AssemblyVersion" KSPSerialIO/Properties/AssemblyInfo.cs|cut -d\" -f2)
PACKAGEDIR=package/KSPSerialIO
PACKAGECONFIGDIR=$(PACKAGEDIR)/PluginData/KSPSerialIO

all: KSPSerial.dll

KSPSerial.dll:
	$(XBUILD) /p:Configuration=$(CONFIG)

install:
	mkdir -p $(INSTALLDIR)
	mkdir -p $(CONFIGDIR)
	cp KSPSerialIO/bin/$(CONFIG)/KSPSerialIO.dll $(INSTALLDIR)
	cp KSPSerialIO/bin/$(CONFIG)/PsimaxSerial.dll $(INSTALLDIR)
	#cp ../PsiMaxSerial/PsiMaxSerial/Release/Mono.Posix.dll $(INSTALLDIR)
	cp config.xml $(CONFIGDIR)

clean:
	$(XBUILD) /p:Configuration=$(CONFIG) /t:Clean

package: all
	mkdir -p $(PACKAGECONFIGDIR)
	mkdir -p KSPSerialIO/bin/$(CONFIG)
	cp KSPSerialIO/bin/$(CONFIG)/KSPSerialIO.dll $(PACKAGEDIR)
	cp KSPSerialIO/bin/$(CONFIG)/PsimaxSerial.dll $(PACKAGEDIR)
	cp config.xml $(PACKAGECONFIGDIR)
	cd package; zip -r -9 ../KSPSerialIO-cross-$(PLUGINVERSION).zip KSPSerialIO
	rm -r package
	echo $(PLUGINVERSION) > KSPSerialIO.version

