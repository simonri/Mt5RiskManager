#include <Controls/Button.mqh>
#include <Controls/Dialog.mqh>
#include <Controls/CheckBox.mqh>
#include <Controls/Label.mqh>
#include <Arrays/List.mqh>

class CStringForList : public CObject {
public:
   string      name;
   CWnd*       obj;
   bool        hidden;
   CStringForList() {
      hidden = false;
   }
};
