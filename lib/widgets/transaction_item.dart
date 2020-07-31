import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.trans,
    @required this.deletetrans,
  }) : super(key: key);

  final Transaction trans;
  final Function deletetrans;

  @override
  Widget build(BuildContext context) {
    return Card(
         
           child: Row(children: <Widget>[
             Container(
               child: Text('\$' + trans.price.toStringAsFixed(2),
               ),
               margin: EdgeInsets.symmetric(
                 vertical: 10,
                 horizontal: 10,
               ),
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.purple,
                   width: 5), 
                   ),
               ),
             Container(
               
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: <Widget>[
                 Text(trans.item,
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   fontFamily: 'Quicksand',
                   ),
                   ),

                 Text(DateFormat.yMMMd().format(trans.date),
                 style: TextStyle(
                   fontSize: 10,
                   fontFamily: 'Quicksand',
                   color: Colors.grey[600],
                 ),
                 ),

               ],
               ),
             ),
        IconButton(icon: Icon(Icons.delete),color: Colors.red,alignment: Alignment.centerRight,
        onPressed: ()=>deletetrans(trans.id),
        )     
           ],
           ),
        
         );
  }
}