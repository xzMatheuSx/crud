import 'dart:html';

InputElement? inputElement = querySelector('#input') as InputElement?;
UListElement? listElement = querySelector('#list') as UListElement?;
ButtonElement? addButton = querySelector('#add') as ButtonElement?;
ButtonElement? updateButton = querySelector('#update') as ButtonElement?;
ButtonElement? deleteButton = querySelector('#delete') as ButtonElement?;

List<String> items = [];

int? selectedIndex;

void main() {
  addButton?.onClick.listen((event) {
    items.add(inputElement?.value ?? '');
    inputElement?.value = '';
    updateList();
   
  });

  updateButton?.onClick.listen((event) {
    if (selectedIndex != null) {
      items[selectedIndex!] = inputElement?.value ?? '';
      inputElement?.value = '';
      updateList();
    }
  });

  deleteButton?.onClick.listen((event) {
    if (selectedIndex != null) {
      items.removeAt(selectedIndex!);
      inputElement?.value = '';
      updateList();
    }
  });
}

void updateList() {
  listElement?.children.clear();

  for (int i = 0; i < items.length; i++) {
    String item = items[i];
    LIElement liElement = LIElement();
    liElement.text = item;
    liElement.onClick.listen((event) {
      selectedIndex = i;
      inputElement?.value = item;
    });
   
  }
}

