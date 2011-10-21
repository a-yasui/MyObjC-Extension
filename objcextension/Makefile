Configuration = Release
xcodebuild    = xcodebuild
MacFramework  = MacFramework-$(Configuration)

help:
		@echo "create the frameworks"
		@echo "  iOS: iOS Framework create."
		@echo "  Mac: Mac Framework create."
		@echo "  all: All framework create."
		@echo " Options: "
		@echo "   Configuration: Set compile configuration, you choise Release or Debug. now:${Configuration}"
									

clean:
	-rm -rf build
	-rm -rf iOSframework-*
	-rm -rf MacFramework-*
	@echo "done"

createdir: 
	-mkdir framework-{Release,Debug}

iOS:
	$(xcodebuild) -target ATYSExt_iOS_framework -configuration $(Configuration)

Mac:
	$(xcodebuild) -target objcextension -configuration $(Configuration)
	[ ! -d "$(MacFramework)" ] && mkdir $(MacFramework);
	[ -d 'build/Release/objcextension.framework/' ] && cp -R 'build/Release/objcextension.framework' $(MacFramework)/

all: iOS Mac
	@echo "done"


