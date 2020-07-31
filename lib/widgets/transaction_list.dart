import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trans;
  final Function deletetrans; 

  TransactionList(this.trans, this.deletetrans);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 350,
      child: (trans.isEmpty) ? Column(children: <Widget>[
        Text('No transactions yet',
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 10,
        ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          child: Image.asset('assets/images/waitig.png', 
          fit: BoxFit.cover,)
          ),
      ],) : 
      ListView.builder(       //can use ListView(children[])
              itemBuilder: (ctx,index){
                return TransactionItem(trans: trans[index], deletetrans: deletetrans);
              },
              itemCount: trans.length,
      ),
    );
  }
}

