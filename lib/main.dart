import 'package:flutter/material.dart';
import 'dart:ui';

import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Flutter App',
    );

  }
}
class MyHomePage extends StatefulWidget {
  
 // String itemInput;
  //String amtInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _userTransactions =[
    /*Transaction(
      id: 't1', item:'coffee', price:45.00 , date:  DateTime.now(), 
    ),
    Transaction(
      id: 't2', item:'tea', price:55.50 , date:  DateTime.now(), 
    ),*/];

    List<Transaction> get _recentTransactions{
      return _userTransactions.where((tx){
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
            )
            );
      }).toList();
    }

  void _addTrans(String aItem,double aAmt, DateTime chosenDate){
    final newTx = Transaction(
      item: aItem,
      price: aAmt,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  void _startNewTransAdd(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bctx) {
      return GestureDetector( 
        onTap: () {},
      child: NewTransaction(_addTrans),
      behavior: HitTestBehavior.opaque,
      );
    },);
  }

  void _deletetx(String id){
    setState(() {
      _userTransactions.removeWhere((tx){
        return (tx.id==id);
      });
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar: AppBar(
         title: Text('Expense Chart',
         style: TextStyle(fontFamily: 'Quicksand'),),
         centerTitle: true,
         backgroundColor: Colors.purple[600],
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.add, color: Colors.purple[100],),
             onPressed: () => _startNewTransAdd(context),
             )
         ],
       ),
       body: SingleChildScrollView(
                 child: Column(
           //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deletetx),
               
             ],
         ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed:  () => _startNewTransAdd(context),
         backgroundColor: Colors.purple,
       ),
     );
  
  }
}