import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud2/data/dummy_user.dart';
import 'package:flutter_crud2/models/user.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...dummyUser};

  List<User> get all{
    return[..._items.values];
  }

  int get count{
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

 
//Verificando se o usuário é nulo
  void put(User user){
    if (user == null) {
      return;      
    }
    
//Alterar
  if (user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
    _items.update(user.id, (_) => user);

//Adicionar    
  }else{
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => User(id: id, name: user.name, email: user.email, avatarURL: user.avatarURL));
  }
    notifyListeners();   
  }

//Deletar
  void remove(User user){
    if (user != null && user.id != null) {

      _items.remove(user.id);
      notifyListeners();
      
    }
  }
}