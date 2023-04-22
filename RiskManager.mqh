#include <Controls/Button.mqh>
#include <Controls/Dialog.mqh>
#include <Controls/CheckBox.mqh>
#include <Controls/Label.mqh>
#include <Arrays\List.mqh>

class CRiskManager : public CAppDialog {
private:
  string fileName;
  double dpiScale;
  int panelWidth;

public:
  CRiskManager(void);
  ~CRiskManager(void);

  void UpdateFileName(void);
  void InitVariables(void);
  virtual bool Create(const long chart, const string name, const int subwin, const int x1, const int y1);
};

CRiskManager::CRiskManager(void) {
  UpdateFileName();
  InitVariables();
}

CRiskManager::~CRiskManager(void) {}

void CRiskManager::UpdateFileName(void) {
  fileName = "RiskManager_" + Symbol() + IntegerToString(ChartID());
  StringReplace(fileName, ".", "_dot_");
  fileName += ".txt";
}

void CRiskManager::InitVariables(void) { }

bool CRiskManager::Create(const long chart, const string name, const int subwin, const int x1, const int y1) {
  double screenDpi = (double) TerminalInfoInteger(TERMINAL_SCREEN_DPI);
  dpiScale = screenDpi / 96.0;

  panelWidth = 350;

  int x2 = x1 + (int) MathRound(panelWidth * dpiScale);
  int y2 = y1 + (int) MathRound(570 * dpiScale);

  if (!CAppDialog::Create(chart, name, subwin, x1, y1, x2, y2)) return false;

  return true;
}
