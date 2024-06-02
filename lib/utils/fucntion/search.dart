import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/icon_button.dart';

// List<Widget>buildAppBarAction (){
//   if(isSearching){
//      return [ DefaultIconButton(iconData: Icons.close, onPressed: (){}) ];
//   }
//
//   else {
//     return [ DefaultIconButton(iconData: Icons.search, onPressed: startSearch) ];
//   }
//
// }
void startSearch({
  required context ,
})
{
  ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
}


void stopSearching(){
  clearSearch;

  // setState(){
  //   isSearching = false ;
  // }
}
void  clearSearch(){

  // setState(){
  //   searchController.clear();
  // }
  // navigateBack(context: context);
}