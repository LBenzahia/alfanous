; Script generated by the HM NIS Edit Script Wizard then Edited Manually.



; Costum define
!define ROOT_PATH "..\..\"



; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Alfanous"
!define PRODUCT_VERSION "0.7"
!define PRODUCT_PUBLISHER "Assem Chelli"
!define PRODUCT_WEB_SITE "http://www.alfanous.org"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\alfanousDesktop-win.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${ROOT_PATH}resources\AlfanousInstaller.ico"
!define MUI_UNICON "${ROOT_PATH}resources\AlfanousInstaller.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "license.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\alfanousDesktop-win.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
;!insertmacro MUI_LANGUAGE  "Albanian"
!insertmacro MUI_LANGUAGE  "Arabic"
;!insertmacro MUI_LANGUAGE  "Basque"
;!insertmacro MUI_LANGUAGE  "Belarusian"
;!insertmacro MUI_LANGUAGE  "Bosnian"
;!insertmacro MUI_LANGUAGE  "Breton"
;!insertmacro MUI_LANGUAGE  "Bulgarian"
;!insertmacro MUI_LANGUAGE  "Catalan"
;!insertmacro MUI_LANGUAGE  "Croatian"
;!insertmacro MUI_LANGUAGE  "Czech"
;!insertmacro MUI_LANGUAGE  "Danish"
;!insertmacro MUI_LANGUAGE  "Dutch"
!insertmacro MUI_LANGUAGE  "English"
;!insertmacro MUI_LANGUAGE  "Estonian"
!insertmacro MUI_LANGUAGE  "Farsi"
;!insertmacro MUI_LANGUAGE  "Finnish"
!insertmacro MUI_LANGUAGE  "French"
;!insertmacro MUI_LANGUAGE  "Galician"
;!insertmacro MUI_LANGUAGE  "German"
;!insertmacro MUI_LANGUAGE  "Greek"
;!insertmacro MUI_LANGUAGE  "Hebrew"
;!insertmacro MUI_LANGUAGE  "Hungarian"
;!insertmacro MUI_LANGUAGE  "Icelandic"
!insertmacro MUI_LANGUAGE  "Indonesian"
;!insertmacro MUI_LANGUAGE  "Irish"
;!insertmacro MUI_LANGUAGE  "Italian"
;!insertmacro MUI_LANGUAGE  "Japanese"
;!insertmacro MUI_LANGUAGE  "Korean"
;!insertmacro MUI_LANGUAGE  "Kurdish"
;!insertmacro MUI_LANGUAGE  "Latvian"
;!insertmacro MUI_LANGUAGE  "Lithuanian"
;!insertmacro MUI_LANGUAGE  "Luxembourgish"
;!insertmacro MUI_LANGUAGE  "Macedonian"
!insertmacro MUI_LANGUAGE  "Malay"
;!insertmacro MUI_LANGUAGE  "Mongolian"
;!insertmacro MUI_LANGUAGE  "Norwegian"
;!insertmacro MUI_LANGUAGE  "NorwegianNynor"
;!insertmacro MUI_LANGUAGE  "Polish"
;!insertmacro MUI_LANGUAGE  "Portuguese"
;!insertmacro MUI_LANGUAGE  "PortugueseBR"
;!insertmacro MUI_LANGUAGE  "Romanian"
;!insertmacro MUI_LANGUAGE  "Russian"
;!insertmacro MUI_LANGUAGE  "Serbian"
;!insertmacro MUI_LANGUAGE  "SerbianLatin"
;!insertmacro MUI_LANGUAGE  "SimpChinese"
;!insertmacro MUI_LANGUAGE  "Slovak"
;!insertmacro MUI_LANGUAGE  "Slovenian"
!insertmacro MUI_LANGUAGE  "Spanish"
;!insertmacro MUI_LANGUAGE  "Swedish"
;!insertmacro MUI_LANGUAGE  "Thai"
;!insertmacro MUI_LANGUAGE  "TradChinese"
!insertmacro MUI_LANGUAGE  "Turkish"
;!insertmacro MUI_LANGUAGE  "Ukrainian"
;!insertmacro MUI_LANGUAGE  "Uzbek"
;!insertmacro MUI_LANGUAGE  "Valencian"
;!insertmacro MUI_LANGUAGE  "Welsh"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "alfanousInstaller.exe"
InstallDir "$PROGRAMFILES\Alfanous"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails hide
ShowUnInstDetails hide



Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "Application" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
 # File "dist\mingwm10.dll"
  SetOverwrite try
  File "dist\bz2.pyd"
  File "dist\alfanousDesktop-win.exe"
  CreateDirectory "$SMPROGRAMS\Alfanous"
  CreateShortCut "$SMPROGRAMS\Alfanous\Alfanous.lnk" "$INSTDIR\alfanousDesktop-win.exe"
  CreateShortCut "$DESKTOP\Alfanous.lnk" "$INSTDIR\alfanousDesktop-win.exe"
  File "dist\*"
  SetOverwrite ifnewer
  File "license.txt"
  CreateShortCut "$STARTMENU.lnk" "$INSTDIR\license.txt"
SectionEnd



Section "Fonts" SEC02
  SetOutPath "$FONTS"
  
  SetOverwrite ifnewer
  File "${ROOT_PATH}\resources\fonts\*"

  
SectionEnd


Section "Predefined configuration" SEC03
  SetOutPath "$APPDATA\alfanous\configs"
  AccessControl::GrantOnFile "$APPDATA\alfanous\configs" "(BU)" "FullAccess"
  SetOverwrite try
   File "${ROOT_PATH}resources\configs\config.ini"
SectionEnd


Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Alfanous\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Alfanous\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\alfanousDesktop-win.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\alfanousDesktop-win.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "required"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "optional"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "recommended"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) is uninstalled completely from your computer."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "are you sure that you want to install completely $(^Name)and  all ots components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$APPDATA\alfanous\configs\*"

  Delete "$INSTDIR\*"


  Delete "$SMPROGRAMS\Alfanous\Uninstall.lnk"
  Delete "$SMPROGRAMS\Alfanous\Website.lnk"
  Delete "$STARTMENU.lnk"
  Delete "$DESKTOP\Alfanous.lnk"
  Delete "$SMPROGRAMS\Alfanous\Alfanous.lnk"

  RMDir  "$APPDATA\alfanous\configs"
  RMDir "$APPDATA\alfanous"
  RMDir "$SMPROGRAMS\Alfanous"
  RMDir "$INSTDIR"


  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd


