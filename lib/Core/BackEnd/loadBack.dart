import 'package:flutter/foundation.dart';

class LoadBackEnd with ChangeNotifier {
  int SelectindexButton = 0;
  int Selectindex = 0;
  int get slect => Selectindex;
  int get buttonslect => SelectindexButton;

  void SelectIndex(int Index) {
    Selectindex = Index;
    notifyListeners();
  }

  void SelectIndexButton(int Index) {
    SelectindexButton = Index;
    notifyListeners();
  }
}
