import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addt;

  NewTransaction(this.addt);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _itemControl = TextEditingController();
  final _amtControl = TextEditingController();
  DateTime _selectedDate;

  void _addItems(){
    if(_itemControl.text.isEmpty){
      return;
    }
    final enteredItem = _itemControl.text;
    final enteredAmt = double.parse(_amtControl.text);

    if(enteredItem.isEmpty || enteredAmt <=0 || _selectedDate == null)
      return;
      
     widget.addt(
       _itemControl.text,
       double.parse(_amtControl.text),
       _selectedDate,
       );
       //Navigator.of(context).pop();
  }

  void _currentDatePick() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020),
      lastDate: DateTime.now(), 
      ).then((pickedDate){
        if(pickedDate == null){
        return;
        }
        setState(() {
           _selectedDate = pickedDate;
        });
       
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
             elevation: 10,
             child: Container(
               padding: EdgeInsets.all(10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   TextField(decoration: InputDecoration(labelText: 'Item'),
                   controller: _itemControl,
                   onSubmitted: (_)=> _addItems,
                   /*onChanged: (val){
                     itemInput =val;
                   },*/
                   ),
                   TextField(decoration: InputDecoration(labelText: 'Amount'),
                   controller: _amtControl,
                   keyboardType: TextInputType.number,
                   onSubmitted: (_)=> _addItems ,
                   /*onChanged: (val){
                     amtInput = val;
                   },*/
                   ),
                   Container(
                     height: 50,
                     child: Row(children: <Widget>[
                       Expanded(
                         child: Text(_selectedDate == null ?
                         'no date chosen' : 
                         'Picked_Date: ${DateFormat.yMd().format(_selectedDate)}',
                         style: TextStyle(
                           color: Colors.purple[200],
                           fontSize: 10,
                           fontFamily: 'Quicksand',
                         ),
                         ),
                       ),
                       FlatButton(
                         onPressed: _currentDatePick,
                         color: Colors.purple[200],
                         child: Text('Choose date'),
                       ),
                     ],),
                   ),
                   RaisedButton(
                     onPressed: _addItems,
                     child: Text('add transaction'),
                     color: Colors.purple[100],
                   ),
                 ],
               ),
             ),
           );
  }
}