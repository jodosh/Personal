�
 TDIAGFORM 0�  TPF0	TDiagFormDiagFormLeftTopjHelpContextBorderIconsbiSystemMenubiHelp BorderStylebsDialogCaptionDiagnosticsClientHeight�ClientWidth� Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnCreate
FormCreateOnShowFormShow
DesignSize� � PixelsPerInch`
TextHeight 	TGroupBoxgrpInfoLeftTop Width� Height� Caption Info TabOrder  TLabellblAliveLeftTopWidthHeight	AlignmenttaRightJustifyCaptionAlive  TLabel
lblVersionLeftTop,Width#Height	AlignmenttaRightJustifyCaptionVersion  TLabel
lblBatteryLeftTopDWidth!Height	AlignmenttaRightJustifyCaptionBattery  TLabellblPortLeftTop\WidthHeight	AlignmenttaRightJustifyCaptionPort  TLabel
lblProgramLeft
ToptWidth'Height	AlignmenttaRightJustifyCaptionProgram  TPanelAliveLeft8TopWidth� Height
BevelOuter	bvLoweredCaptionBrick is aliveTabOrder   TPanelVersionLeft8Top(Width� Height
BevelOuter	bvLoweredCaption0TabOrder  TButton
RefreshBtnLeft� Top� WidthHHeightHelpContext�2Caption&RefreshTabOrderOnClickRefreshBtnClick  TPanelPortLeft8TopXWidth� Height
BevelOuter	bvLoweredCaption0TabOrder  TPanelProgramNumbLeft8ToppWidth� Height
BevelOuter	bvLoweredCaption0TabOrder  TPanel	BatStatusLeft8Top@Width� Height
BevelOuter	bvLoweredCaption0TabOrder   	TGroupBoxIRGroupLeftTop� Width� Height)Caption Infrared Power TabOrder TRadioButtonIRShortLeft0TopWidth9HeightHelpContext�2Caption&ShortTabOrder OnClickIRShortClick  TRadioButtonIRLongLeft� TopWidth1HeightHelpContext�2Caption&LongChecked	TabOrderTabStop	OnClickIRLongClick   	TGroupBox
WatchGroupLeftTopWidth� Height)Caption Watch TabOrder TLabellblTimeLeftTopWidthHeight	AlignmenttaRightJustifyCaptionTime  TButton
CurrentBtnLeft� TopWidthHHeightHelpContext�2CaptionSet &CurrentTabOrder OnClickCurrentBtnClick  TPanelWatchLeft8TopWidthAHeight
BevelOuter	bvLoweredCaption0TabOrder   	TGroupBoxDisplayGroupLeftTop@Width� HeightjCaption	 Display TabOrder TLabellblPrecisionLeftsTopWidth.HeightCaption&Precision:FocusControlcboPrecision  TLabel	lblSourceLeftTop/Width%HeightCaptionS&ource:  TLabellblValueLeftTopMWidthHeightCaption&Value:  	TComboBoxDisplayTypeLeftTopWidthaHeightHelpContext�2StylecsDropDownList
ItemHeightTabOrder OnChangeDisplayTypeChange  TButtonbtnUpdateDisplayLeft� TopGWidthHHeightHelpContext�2Caption&UpdateTabOrderOnClickbtnUpdateDisplayClick  	TComboBoxcboPrecisionLeft� TopWidth1HeightHelpContext�2StylecsDropDownList
ItemHeightTabOrderItems.Strings01234   	TComboBox	cboSourceLeft8Top+Width� HeightHelpContext�2StylecsDropDownList
ItemHeightTabOrderOnChangecboSourceChange  TUpDownudValueLeftiTopHWidthHeightHelpContext�2	AssociateedtValueTabOrder	Thousands  TEditedtValueLeft8TopHWidth1HeightHelpContext�2	MaxLengthTabOrderText0OnExitedtValueExit
OnKeyPressedtValueKeyPress   	TGroupBox
PowerGroupLeftTop� Width� Height1Caption Power Down TabOrder TLabel
lblMinutesLeftTopWidth%Height	AlignmenttaRightJustifyCaption&MinutesFocusControl	PowerDown  	TSpinEdit	PowerDownLeft@TopWidth9HeightHelpContext�2	MaxLengthMaxValue� MinValue TabOrder ValueOnChangePowerDownChange   TButtonbtnHelpLeftbTop�Width4HeightHelpContext�2AnchorsakLeftakBottom Caption&HelpTabOrderOnClickbtnHelpClick  	TGroupBox
grpNXTDiagLeftTop� Width� Height� CaptionNXT InfoTabOrder TLabelLabel1LeftTopWidthHeight	AlignmenttaRightJustifyCaptionName  TLabelLabel2Left
Top,Width'Height	AlignmenttaRightJustifyCaptionBT Addr  TLabelLabel3LeftTopDWidth.Height	AlignmenttaRightJustifyCaption	BT Signal  TLabelLabel4LeftTop\Width.Height	AlignmenttaRightJustifyCaptionFree mem  TPanelNXTNameLeft8TopWidth� Height
BevelOuter	bvLoweredTabOrder   TPanel	BTAddressLeft8Top(Width� Height
BevelOuter	bvLoweredTabOrder  TPanelBTSignalLeft8Top@Width� Height
BevelOuter	bvLoweredTabOrder  TPanel
FreeMemoryLeft8TopXWidth� Height
BevelOuter	bvLoweredTabOrder  TButtonbtnRefreshNXTLeft� TopqWidthHHeightHelpContext�2Caption&RefreshTabOrderOnClickbtnRefreshNXTClick    