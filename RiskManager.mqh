#include <Controls/Button.mqh>
#include <Controls/Dialog.mqh>
#include <Controls/CheckBox.mqh>
#include <Controls/Label.mqh>
#include <Arrays\List.mqh>

class CRiskManager : public CAppDialog {
private:
  string m_FileName;

public:
  CRiskManager(void);
  ~CRiskManager(void);

  void UpdateFileName(void);
  void InitVariables(void);
};

CRiskManager::CRiskManager(void) {
  UpdateFileName();
  InitVariables();
}

CRiskManager::~CRiskManager(void) {}

void CRiskManager::UpdateFileName(void) {
  m_FileName = "RiskManager_" + Symbol() + IntegerToString(ChartID());
  StringReplace(m_FileName, ".", "_dot_");
  m_FileName += ".txt";
}

void CRiskManager::InitVariables(void) { }
