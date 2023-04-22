#include "Defines.mqh"

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
  virtual bool Run(void) {
    return (CAppDialog::Run());
  }

private:
  virtual bool CreateObjects(void);

  virtual bool ButtonCreate(CList* list, CButton& btn, int x1, int y1, int x2, int y2, string name, string text, string tooltip = "\n");
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
  if (!CreateObjects()) return false;

  return true;
}

bool CRiskManager::ButtonCreate(CList* list, CButton& btn, int x1, int y1, int x2, int y2, string name, string text, string tooltip) {
  if (!btn.Create(m_chart_id, m_name + name, m_subwin, x1, y1, x2, y2)) return false;
  if (!Add(btn)) return false;
  if (!btn.Text(text)) return false;
  
  ObjectSetString(ChartID(), m_name + name, OBJPROP_TOOLTIP, tooltip);

  if (list != NULL) {
    CStringForList* obj = new CStringForList;
    obj.name = name;
    obj.obj = GetPointer(btn);
    list.Add(obj);
  }

  return true;
}

bool CRiskManager::CreateObjects(void) {
  return true;
}
