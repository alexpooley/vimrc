" http://www.wisestocktrader.com/indicators/1799-syntax-highlighting-for-texteditor-vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword amibrokerStatement open o close c high h low l volume v openint oi average a

syn keyword amibrokerFunction _N _TRACE abs AccDist acos AddColumn AddTextColumn AddToComposite ADLine AdvIssues AdvVolume ADX AlertIf AMA AMA2 ApplyStop atan ATR BarIndex BarsSince BBandBot BBandTop BeginValue CategoryAddSymbol CategoryGetName CategoryGetSymbols CategoryRemoveSymbol CCI ceil Chaikin Correlation cos CreateObject CreateStaticObject Cross Cum Date DateNum DateTime Day DayOfWeek DayOfYear DecIssues DecVolume DEMA EMA EnableRotationalTrading EnableScript EnableTextOutput EncodeColor EndValue Equity exp ExRem ExRemSpan fclose feof fgets Flip floor fopen Foreign fputs frac FullName GapDown GapUp GetBaseIndex GetCategorySymbols GetChartID GetDatabaseName GetExtraData GetScriptObject GroupID HHV HHVBars Highest HighestBars HighestSince HighestSinceBars Hold Hour IIf IndustryID Inside int Interval InWatchList IsEmpty IsFavorite IsFinite IsIndex IsNan IsNull IsTrue LastValue LineArray LinearReg LinRegIntercept LinRegSlope LLV LLVBars log log10 Lowest LowestBars LowestSince LowestSinceBars MA MACD MarketID Max MDI Median MFI Min Minute Month Name Now NumToStr NVI Nz OBV Optimize OscP OscV Outside Param ParamColor ParamStr PDI Peak PeakBars Percentile Plot PlotForeign PlotGrid PlotOHLC PlotShapes PlotVAPOverlay Prec Prefs printf PVI Random Ref RelStrength RestorePriceArrays RMI ROC round RSI RSIa RWI RWIHi RWILo SAR Second SectorID SelectedValue SetBarsRequired SetForeign SetFormulaName SetOption SetTradeDelays sign Signal sin sqrt Status StdErr StDev StochD StochK StrExtract StrFind StrFormat StrLeft StrLen StrMid StrRight StrToNum Study Sum tan TEMA TimeFrameCompress TimeFrameExpand TimeFrameGetPrice TimeFrameRestore TimeFrameSet TimeNum Trin Trix Trough TroughBars TSF Ultimate UncIssues UncVolume ValueWhen Version Wilders WMA WriteIf WriteVal Year Zig

syn keyword amibrokerStatement and BarCount buy buyprice colorDefault colorAqua colorBlack colorBlue colorBlueGrey colorBrightGreen colorBrown colorCustom1 colorCustom10 colorCustom11 colorCustom12 colorCustom13 colorCustom14 colorCustom15 colorCustom16 colorCustom2 colorCustom3 colorCustom4 colorCustom5 colorCustom6 colorCustom7 colorCustom8 colorCustom9 colorDarkBlue colorDarkGreen colorDarkGrey colorDarkOliveGreen colorDarkRed colorDarkTeal colorDarkYellow colorGold colorGreen colorGrey colorGrey colorIndigo colorLavender colorLightBlue colorLightGrey colorLightOrange colorLightYellow colorLime colorOrange colorPaleBlue colorPaleGreen colorPaleTurquoise colorPink colorPlum colorRed colorRose colorSeaGreen colorSkyblue colorTan colorTeal colorTurquoise colorViolet colorWhite colorYellow column0 column0format column0name column1 column1format column1name column2 column2format column2name column3 column3format column3name column4 column4format column4name column5 column5format column5name column6 column6format column6name column7 column7format column7name column8 column8format column8name column9 column9format column9name compressHigh compressLast compressLow compressOpen compressVolume cover coverprice expandLast expandFirst expandPoint false filter graph0 graph0barcolor graph0color graph0name graph0style graph1 graph1barcolor graph1color graph1name graph1style graph2 graph2barcolor graph2color graph2name graph2style graph3 graph3barcolor graph3color graph3name graph3style graph4 graph4barcolor graph4color graph4name graph4style graph5 graph5barcolor graph5color graph5name graph5style graph6 graph6barcolor graph6color graph6name graph6style graph7 graph7barcolor graph7color graph7name graph7style graph8 graph8barcolor graph8color graph8name graph8style graph9 graph9barcolor graph9color graph9name graph9style graphxspace graphzorder in15Minute in1Minute in5Minute inDaily inHourly inMonthly inWeekly margindeposit maxgraph not Null numcolumns or pointvalue PositionScore positionsize roundlotsize scoreNoRotate sell sellprice shapeCircle shapeDigit0 shapeDigit1 shapeDigit2 shapeDigit3 shapeDigit4 shapeDigit5 shapeDigit6 shapeDigit7 shapeDigit8 shapeDigit9 shapeDownArrow shapeDownTriangle shapeHollowCircle shapeHollowDownArrow shapeHollowDownTriangle shapeHollowSmallCircle shapeHollowSmallDownTriangle shapeHollowSmallSquare shapeHollowSmallUpTriangle shapeHollowSquare shapeHollowStar shapeHollowUpArrow shapeHollowUpTriangle shapeNone shapePositionAbove shapeSmallCircle shapeSmallDownTriangle shapeSmallSquare shapeSmallUpTriangle shapeSquare shapeStar shapeUpArrow shapeUpTriangle short shortprice styleArea styleBar styleCandle styleDots styleHistogram styleLeftAxisScale styleLine styleLog styleNoDraw styleNoLabel styleNoLine styleNoRescale styleOwnScale stylePointAndFigure styleStaircase styleSwingDots styleThick ticksize title true

syn keyword amibrokerConditional do else for function global #include #pragma if local procedure return while

if version >= 508 || !exists("did_amibroker_syntax_inits")
  if version < 508
    let did_amibroker_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink amibrokerStatement Statement
  HiLink amibrokerFunction Function
  HiLink amibrokerConditional Conditional
  delcommand HiLink
endif

let b:current_syntax = "amibroker"



"http://www.vim.org/scripts/script.php?script_id=3797
if exists("c_comment_strings")
  " A comment can contain cString, cCharacter and cNumber.
  " But a "*/" inside a cString in a cComment DOES end the comment!  So we
  " need to use a special type of cString: cCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match  cCommentSkip  contained "^\s*\*\($\|\s\+\)"
  syntax region cCommentString  contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=cSpecial,cCommentSkip
  syntax region cComment2String contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=cSpecial
  syntax region  cCommentL  start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cComment2String,cCharacter,cNumbersCom,cSpaceError,@Spell
  if exists("c_no_comment_fold")
    " Use "extend" here to have preprocessor lines not terminate halfway a
    " comment.
    syntax region cComment  matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell extend
  else
    syntax region cComment  matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell fold extend
  endif
else
  syn region  cCommentL start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
  if exists("c_no_comment_fold")
    syn region  cComment  matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell extend
  else
    syn region  cComment  matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell fold extend
  endif
endif





" set sw=2 sts=2 ts=8 noet:
