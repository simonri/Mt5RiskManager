#property copyright "Simon"
#property link      ""
#property version   "1.00"
string    Version = "1.00";

#include "RiskManager.mqh";

CRiskManager* ExtDialog;

int OnInit() {
   ExtDialog = new CRiskManager;

   if (!ExtDialog.Create(0, "Risk Manager (ver. " + Version + ")", 0, 0, 0)) return INIT_FAILED;
   
   return(INIT_SUCCEEDED);
}
